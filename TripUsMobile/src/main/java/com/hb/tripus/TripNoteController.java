package com.hb.tripus;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hb.tripus.model.dao.TripNoteDao;
import com.hb.tripus.model.dto.MyTripDetailDto;
import com.hb.tripus.model.dto.MyTripDto;
import com.hb.tripus.model.dto.MyTripListDto;
import com.hb.tripus.model.dto.TripNoteContentDto;
import com.hb.tripus.model.dto.TripNoteDto;
import com.hb.tripus.model.dto.TripNoteImgDto;
import com.hb.tripus.model.dto.UserDto;
import com.hb.tripus.service.ServiceCommand;

@Controller
public class TripNoteController {

	@Autowired
	private TripNoteDao dao;
	private ServiceCommand service;
	
	@RequestMapping("tripnote")
	public String tripNote(HttpSession session, Model model) {
		session.setAttribute("mytripCode", null);
		session.setAttribute("mytripDate", null);
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		try {
			List<TripNoteDto> allnote = dao.getAllNote();
			model.addAttribute("allNote", allnote);
			if(userInfo != null) {
				List<TripNoteDto> mynote = dao.getMyNote(userInfo.getId());
				model.addAttribute("myNote", mynote);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "tripnote/tripnote";
	}
	
	@RequestMapping(value = "shareTripnote/{code}", method = RequestMethod.GET)
	public String shareTripnote(@PathVariable int code, HttpSession session, Model model) {
		System.out.println("shareTripnote code=" + code);
		try {
			MyTripDto bean = dao.getMyTripSelectOne(code);
			model.addAttribute("mytrip", bean);
			List<MyTripListDto> list = dao.getMyTripList(bean.getCode());
			model.addAttribute("tripList", list);
			List<MyTripDetailDto> list2 = dao.getMyTripDetail(bean.getCode());
			model.addAttribute("tripDetail", list2);
			session.setAttribute("mytripCode", bean.getCode());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "tripnote/sharetripnote";
	}
	
	@RequestMapping(value = "shareTripnote/{code}", headers = "content-type=multipart/form-data", method = RequestMethod.POST)
	public String insertShareTripnote(@PathVariable int code, HttpServletRequest req, MultipartHttpServletRequest mreq, HttpSession session) {
		try {
			UserDto userInfo = (UserDto) session.getAttribute("userInfo");
			
			Date currdate = new Date();
			SimpleDateFormat sdfdate = new SimpleDateFormat ("yyyy-MM-dd"); 
			SimpleDateFormat sdftime = new SimpleDateFormat ("hh:mm:ss");
			
			String date_str = sdfdate.format(currdate);
			String time_str = sdftime.format(currdate);
			TripNoteDto tripNote = new TripNoteDto(0, code, userInfo.getId(), userInfo.getNicname(), userInfo.getProfile(), req.getParameter("title"), null, date_str, time_str, 0);
		
			System.out.println(tripNote.toString());
			
			// tripNote »ðÀÔ & »ðÀÔµÈ tripnote idx ºÒ·¯¿À±â
			int idx = dao.insertShareTripNote(tripNote);
			tripNote.setIdx(idx);
			
			int daynum = Integer.parseInt(req.getParameter("daynum").trim());
			System.out.println("tripnote daynum : " + daynum);
			for(int i=1; i<=daynum; i++) {
				MultipartFile file = mreq.getFile("file_" + i);
				if(!file.getOriginalFilename().equals("")) {
					@SuppressWarnings("deprecation")
					String path = req.getRealPath("/resources/upload/tripnote/" + idx).replaceAll("\\\\", "/");
					File dir = new File(path);
					if(!dir.exists()){
						dir.mkdirs(); 
					}
					
					File f = new File(path + "\\" + file.getOriginalFilename());
					file.transferTo(f);
					String fileName="http://localhost:8080/tripus/resources/upload/tripnote/" + idx + "/" + file.getOriginalFilename();
					TripNoteImgDto imgs = new TripNoteImgDto(idx, i, fileName);
					dao.insertTripNoteImg(imgs);
					if(i == 1) {
						tripNote.setThema(fileName);
						dao.insertTripNoteThema(tripNote);
					}
				}
				TripNoteContentDto contents = new TripNoteContentDto(idx, i, req.getParameter("daytitle_" + i), req.getParameter("content_"+i));
				dao.insertTripNoteContent(contents);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:../tripnote";
	}
	
	@RequestMapping(value = "noteDetail/{idx}", method = RequestMethod.GET)
	public String noteDetail(@PathVariable int idx, Model model) {
		try {
			model.addAttribute("noteInfo", dao.getNoteOne(idx));
			List<TripNoteContentDto> contentInfo = dao.getNoteOneContent(idx);
			List<TripNoteImgDto> imgInfo = dao.getNoteOneImg(idx);
			
			model.addAttribute("contentInfo", contentInfo);
			model.addAttribute("imgInfo", imgInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "tripnote/notedetail";
	}
	
}
