package com.hb.tripus;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hb.tripus.model.dao.SettingDao;
import com.hb.tripus.model.dto.UserDto;



@Controller
public class SettingController {
	@Autowired
	private SettingDao dao;
	/* GoogleLogin */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
		
	@RequestMapping("setting")
	public String setting() {
		return "setting/setting";
	}
	
	// �α��� ù ȭ�� ��û �޼ҵ�
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		/* ����code ���� */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("google_url", url);

		return "login/login";
	}
	
	// ���� Callbackȣ�� �޼ҵ�
	@RequestMapping(value = "oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code, HttpSession session) throws IOException {
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null); 
		String accessToken = accessGrant.getAccessToken(); 
		Long expireTime = accessGrant.getExpireTime(); 
		if (expireTime != null && expireTime < System.currentTimeMillis()) { 
			accessToken = accessGrant.getRefreshToken(); 
			System.out.println("accessToken is expired. refresh token = {" + accessToken + "}"); 
		} 
		
		Connection<Google>connection = googleConnectionFactory.createConnection(accessGrant); 
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi(); 
		PlusOperations plusOperations = google.plusOperations(); 
		Person person = plusOperations.getGoogleProfile();
		
		// ����� ��ü ����
		UserDto userInfo = new UserDto();
		userInfo.setId(person.getId());				userInfo.setPw(person.getId());
		userInfo.setName(person.toString());		userInfo.setNicname(person.toString());
		if(person.getBirthday() != null) userInfo.setBirthday(person.getBirthday().toString());
		else userInfo.setBirthday("2000-01-01");
		if(person.getAccountEmail() != null) userInfo.setEmail(person.getAccountEmail());
		else userInfo.setEmail("");
		if(person.getImageUrl() != null) userInfo.setProfile(person.getImageUrl());
		else userInfo.setProfile("");
		userInfo.setUsertype("google");
		
		// ����� ���� DB ����
		try {
			if(dao.searchUser(userInfo.getId()) != 0) userInfo = dao.loginUser(userInfo);
			else dao.insertUser(userInfo);
			session.setAttribute("userInfo", userInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "setting/setting";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@ModelAttribute UserDto bean, HttpSession session, Model model) {
		if(bean.getId() != null && bean.getPw() != null) {
			try {
				UserDto userInfo = dao.loginUser(bean);
				if(userInfo.getId() == null) {
					System.out.println("�α��� ����");
					System.out.println("id : " + userInfo.getId());
				} else {
					System.out.println("�α��� ����");
					System.out.println("id : " + userInfo.getId());
					session.setAttribute("userInfo", userInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
			bean.setUsertype("tripus");
			bean.setProfile("");
			dao.insertUser(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:main";
	}
	
}
