package com.hb.tripus;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
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

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	public String setting(HttpSession session, Model model) {
		System.out.println("setting controller");
		session.setAttribute("mytripCode", null);
		session.setAttribute("mytripDate", null);
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		if(userInfo != null) {
			return "setting/setting";
		} else {
			/* 구글code 발행 */
			OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
			String google_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
			model.addAttribute("google_url", google_url);

			String kakao_url = "https://kauth.kakao.com/oauth/authorize?client_id=558fac862bc9ed96b1edcf6d54f9edf4&"
					+ "redirect_uri=http://localhost:8080/tripus/oauth2kakao&response_type=code";
			model.addAttribute("kakao_url", kakao_url);
			return "login/login";
		}
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code, HttpSession session) throws IOException {

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
				null);
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.println("accessToken is expired. refresh token = {" + accessToken + "}");
		}

		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();

		// 사용자 객체 생성
		UserDto userInfo = new UserDto();
		userInfo.setId(person.getId());
		userInfo.setPw(person.getId());
		userInfo.setName(person.toString());
		userInfo.setNicname(person.toString());
		if (person.getAccountEmail() != null)
			userInfo.setEmail(person.getAccountEmail());
		else
			userInfo.setEmail("");
		userInfo.setProfile(person.getImageUrl());
		userInfo.setUsertype("google");

		// 사용자 정보 DB 저장
		try {
			if (dao.searchUser(userInfo.getId()) != 0)
				userInfo = dao.loginUser(userInfo);
			else
				dao.insertUser(userInfo);
			session.setAttribute("userInfo", userInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "setting/setting";
	}

	// 카카오 Callback호출 메소드
	@RequestMapping(value = "oauth2kakao", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoCallback(@RequestParam String code, Model model, HttpSession session) throws IOException {

		JsonNode jsonToken = getAccessToken(code);
		JsonNode userInfo = getKakaoUserInfo(jsonToken.get("access_token").toString());
		JsonNode properties = userInfo.path("properties");
		
		System.out.println(userInfo.toString());
		
		// 사용자 객체 생성
		UserDto bean = new UserDto();
		bean.setId(userInfo.path("id").asText());
		bean.setPw(userInfo.path("id").asText());
		bean.setName(properties.path("nickname").asText());
		bean.setNicname(properties.path("nickname").asText());
		if (userInfo.path("kaccount_email").asText().equals("")) bean.setEmail("");
		else bean.setEmail(userInfo.path("kaccount_email").asText());
		bean.setProfile(properties.path("thumbnail_image").asText());
		bean.setUsertype("kakao");
		
		// 사용자 정보 DB 저장
		try {
			if (dao.searchUser(bean.getId()) != 0) bean = dao.loginUser(bean);
			else dao.insertUser(bean);
			bean.setToken(jsonToken.get("access_token").toString());
			session.setAttribute("userInfo", bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return "setting/setting";
	}

	public JsonNode getAccessToken(String autorize_code) {
		String RequestUrl = "https://kauth.kakao.com/oauth/token";
		String RestApiKey = "558fac862bc9ed96b1edcf6d54f9edf4";
		String Redirect_URI = "http://localhost:8080/tripus/oauth2kakao";

		List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", RestApiKey)); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", Redirect_URI)); // 리다이렉트 URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code값

		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(RequestUrl);
		JsonNode returnNode = null;

		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			HttpResponse response = client.execute(post);
			int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Post parameters : " + postParams);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnNode;
	}

	public JsonNode getKakaoUserInfo(String autorize_code) {

		String RequestUrl = "https://kapi.kakao.com/v1/user/me";
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(RequestUrl);

		// add header
		post.addHeader("Authorization", "Bearer " + autorize_code);
		JsonNode returnNode = null;

		try {
			HttpResponse response = client.execute(post);
			int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnNode;
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute UserDto bean, HttpSession session, Model model) {
		if (bean.getId() != null && bean.getPw() != null) {
			try {
				UserDto userInfo = dao.loginUser(bean);
				if (userInfo.getId() == null) {
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
		}
		return "setting/setting";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		if (userInfo.getUsertype().equals("kakao")) {
			String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
			HttpClient client = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost(RequestUrl);

			// add header
			post.addHeader("Authorization", "Bearer " + userInfo.getToken());
			
			try {
				HttpResponse response = client.execute(post);
				int responseCode = response.getStatusLine().getStatusCode();

				System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
				System.out.println("request code : " + userInfo.getToken());
				System.out.println("Response Code : " + responseCode);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} 
		session.invalidate();
		return "redirect:setting";
	}

	@RequestMapping(value = "signin", method = RequestMethod.GET)
	public String signinPage(@ModelAttribute UserDto bean, Model model) {
		return "login/signin";
	}

	@RequestMapping(value = "signin", method = RequestMethod.POST)
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
