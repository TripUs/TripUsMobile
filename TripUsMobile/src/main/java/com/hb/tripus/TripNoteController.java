package com.hb.tripus;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hb.tripus.model.dao.TripNoteDao;
import com.hb.tripus.service.ServiceCommand;

@Controller
public class TripNoteController {

	@Autowired
	private TripNoteDao dao;
	private ServiceCommand service;
	
	@RequestMapping("tripnote")
	public String tripNote(HttpSession session) {
		session.setAttribute("mytripCode", null);
		session.setAttribute("mytripDate", null);
		return "tripnote/tripnote";
	}
	
}
