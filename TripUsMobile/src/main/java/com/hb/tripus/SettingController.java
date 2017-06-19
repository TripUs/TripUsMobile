package com.hb.tripus;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hb.tripus.model.dao.SettingDao;
import com.hb.tripus.model.dto.UserDto;

@Controller
public class SettingController {
	@Autowired
	private SettingDao dao;
	
	@RequestMapping("setting")
	public String setting() {
		return "setting/setting";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginPage() {
		return "login/login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@ModelAttribute UserDto bean, HttpSession session, Model model) {
		
		try {
			UserDto userInfo = dao.loginUser(bean);
			if(userInfo.getId() == null) {
				System.out.println("로그인 실패");
				System.out.println("id : " + userInfo.getId());
			} else {
				System.out.println("로그인 성공");
				System.out.println("id : " + userInfo.getId());
				session.setAttribute("userInfo", userInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "setting/setting";
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		if(userInfo != null) {
			session.invalidate();
		}
		return "setting/setting";
	}
	
	@RequestMapping(value="signin", method=RequestMethod.GET)
	public String signinPage(@ModelAttribute UserDto bean, Model model) {
		return "login/signin";
	}
	
	@RequestMapping(value="signin", method=RequestMethod.POST)
	public String signin(@ModelAttribute UserDto bean, Model model) {
		try {
			dao.insertUser(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:main";
	}
	
}
