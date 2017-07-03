package com.hb.tripus.model.dto;

import java.sql.Date;

public class MyTripDto {

	private int code, num;
	private String title, coverimg, thema;
	private Date startdate, enddate;
	
	public MyTripDto() {
		// TODO Auto-generated constructor stub
	}

	public MyTripDto(int code, int num, String title, String coverimg, String thema, Date startdate, Date enddate) {
		super();
		this.code = code;
		this.num = num;
		this.title = title;
		this.coverimg = coverimg;
		this.thema = thema;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "MyTripDto [code=" + code + ", num=" + num + ", title=" + title + ", coverimg=" + coverimg + ", thema="
				+ thema + ", startdate=" + startdate + ", enddate=" + enddate + "]";
	}
	
}
