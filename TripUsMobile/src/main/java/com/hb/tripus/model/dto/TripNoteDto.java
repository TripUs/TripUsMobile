package com.hb.tripus.model.dto;

public class TripNoteDto {

	private int idx, tripcode, likeflag, commentnum;
	private String userid, usernicname, userprofile, title, thema, reporting_date, reporting_time;
	
	public TripNoteDto() {
		// TODO Auto-generated constructor stub
	}

	public TripNoteDto(int idx, int tripcode, String userid, String usernicname, String userprofile, String title, String thema,
			String reporting_date, String reporting_time, int likeflag, int commentnum) {
		this.idx = idx;
		this.tripcode = tripcode;
		this.userid = userid;
		this.usernicname = usernicname;
		this.userprofile = userprofile;
		this.title = title;
		this.thema = thema;
		this.reporting_date = reporting_date;
		this.reporting_time = reporting_time;
		this.likeflag = likeflag;
		this.commentnum = commentnum;
	}

	public int getCommentnum() {
		return commentnum;
	}

	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	}

	public int getLikeflag() {
		return likeflag;
	}

	public void setLikeflag(int likeflag) {
		this.likeflag = likeflag;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getTripcode() {
		return tripcode;
	}

	public void setTripcode(int tripcode) {
		this.tripcode = tripcode;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsernicname() {
		return usernicname;
	}

	public void setUsernicname(String usernicname) {
		this.usernicname = usernicname;
	}

	public String getUserprofile() {
		return userprofile;
	}

	public void setUserprofile(String userprofile) {
		this.userprofile = userprofile;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThema() {
		return thema;
	}

	public void setThema(String thema) {
		this.thema = thema;
	}

	public String getReporting_date() {
		return reporting_date;
	}

	public void setReporting_date(String reporting_date) {
		this.reporting_date = reporting_date;
	}
	
	public String getReporting_time() {
		return reporting_time;
	}

	public void setReporting_time(String reporting_time) {
		this.reporting_time = reporting_time;
	}

	@Override
	public String toString() {
		return "TripNoteDto [idx=" + idx + ", tripcode=" + tripcode + ", likeflag=" + likeflag + ", userid=" + userid
				+ ", usernicname=" + usernicname + ", userprofile=" + userprofile + ", title=" + title + ", thema="
				+ thema + ", reporting_date=" + reporting_date + ", reporting_time=" + reporting_time + "]";
	}
	
}
