package com.hb.tripus;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import com.hb.tripus.model.dto.MyTripBbsDto;
import com.hb.tripus.model.dto.MyTripDetailDto;
import com.hb.tripus.model.dto.MyTripDto;
import com.hb.tripus.model.dto.MyTripListDto;
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
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		
		service = new MainService();
		session.setAttribute("mytripCode", null);
		session.setAttribute("mytripDate", null);
		model.addAttribute("list", ((MainService) service).getAreaList(userLang));
		
		// 최근검색지
		try {
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
		if(tripdate != null) session.setAttribute("mytripDate", tripdate);
		return "home/search";
	}

	@ResponseBody
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public List<Object> searchKeyword(@RequestParam String keyword, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		List<Object> result = new ArrayList<Object>();
		try {
			service = new MainService();
			String url = "searchKeyword?keyword=" + URLEncoder.encode(keyword, "UTF-8") + "&MobileOS=ETC&MobileApp=AppTesting";
			
			result.add(dao.searchArea(keyword));
			result.add(((MainService) service).searchKeyword(keyword, 1, userLang));
			result.add(((MainService) service).pageParser(url, userLang));
			result.add(1);
			result.add(keyword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "addsearchlist", method = RequestMethod.POST)
	public List<Object> addSearchList(@RequestParam int page, @RequestParam String keyword, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		
		List<Object> list = new ArrayList<Object>();
		list.add(((MainService) service).searchKeyword(keyword, page+1, userLang));
		list.add(page+1);
		return list;
	}
	
	@RequestMapping("basicInfo")
	public String basicInfo(@RequestParam("areacode") int areacode, @RequestParam("sigungucode") int sigungucode,
			Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		
		service = new MainService();
		model.addAttribute("tourList", ((MainService) service).getAreaList(areacode, sigungucode, userLang));
		return "tour/basiclist";
	}

	@RequestMapping(value="detail/{contentid}", method=RequestMethod.GET)
	public ModelAndView detailPage(@PathVariable("contentid") String contentid, Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		service = new MainService();
		
		try {
			String contenttypeid = ((MainService) service).getContentTypeInfo(contentid, userLang);
			String DtoClassName = "";
			String viewPath = "";
			
			switch (Integer.parseInt(contenttypeid)) {
				case 12: // 관광지
					DtoClassName = "TouristDetailDto";
					viewPath = "tour/touristDetail";
					break;
				case 14: // 문화시설
					DtoClassName = "CultureFacilityDto";
					viewPath = "tour/cultureDetail";
					break;
				case 15: // 축제
					DtoClassName = "FestivalDetailDto";
					viewPath = "tour/festivalDetail";
					break;
				case 25: // 여행코스
					DtoClassName = "TourAreaRecommendDto";
					mav.addObject("subList", ((MainService) service).getSubDetailList(contentid, contenttypeid, "TourAreaRecommendDto2", userLang));
					viewPath = "tour/recoDetail";
					break;
				case 28: // 레포츠
					DtoClassName = "TourAreaLeportsDto";
					viewPath = "tour/leportsDetail";
					break;
				case 32: // 숙박
					DtoClassName = "TourAreaStayDto";
					mav.addObject("subList", ((MainService) service).getSubDetailList(contentid, contenttypeid, "TourAreaStaySubDto", userLang));
					viewPath = "tour/stayDetail";
					break;
				case 38: // 쇼핑
					DtoClassName = "TourAreaShopDto";
					viewPath = "tour/shopDetail";
					break;
				case 39: // 음식점
					DtoClassName = "TourAreaFoodDto";
					viewPath = "tour/foodDetail";
					break;
				default:
					break;
			}
			TourAreaBasicDto bean = (TourAreaBasicDto) ((MainService) service).getAreaInfo(contentid, userLang);
			
			// 최근 검색지 추가
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
			mav.addObject("detailInfo", ((MainService) service).getAreaDetailInfo(contentid, contenttypeid, DtoClassName, userLang));
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
	@RequestMapping(value="getMyTrip", method=RequestMethod.POST)
	public List<MyTripDto> myTrip(HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		List<MyTripDto> list = null;
		try {
			list = dao.getMyTrip(userInfo.getId());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@ResponseBody
	@RequestMapping("getMyTripDetail")
	public List<MyTripListDto> myTripDetail(@RequestParam int mytripcode, HttpSession session) {
		List<MyTripListDto> list = null;
		try {
			list = dao.getMyTripList(mytripcode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@ResponseBody
	@RequestMapping("addTrip")
	public void addMyTripList(@RequestParam String contentid, @RequestParam int code, @RequestParam String title, @RequestParam String tripdate,
			@RequestParam String firstimage, @RequestParam String mapx, @RequestParam String mapy, HttpSession session) {
		try {
			System.out.println(contentid + " : " + code + " : " + title + " : " + tripdate + " : " + firstimage + " : " + mapx + " : " + mapy);
			MyTripDetailDto bean = new MyTripDetailDto(0, code, 0, tripdate, contentid, title, firstimage, mapx, mapy);
			dao.insertMyTripDetail(bean);
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
