package com.hb.tripus;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hb.tripus.model.dao.HomeDao;
import com.hb.tripus.model.dto.AreaDto;
import com.hb.tripus.model.dto.TourAreaInterface;
import com.hb.tripus.service.MainService;
import com.hb.tripus.service.ServiceCommand;

@Controller
public class HomeController {
	@Autowired
	private HomeDao dao;

	private ServiceCommand service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}

	@RequestMapping("main")
	public String main(Model model) {
		service = new MainService();
		model.addAttribute("list", ((MainService) service).getAreaList());
		return "home/main";
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search() {
		return "home/search";
	}

	@RequestMapping(value = "search", method = RequestMethod.POST)
	public String searchKeyword(@RequestParam String keyword, Model model) {
		System.out.println(keyword);
		try {
			List<AreaDto> list = dao.searchArea(keyword);
			model.addAttribute("areaList", list);

			service = new MainService();
			model.addAttribute("keywordList", ((MainService) service).searchKeyword(keyword));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "home/search";
	}

	@RequestMapping("basicInfo")
	public String basicInfo(@RequestParam("areacode") int areacode, @RequestParam("sigungucode") int sigungucode,
			Model model) {
		System.out.println("basicInfo start");
		service = new MainService();
		model.addAttribute("tourList", ((MainService) service).getAreaList(areacode, sigungucode));
		return "tour/basiclist";
	}

	@RequestMapping("detail/{contentid}")
	public ModelAndView detailPage(@PathVariable("contentid") String contentid, Model model) {
		ModelAndView mav = new ModelAndView();
		service = new MainService();
		System.out.println("\ncontentid :" + contentid);
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
		mav.addObject("basicInfo", ((MainService) service).getAreaInfo(contentid));
		mav.addObject("detailInfo", ((MainService) service).getAreaDetailInfo(contentid, contenttypeid, DtoClassName));
		mav.setViewName(viewPath);
		return mav;
	}
	
	@RequestMapping(value = "upload", headers = "content-type=multipart/*", method = RequestMethod.POST)
	public String ImgUpload(@RequestParam String contentid, @RequestParam String contenttypeid, @RequestPart("file") MultipartFile file, Model model) {
		String path = "C:\\workspace\\sts_workspace\\TripUsMobile\\src\\main\\webapp\\resources\\upload\\detailImg\\";
		System.out.println("id:" + contentid);
		File f = new File(path + file.getOriginalFilename());
		System.out.println("���ϰ��:" + path + file.getOriginalFilename());
		try {
			file.transferTo(f);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("imgFileDown", file.getOriginalFilename());
		return "redirect:detail?contentid=" + contentid + "&contenttypeid=" + contenttypeid;
	}
}