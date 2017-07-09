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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hb.tripus.model.dao.TripNoteDao;
import com.hb.tripus.model.dto.MyTripDetailDto;
import com.hb.tripus.model.dto.MyTripDto;
import com.hb.tripus.model.dto.MyTripListDto;
import com.hb.tripus.model.dto.TripNoteBbsDto;
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
			TripNoteDto tripNote = new TripNoteDto(0, code, userInfo.getId(), userInfo.getNicname(), userInfo.getProfile(), req.getParameter("title"), null, date_str, time_str, 0, 0);
		
			System.out.println(tripNote.toString());
			
			// tripNote »ðÀÔ & »ðÀÔµÈ tripnote idx ºÒ·¯¿À±â
			int idx = dao.insertShareTripNote(tripNote);
			tripNote.setIdx(idx);
			
			int daynum = Integer.parseInt(req.getParameter("daynum").trim());
			System.out.println("tripnote daynum : " + daynum);
			for(int i=1; i<=daynum; i++) {
				List<MultipartFile> files = mreq.getFiles("file_" + i);
				System.out.println("file size : " + files.size());
				//MultipartFile file = mreq.getFile("file_" + i);
				if(!files.get(0).getOriginalFilename().equals("")) {
					@SuppressWarnings("deprecation")
					String path = req.getRealPath("/resources/upload/tripnote/" + idx).replaceAll("\\\\", "/");
					File dir = new File(path);
					if(!dir.exists()){
						dir.mkdirs(); 
					}
					
					for(int j=0; j<files.size(); j++) {
						File f = new File(path + "\\" + files.get(j).getOriginalFilename());
						files.get(j).transferTo(f);
						String fileName="http://localhost:8080/tripus/resources/upload/tripnote/" + idx + "/" + files.get(j).getOriginalFilename();
						System.out.println(fileName);
						TripNoteImgDto imgs = new TripNoteImgDto(idx, i, fileName);
						dao.insertTripNoteImg(imgs);
						if(i == 1) {
							tripNote.setThema(fileName);
							dao.insertTripNoteThema(tripNote);
						}
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
	
	@RequestMapping(value = "addtripNote", method = RequestMethod.GET)
	public String addTripNote() {
		return "tripnote/addtripnote";
	}
	
	@RequestMapping(value = "addtripNote", method = RequestMethod.POST)
	public String insertTripNote(HttpServletRequest req,  MultipartHttpServletRequest mreq, HttpSession session) {
		try {
			UserDto userInfo = (UserDto) session.getAttribute("userInfo");
			
			Date currdate = new Date();
			SimpleDateFormat sdfdate = new SimpleDateFormat ("yyyy-MM-dd"); 
			SimpleDateFormat sdftime = new SimpleDateFormat ("hh:mm:ss");
			
			String date_str = sdfdate.format(currdate);
			String time_str = sdftime.format(currdate);
			TripNoteDto tripNote = new TripNoteDto(0, 0, userInfo.getId(), userInfo.getNicname(), userInfo.getProfile(), req.getParameter("title"), null, date_str, time_str, 0, 0);
		
			System.out.println(tripNote.toString());
			
			// tripNote »ðÀÔ & »ðÀÔµÈ tripnote idx ºÒ·¯¿À±â
			int idx = dao.insertShareTripNote(tripNote);
			tripNote.setIdx(idx);
			
			int daynum = Integer.parseInt(req.getParameter("daynum").trim());
			System.out.println("tripnote daynum : " + daynum);
			for(int i=1; i<=daynum; i++) {
				List<MultipartFile> files = mreq.getFiles("file_" + i);
				System.out.println("file size : " + files.size());
				//MultipartFile file = mreq.getFile("file_" + i);
				if(!files.get(0).getOriginalFilename().equals("")) {
					@SuppressWarnings("deprecation")
					String path = req.getRealPath("/resources/upload/tripnote/" + idx).replaceAll("\\\\", "/");
					File dir = new File(path);
					if(!dir.exists()){
						dir.mkdirs(); 
					}
					
					for(int j=0; j<files.size(); j++) {
						File f = new File(path + "\\" + files.get(j).getOriginalFilename());
						files.get(j).transferTo(f);
						String fileName="http://localhost:8080/tripus/resources/upload/tripnote/" + idx + "/" + files.get(j).getOriginalFilename();
						System.out.println(fileName);
						TripNoteImgDto imgs = new TripNoteImgDto(idx, i, fileName);
						dao.insertTripNoteImg(imgs);
						if(i == 1) {
							tripNote.setThema(fileName);
							dao.insertTripNoteThema(tripNote);
						}
					}
				}
				TripNoteContentDto contents = new TripNoteContentDto(idx, i, req.getParameter("daytitle_" + i), req.getParameter("content_"+i));
				dao.insertTripNoteContent(contents);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:tripnote";
	}
	
	@RequestMapping(value = "noteDetail/{idx}", method = RequestMethod.GET)
	public String noteDetail(@PathVariable int idx, Model model, HttpSession session) {
		UserDto userInfo = (UserDto)session.getAttribute("userInfo");
		try {
			if(userInfo != null) {
				model.addAttribute("noteLike", dao.getNoteLike(userInfo.getId(), idx));
			}
			model.addAttribute("noteInfo", dao.getNoteOne(idx));
			model.addAttribute("contentInfo", dao.getNoteOneContent(idx));
			model.addAttribute("imgInfo", dao.getNoteOneImg(idx));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "tripnote/notedetail";
	}
	
	@RequestMapping(value = "notecomment/{idx}", method = RequestMethod.GET)
	public String noteComment(@PathVariable int idx, Model model) {
		try {
			model.addAttribute("idx", idx);
			model.addAttribute("comment", dao.getNoteComment(idx));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "tripnote/notecomment";
	}
	
	@ResponseBody
	@RequestMapping(value = "notecomment/{idx}", method = RequestMethod.POST)
	public void noteComment(@PathVariable int idx, @RequestParam String comment, Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		TripNoteBbsDto bean = null;
		try {
			Date currdate = new Date();
			SimpleDateFormat sdfdate = new SimpleDateFormat("yyyy-MM-dd"); 
			SimpleDateFormat sdftime = new SimpleDateFormat("hh:mm:ss");
			String date_str = sdfdate.format(currdate);
			String time_str = sdftime.format(currdate);
			
			int grp = dao.getNoteGrpCnt() + 1;
			bean = new TripNoteBbsDto(0, idx, grp, 0, 0, userInfo.getId(), userInfo.getNicname(), 
					userInfo.getProfile(), comment, date_str, time_str);
			dao.insertNoteComment(bean);
			dao.updateCommentNum(idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "noteLike", method = RequestMethod.POST)
	public int noteLike(@RequestParam int idx, @RequestParam int likeflag, @RequestParam int likeCnt, HttpSession session) {
		try {
			if(likeflag == 0) {
				dao.getNoteLikeUp(idx, likeflag, ((UserDto)session.getAttribute("userInfo")).getId(), likeCnt);
				likeflag = 1;
			} else {
				dao.getNoteLikeDown(idx, likeflag, ((UserDto)session.getAttribute("userInfo")).getId(), likeCnt);
				likeflag = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return likeflag;
	}
	
	@RequestMapping("delTripNote/{idx}")
	public String deleteTripNote(@PathVariable int idx) {
		try {
			dao.deleteTripNote(idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../tripnote";
	}
}
