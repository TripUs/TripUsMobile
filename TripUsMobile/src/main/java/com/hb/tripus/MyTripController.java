package com.hb.tripus;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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

	@Autowired
	private JavaMailSender mailSender; 
		
	@RequestMapping("mytrip")
	public String myTrip(HttpSession session, Model model) {
		session.setAttribute("mytripCode", null);
		session.setAttribute("mytripDate", null);
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");

		if (userInfo != null) {
			// 여행리스트 반환
			try {
				List<MyTripDto> list = dao.getMyTrip(userInfo.getId());
				System.out.println("mytrip list size : " + list.size());
				model.addAttribute("tripList", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return "mytrip/mytrip";
	}

	@RequestMapping(value = "addmytrip", method = RequestMethod.GET)
	public String addMyTripPage() {
		return "mytrip/addmytrip";
	}

	@RequestMapping(value = "addmytrip", method = RequestMethod.POST)
	public String addMyTrip(@ModelAttribute MyTripDto bean, HttpSession session) {
		try {
			if (bean != null) {
				bean.setCode(dao.getCodeCnt()+1);
				String userid = ((UserDto) session.getAttribute("userInfo")).getId();
				dao.insertMyTrip(bean);
				dao.insertTripGroup(bean.getCode(), userid);
			
				int daynum = diffOfDate(bean.getStartdate().toString(), bean.getEnddate().toString()) + 1;
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date date = null;
				date = formatter.parse(bean.getStartdate().toString());
				
				for(int i=0; i<daynum; i++) {
					Calendar cal = Calendar.getInstance();
					cal.setTime(date);
					cal.add(Calendar.DATE, i);
					String tripdate = formatter.format(cal.getTime());

					MyTripListDto dto = new MyTripListDto(bean.getCode(), (i+1), tripdate);
					dao.insertMyTripList(dto);
				}
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
			model.addAttribute("tripList", list);
			
			List<MyTripDetailDto> list2 = dao.getMyTripDetail(bean.getCode());
			model.addAttribute("tripDetail", list2);
			session.setAttribute("mytripCode", bean.getCode());
			
			List<MyTripBbsDto> list3 = dao.getTripStory(bean.getCode());
			model.addAttribute("tripStory", list3);
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
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		int userLang = 0;
		if(userInfo != null) {
			userLang = userInfo.getLang();
		}
		try {
			if((code = (Integer)session.getAttribute("mytripCode")) != 0) {
				tripdate = (String)session.getAttribute("mytripDate");
				System.out.println("code : " + code + ", date : " + tripdate);
				service = new MainService();
				TourAreaBasicDto bean = (TourAreaBasicDto) ((MainService) service).getAreaInfo(contentid, userLang);
				
				MyTripDetailDto dto = new MyTripDetailDto(0, code, 0, tripdate, contentid, bean.getTitle(), bean.getFirstimage(), bean.getMapx(), bean.getMapy());
				dao.insertMyTripDetail(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../mytripdetail/" + code;
	}
	
	@RequestMapping(value = "delTrip/{contentid}", method = RequestMethod.GET)
	public String delTrip(@PathVariable String contentid, HttpSession session) {
		System.out.println("delTrip controller conid=" + contentid);
		int code = (Integer)session.getAttribute("mytripCode");
		try {
			dao.deleteMyTripList(code, contentid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../mytripdetail/" + code;
	}
	
	@RequestMapping(value="addstory/{tripnum}/{tripdate}", method=RequestMethod.GET)
	public String addTripStory(@PathVariable int tripnum, @PathVariable String tripdate, Model model) {
		System.out.println("1. tripnum : " + tripnum + ", tripdate : " + tripdate);
		model.addAttribute("tripnum", tripnum);
		model.addAttribute("tripdate", tripdate);
		return "mytrip/addstory";
	}
	
	@RequestMapping(value="addstory/{tripnum}/{tripdate}", method=RequestMethod.POST)
	public String insertTripStory(@PathVariable int tripnum, @PathVariable String tripdate, @RequestParam String memo, HttpSession session) {
		int code = (Integer) session.getAttribute("mytripCode");
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		System.out.println("2. tripnum : " + tripnum + ", tripdate : " + tripdate);
		MyTripBbsDto bean = null;
		try {
			int grp = dao.getGrpCnt() + 1;
			bean = new MyTripBbsDto(0, code, tripnum, grp, 0, 0, 
					tripdate, userInfo.getId(), userInfo.getNicname(), userInfo.getProfile(), memo, null);
			dao.insertTripStory(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../../mytripdetail/" + code;
	}
	
	@RequestMapping(value="replestory/{idx}", method=RequestMethod.GET)
	public String repleTripStory(@PathVariable int idx, Model model) {
		model.addAttribute("idx", idx);
		return "mytrip/replestory";
	}
	
	@RequestMapping(value="replestory/{idx}", method=RequestMethod.POST)
	public String insertRepleStory(@PathVariable int idx, @RequestParam String memo, HttpSession session) {
		int code = (Integer)session.getAttribute("mytripCode");
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		MyTripBbsDto bean = null;
		try {
			bean = dao.getOneTripStory(idx);						// select grp, seq, lvl
			dao.updateStorySeqLvl(bean.getSeq(), bean.getGrp());	// update seq
			
			bean.setUserid(userInfo.getId());
			bean.setUserprofile(userInfo.getProfile());
			bean.setSeq(bean.getSeq()+1);
			bean.setLvl(bean.getLvl()+1);
			String temp = "";
			for(int i=0; i<bean.getLvl(); i++) {
				temp += "&nbsp;";
			}
			bean.setUsernicname(temp + "└re: " + userInfo.getNicname());
			System.out.println(bean.getMemo());
			System.out.println("insert reple seq=" + bean.getSeq() + ", lvl=" + bean.getLvl());
			dao.insertStoryReple(bean);								// insert bbs data
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../mytripdetail/" + code;
	}
	
	@RequestMapping("invitefriend")
	public String inviteFriendPage(Model model, HttpSession session) {
		try {
			model.addAttribute("friendList", dao.getFriendList(((UserDto)session.getAttribute("userInfo")).getId()));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "mytrip/invitefriend";
	}
	
	@RequestMapping("invitefriend/{friendid}")
	public String inviteFriend(@PathVariable String friendid, HttpSession session) {
		int code = (Integer)session.getAttribute("mytripCode");
		try {
			dao.insertTripGroup(code, friendid);
			dao.updateTripUserNum(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../mytripdetail/" + code;
	}
	
	@RequestMapping("sendmail")
	public String sendMail(@RequestParam String address, HttpSession session) { 
		try {
			String from = "tripuscorp@gmail.com"; 
			String subject	= ((UserDto) session.getAttribute("userInfo")).getName() + " 님께서 TripUs로 초대하셨습니다.";	
			
			MimeMessage message = mailSender.createMimeMessage(); 

			String content = "<img src='http://localhost:8080/tripus/resources/imgs/mail/webMailImg2_h.png'/><br/>";
			content += "<h1><a href='http://localhost:8080/tripus/' style='text-decoration: none; color: blue;'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Go To TripUs</a></h1><br/><br/>";
			content += "<img src='http://localhost:8080/tripus/resources/imgs/mail/webMailImg2_f.png'/>";
			
			message.setFrom(new InternetAddress(from));  
			message.addRecipient(RecipientType.TO, new InternetAddress(address));
			message.setSubject(subject);
			message.setText(content, "utf-8", "html");
			mailSender.send(message); 
		} catch(Exception e){ 
			System.out.println(e); 
		} 
		return "redirect:invitefriend"; 
	}
	
	@RequestMapping("delMyTrip/{code}")
	public String delMyTrip(@PathVariable int code) {
		try {
			dao.deleteMyTrip(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../mytrip";
	}
}
