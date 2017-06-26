package com.hb.tripus.model.dto;

import java.sql.Date;

public class MyTripDto {

	private int code, grp;
	private String userid, title, coverimg, thema;
	private Date startdate, enddate;
	
	public MyTripDto() {
		// TODO Auto-generated constructor stub
	}

	public MyTripDto(int code, int grp, String userid, String title, String coverimg, Date startdate, Date enddate,	String thema) {
		super();
		this.code = code;
		this.grp = grp;
		this.userid = userid;
		this.title = title;
		this.coverimg = coverimg;
		this.startdate = startdate;
		this.enddate = enddate;
		this.thema = thema;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getGrp() {
		return grp;
	}

	public void setGrp(int grp) {
		this.grp = grp;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCoverimg() {
		return coverimg;
	}

	public void setCoverimg(String coverimg) {
		this.coverimg = coverimg;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getThema() {
		return thema;
	}

	public void setThema(String thema) {
		this.thema = thema;
	}

	@Override
	public String toString() {
		return "MyTripDto [code=" + code + ", grp=" + grp + ", userid=" + userid + ", title=" + title + ", coverimg="
				+ coverimg + ", startdate=" + startdate + ", enddate=" + enddate + ", thema=" + thema + "]";
	}
	
}
