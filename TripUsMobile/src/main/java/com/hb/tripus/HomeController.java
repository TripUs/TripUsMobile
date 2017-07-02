package com.hb.tripus;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hb.tripus.model.dao.HomeDao;
import com.hb.tripus.model.dto.AreaDto;
import com.hb.tripus.model.dto.LikeFlagDto;
import com.hb.tripus.model.dto.ReviewDto;
import com.hb.tripus.model.dto.TourAreaBasicDto;
import com.hb.tripus.model.dto.TourAreaInterface;
import com.hb.tripus.model.dto.UserDto;
import com.hb.tripus.service.MainService;
import com.hb.tripus.service.ServiceCommand;

@Controller
public class HomeController {
	@Autowired
	private HomeDao dao;

	private ServiceCommand service;

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		return "redirect:main";
//	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		service = new MainService();
		session.setAttribute("mytripCode", null);
		session.setAttribute("mytripDate", null);
		model.addAttribute("list", ((MainService) service).getAreaList());
		
		// �ֱٰ˻���
		try {
			UserDto userInfo = (UserDto) session.getAttribute("userInfo");
			if(userInfo != null) {
				model.addAttribute("recentSearch", dao.getRecentSearch(userInfo.getId()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "home/main";
	}

	@RequestMapping("home")
	public String goHome() {
		return "redirect:/";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search() {
		return "home/search";
	}

	
	@RequestMapping(value = "search_mytrip", method = RequestMethod.GET)
	public String search(@RequestParam String tripdate, HttpSession session) {
		System.out.println("tripdate : " + tripdate);
		if(tripdate != null) session.setAttribute("mytripDate", tripdate);
		return "home/search";
	}

	@ResponseBody
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public List<Object> searchKeyword(@RequestParam String keyword) {
		List<Object> result = new ArrayList<Object>();
		try {
			service = new MainService();
			String url = "searchKeyword?keyword=" + URLEncoder.encode(keyword, "UTF-8") + "&MobileOS=ETC&MobileApp=AppTesting";
			
			result.add(dao.searchArea(keyword));
			result.add(((MainService) service).searchKeyword(keyword, 1));
			result.add(((MainService) service).pageParser(url));
			result.add(1);
			result.add(keyword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "addsearchlist", method = RequestMethod.POST)
	public List<Object> addSearchList(@RequestParam int page, @RequestParam String keyword) {
		List<Object> list = new ArrayList<Object>();
		list.add(((MainService) service).searchKeyword(keyword, page+1));
		list.add(page+1);
		return list;
	}
	
	@RequestMapping("basicInfo")
	public String basicInfo(@RequestParam("areacode") int areacode, @RequestParam("sigungucode") int sigungucode,
			Model model) {
		service = new MainService();
		model.addAttribute("tourList", ((MainService) service).getAreaList(areacode, sigungucode));
		return "tour/basiclist";
	}

	@RequestMapping(value="detail/{contentid}", method=RequestMethod.GET)
	public ModelAndView detailPage(@PathVariable("contentid") String contentid, Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		service = new MainService();
		System.out.println("\ndetail Controller");
		System.out.println("contentid :" + contentid);
		
		try {
			String contenttypeid = ((MainService) service).getContentTypeInfo(contentid);
			String DtoClassName = "";
			String viewPath = "";
			
			switch (Integer.parseInt(contenttypeid)) {
				case 12: // ������
					DtoClassName = "TouristDetailDto";
					viewPath = "tour/touristDetail";
					break;
				case 14: // ��ȭ�ü�
					DtoClassName = "CultureFacilityDto";
					viewPath = "tour/cultureDetail";
					break;
				case 15: // ����
					DtoClassName = "FestivalDetailDto";
					viewPath = "tour/festivalDetail";
					break;
				case 25: // �����ڽ�
					DtoClassName = "TourAreaRecommendDto";
					mav.addObject("subList", ((MainService) service).getSubDetailList(contentid, contenttypeid, "TourAreaRecommendDto2"));
					viewPath = "tour/recoDetail";
					break;
				case 28: // ������
					DtoClassName = "TourAreaLeportsDto";
					viewPath = "tour/leportsDetail";
					break;
				case 32: // ����
					DtoClassName = "TourAreaStayDto";
					mav.addObject("subList", ((MainService) service).getSubDetailList(contentid, contenttypeid, "TourAreaStaySubDto"));
					viewPath = "tour/stayDetail";
					break;
				case 38: // ����
					DtoClassName = "TourAreaShopDto";
					viewPath = "tour/shopDetail";
					break;
				case 39: // ������
					DtoClassName = "TourAreaFoodDto";
					viewPath = "tour/foodDetail";
					break;
				default:
					break;
			}
			TourAreaBasicDto bean = (TourAreaBasicDto) ((MainService) service).getAreaInfo(contentid);
			
			// �ֱ� �˻��� �߰�
			if(userInfo != null && dao.checkRecentSearch(userInfo.getId(), contentid) == 0) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("userid", userInfo.getId());
				map.put("contentid", bean.getContentid());
				map.put("firstimage", bean.getFirstimage());
				map.put("title", bean.getTitle());
				try {
					dao.insertRecentSearch(map);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			int likeflag = 0;
			if(userInfo != null) likeflag = dao.getUserLikeFlag(new LikeFlagDto(0, contentid, ((UserDto)session.getAttribute("userInfo")).getId()));
			int likeCnt = dao.getLikeFlag(contentid);
			List<ReviewDto> review = dao.getReview(contentid);
			List<String> areaImg = dao.getAreaImg(contentid);
			
			System.out.println("size : " + review.size());
			
			mav.addObject("areaImg", areaImg);
			mav.addObject("review", review);
			mav.addObject("likeCnt",likeCnt);
			mav.addObject("likeflag",likeflag);
			mav.addObject("basicInfo", bean);
			mav.addObject("detailInfo", ((MainService) service).getAreaDetailInfo(contentid, contenttypeid, DtoClassName));
			mav.setViewName(viewPath);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping(value="detail/{contentid}", method=RequestMethod.POST)
	public void tourDetailInsertReview(@PathVariable String contentid, @RequestParam String review, HttpSession session) {
		System.out.println("review id" + contentid);
		try {
			UserDto userInfo = (UserDto) session.getAttribute("userInfo");
			ReviewDto bean = new ReviewDto(contentid, userInfo.getId(), userInfo.getNicname(), userInfo.getProfile(), review, null);
			dao.getReview_add(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "uploadImg", headers = "content-type=multipart/form-data", method = RequestMethod.POST)
	public String ImgUpload(@RequestParam String contentid, @RequestPart("file") MultipartFile file, Model model, HttpServletRequest req) {
		@SuppressWarnings("deprecation")
		String path = req.getRealPath("/resources/upload/detailImg").replaceAll("\\\\", "/");
		File f = new File(path + "\\" + file.getOriginalFilename());
		String fileName = "http://localhost:8080/tripus/resources/upload/detailImg/" + file.getOriginalFilename();
		
		try {
			file.transferTo(f);
			dao.insertAreaImg(contentid, fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	@ResponseBody
	@RequestMapping(value = "likeupdate", method = RequestMethod.POST)
	public int likeFlag(@RequestParam String contentid, @RequestParam int likeflag, HttpSession session) throws SQLException{
		LikeFlagDto bean = new LikeFlagDto(likeflag, contentid, ((UserDto)session.getAttribute("userInfo")).getId());
		if(likeflag == 0) {
			dao.getLikeUp(bean);
			likeflag = 1;
		} else {
			dao.getLikeDown(bean);
			likeflag = 0;
		}
		return likeflag;
	}
	
}
