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
import com.hb.tripus.model.dto.TourAreaDto;
import com.hb.tripus.model.dto.TourAreaInterface;
import com.hb.tripus.model.dto.UserDto;
import com.hb.tripus.service.MainService;
import com.hb.tripus.service.ServiceCommand;

@Controller
public class HomeController {
	@Autowired
	private HomeDao dao;

	private ServiceCommand service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		service = new MainService();
		session.setAttribute("mytripCode", 0);
		session.setAttribute("mytripDate", 0);
		try {
			// 최근검색지
			if(userInfo != null) {
				model.addAttribute("recentSearch", dao.getRecentSearch(userInfo.getId()));
			}
			model.addAttribute("list", ((MainService) service).getAreaList(userLang));	// 추천 여행코스
			model.addAttribute("topNote", dao.getTopNote());							// top5 여행노트
			model.addAttribute("topArea", dao.getTopArea());							// top5 여행지
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

	@ResponseBody
	@RequestMapping("searchGps")
	public List<Object> searchGps(@RequestParam String lat, @RequestParam String lng, @RequestParam int page, 
			@RequestParam int contenttypeid, HttpSession session) {
		service = new MainService();
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		List<Object> list = new ArrayList<Object>();
		list.addAll(((MainService)service).getGpsAreaList(lat, lng, page, userLang, contenttypeid));		// list data, pageCnt
		list.add(page);																						// curr page
		return list;
	}
	
	@RequestMapping(value = "search_mytrip", method = RequestMethod.GET)
	public String search(@RequestParam String tripdate, HttpSession session) {
		if(tripdate != null) session.setAttribute("mytripDate", tripdate);
		return "home/search";
	}

	@ResponseBody
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public List<Object> searchKeyword(@RequestParam String keyword, @RequestParam int curPage, @RequestParam int contenttypeid, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		List<Object> result = new ArrayList<Object>();
		try {
			service = new MainService();
			result.add(dao.searchArea(keyword));
			result.addAll(((MainService) service).searchKeyword(keyword, curPage, userLang, contenttypeid));
			result.add(keyword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("areaInfo/{areacode}")
	public String areaInfo(@PathVariable int areacode, Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		List<Object> list = new ArrayList<Object>();
		try {
			list.addAll(((MainService) service).getAreaContent(areacode, userLang));
			model.addAttribute("info", dao.selectOneAreaInfo(areacode));
			model.addAttribute("con1", list.get(0));
			model.addAttribute("con2", list.get(1));
			model.addAttribute("con3", list.get(2));
			if(userLang == 0) model.addAttribute("con4", list.get(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "tour/areaInfo";
	}
	
	@RequestMapping("areaInfoSearch/{areacode}/{contenttypeid}")
	public String areaInfoSearch(@PathVariable int areacode, @PathVariable int contenttypeid, Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		List<Object> list = new ArrayList<Object>();
		list.addAll(((MainService) service).searchAreaTypeContent(areacode, 1, userLang, contenttypeid));
		service = new MainService();
		model.addAttribute("tourList", list.get(0));
		return "tour/basiclist";
	}

	@RequestMapping("basicInfo/{areacode}/{sigungucode}")
	public String basicInfo(@PathVariable int areacode, @PathVariable int sigungucode, Model model, HttpSession session) {
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
				case 12: case 76 : // 관광지
					DtoClassName = "TouristDetailDto";
					viewPath = "tour/touristDetail";
					break;
				case 14: case 78 : // 문화시설
					DtoClassName = "CultureFacilityDto";
					viewPath = "tour/cultureDetail";
					break;
				case 15: case 85 : // 축제
					DtoClassName = "FestivalDetailDto";
					viewPath = "tour/festivalDetail";
					break;
				case 25: // 여행코스
					DtoClassName = "TourAreaRecommendDto";
					mav.addObject("subList", ((MainService) service).getSubDetailList(contentid, contenttypeid, "TourAreaRecommendDto2", userLang));
					viewPath = "tour/recoDetail";
					break;
				case 28: case 75 : // 레포츠
					DtoClassName = "TourAreaLeportsDto";
					viewPath = "tour/leportsDetail";
					break;
				case 32: case 80 : // 숙박
					DtoClassName = "TourAreaStayDto";
					mav.addObject("subList", ((MainService) service).getSubDetailList(contentid, contenttypeid, "TourAreaStaySubDto", userLang));
					viewPath = "tour/stayDetail";
					break;
				case 38: case 79 : // 쇼핑
					DtoClassName = "TourAreaShopDto";
					viewPath = "tour/shopDetail";
					break;
				case 39: case 82 : // 음식점
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
			Date currdate = new Date();
			SimpleDateFormat sdfdate = new SimpleDateFormat ("yyyy-MM-dd"); 
			SimpleDateFormat sdftime = new SimpleDateFormat ("hh:mm:ss");
			
			String date_str = sdfdate.format(currdate);
			String time_str = sdftime.format(currdate);
			
			ReviewDto bean = new ReviewDto(contentid, userInfo.getId(), userInfo.getNicname(), userInfo.getProfile(), review, date_str, time_str);
			dao.getReview_add(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("detailmap")
	public String detailMap(@RequestParam String mapx, @RequestParam String mapy, @RequestParam String title, Model model){
		model.addAttribute("title", title);
		model.addAttribute("mapx", mapx);
		model.addAttribute("mapy", mapy);
		return "tour/detailmap";
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
		String fileName = "http://203.236.209.203:8080/tripus/resources/upload/detailImg/" + file.getOriginalFilename();
		
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
	public int likeFlag(@RequestParam String contentid, @RequestParam int likeflag, @RequestParam int likeCnt, @RequestParam String contenttypeid,
			@RequestParam String title, @RequestParam String firstimage, @RequestParam String mapx, @RequestParam String mapy, @RequestParam int areacode,
			@RequestParam int sigungucode, HttpSession session) {
		LikeFlagDto bean = new LikeFlagDto(likeflag, contentid, ((UserDto)session.getAttribute("userInfo")).getId());
		System.out.println("areacode : " + areacode);
		System.out.println("sigungucode : " + sigungucode);
		try {
			if(likeflag == 0) {
				if(dao.getContentTable(contentid) != 0) {
					dao.updateContentLike(new TourAreaDto(contentid, contenttypeid, title, firstimage, mapx, mapy, areacode, sigungucode, ++likeCnt));
				} else {
					dao.insertContentLike(new TourAreaDto(contentid, contenttypeid, title, firstimage, mapx, mapy, areacode, sigungucode, 1));
				}
				dao.updateAreaLike(areacode, likeflag);
				dao.getLikeUp(bean);
				likeflag = 1;

			} else {
				if(dao.getContentTable(contentid) != 0) {
					dao.updateContentLike(new TourAreaDto(contentid, contenttypeid, title, firstimage, mapx, mapy, areacode, sigungucode, --likeCnt));
				} else {
					dao.insertContentLike(new TourAreaDto(contentid, contenttypeid, title, firstimage, mapx, mapy, areacode, sigungucode, 0));
				}
				dao.updateAreaLike(areacode, likeflag);
				dao.getLikeDown(bean);
				likeflag = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return likeflag;
	}
	
	@RequestMapping("allImg/{contentid}")
	public String allImg(@PathVariable String contentid, Model model) throws SQLException {
		model.addAttribute("imgList", dao.getAllImg(contentid));
		return "tour/allImg";
	}
	
}
