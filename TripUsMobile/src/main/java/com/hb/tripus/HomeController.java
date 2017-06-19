package com.hb.tripus;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hb.tripus.service.MainService;
import com.hb.tripus.service.ServiceCommand;

@Controller
public class HomeController {
	
	private ServiceCommand service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		System.out.println("home start");
		
		return "home";
	}
	
	@RequestMapping("main")
	public String main(Model model) {
		service = new MainService();
		model.addAttribute("list", ((MainService) service).getAreaList());
		return "main";
	}
	
	@RequestMapping("detail/{contentid}")
	public String detail(@PathVariable String contentid, Model model) {
		service = new MainService();
		model.addAttribute("bean", ((MainService) service).getAreaInfo(contentid));
		return "detail";
	}
	
}
