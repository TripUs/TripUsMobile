package com.hb.tripus;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hb.tripus.model.dao.MyTripDao;
import com.hb.tripus.model.dto.MyTripBbsDto;
import com.hb.tripus.model.dto.MyTripDetailDto;
import com.hb.tripus.model.dto.MyTripDto;
import com.hb.tripus.model.dto.MyTripListDto;
import com.hb.tripus.model.dto.TourAreaBasicDto;
import com.hb.tripus.model.dto.UserDto;
import com.hb.tripus.service.MainService;
import com.hb.tripus.service.ServiceCommand;

@Controller
public class MyTripController {

	@Autowired
	private MyTripDao dao;
	private ServiceCommand service;

	@RequestMapping("mytrip")
	public String myTrip(HttpSession session, Model model) {
		System.out.println("mytrip controller");
		session.setAttribute("mytripCode", null);
		session.setAttribute("mytripDate", null);
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");

		if (userInfo != null) {
			// 여행리스트 반환
			try {
				List<MyTripDto> list = dao.getMyTrip(userInfo.getId());
				model.addAttribute("tripList", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return "mytrip/mytrip";
	}

	@RequestMapping(value = "addmytrip", method = RequestMethod.GET)
	public String addMyTripPage() {
		System.out.println("addmytrip get controller");
		return "mytrip/addmytrip";
	}

	@RequestMapping(value = "addmytrip", method = RequestMethod.POST)
	public String addMyTrip(@ModelAttribute MyTripDto bean, HttpSession session) {
		System.out.println("addmytrip post controller");
		System.out.println(bean.getTitle());
		try {
			if (bean != null) {
				bean.setUserid(((UserDto) session.getAttribute("userInfo")).getId());
				dao.insertMyTrip(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:mytrip";
	}

	@RequestMapping("mytripdetail/{mytripcode}")
	public String myTripDetail(@PathVariable int mytripcode, Model model, HttpSession session) {
		System.out.println("mytripdetail controller");
		try {
			MyTripDto bean = dao.getMyTripSelectOne(mytripcode);
			model.addAttribute("mytrip", bean);

			List<MyTripListDto> list = dao.getMyTripList(bean.getCode());
			System.out.println("list size : " + list.size());
			
			if(list.size() == 0) {
				System.out.println("My Trip List is Null");
				int daynum = diffOfDate(bean.getStartdate().toString(), bean.getEnddate().toString()) + 1;
	//			System.out.println("date num : " + daynum);
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date date = null;
				date = formatter.parse(bean.getStartdate().toString());
				
				for(int i=0; i<daynum; i++) {
					Calendar cal = Calendar.getInstance();
					cal.setTime(date);
					cal.add(Calendar.DATE, i);
					String tripdate = formatter.format(cal.getTime());
	//				System.out.println("tripdate : " + tripdate);
					
					MyTripListDto dto = new MyTripListDto(bean.getCode(), (i+1), tripdate);
					dao.insertMyTripList(dto);
					list.add(dto);
				}
			}
			model.addAttribute("tripList", list);
			
			List<MyTripDetailDto> list2 = dao.getMyTripDetail(bean.getCode());
			model.addAttribute("tripDetail", list2);
			System.out.println("tripDetail : " + list2.size());
			session.setAttribute("mytripCode", bean.getCode());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mytrip/mytripDetail";
	}

	public int diffOfDate(String begin, String end) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Date beginDate = formatter.parse(begin);
		Date endDate = formatter.parse(end);

		long diff = endDate.getTime() - beginDate.getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);

		return (int) diffDays;
	}
	
	@RequestMapping("addmytrip_list/{contentid}")
	public String addMyTripList(@PathVariable String contentid, HttpSession session) {
		int code = 0;
		String tripdate = null;
		try {
			if((code = (Integer)session.getAttribute("mytripCode")) != 0) {
				tripdate = (String)session.getAttribute("mytripDate");
				System.out.println("code : " + code + ", date : " + tripdate);
				service = new MainService();
				TourAreaBasicDto bean = (TourAreaBasicDto) ((MainService) service).getAreaInfo(contentid);
				
				MyTripDetailDto dto = new MyTripDetailDto(0, code, 0, tripdate, contentid, bean.getTitle(), bean.getFirstimage(), bean.getMapx(), bean.getMapy());
				dao.insertMyTripDetail(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../mytripdetail/" + code;
	}
	
	@RequestMapping(value="addstory", method=RequestMethod.GET)
	public String addTripStory() {
		return "mytrip/addstory";
	}
	
	@RequestMapping(value="addstory", method=RequestMethod.POST)
	public String insertTripStory(@RequestParam String story, HttpSession session) {
		int code = (Integer) session.getAttribute("mytripCode");
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		
		MyTripBbsDto bean = new MyTripBbsDto();
		bean.setTripdate("");
		
		return "redirect:mytripdetail/" + code;
	}
	
}
