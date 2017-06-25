package com.hb.tripus.model.dto;

import java.sql.Date;

public class MyTripBbsDto {

	private int idx, grp, seq, lvl;
	private String tripdate, userid, userprofile, usercomment;
	private Date reporting_date;
	
	public MyTripBbsDto() {
		// TODO Auto-generated constructor stub
	}

	public MyTripBbsDto(int idx, String tripdate, int grp, int seq, int lvl, String userid, String userprofile,
			String usercomment, Date reporting_date) {
		super();
		this.idx = idx;
		this.tripdate = tripdate;
		this.grp = grp;
		this.seq = seq;
		this.lvl = lvl;
		this.userid = userid;
		this.userprofile = userprofile;
		this.usercomment = usercomment;
		this.reporting_date = reporting_date;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTripdate() {
		return tripdate;
	}

	public void setTripdate(String tripdate) {
		this.tripdate = tripdate;
	}

	public int getGrp() {
		return grp;
	}

	public void setGrp(int grp) {
		this.grp = grp;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getLvl() {
		return lvl;
	}

	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserprofile() {
		return userprofile;
	}

	public void setUserprofile(String userprofile) {
		this.userprofile = userprofile;
	}

	public String getUsercomment() {
		return usercomment;
	}

	public void setUsercomment(String usercomment) {
		this.usercomment = usercomment;
	}

	public Date getReporting_date() {
		return reporting_date;
	}

	public void setReporting_date(Date reporting_date) {
		this.reporting_date = reporting_date;
	}

	@Override
	public String toString() {
		return "MyTripBbsDto [idx=" + idx + ", tripdate=" + tripdate + ", grp=" + grp + ", seq=" + seq
				+ ", lvl=" + lvl + ", userid=" + userid + ", userprofile=" + userprofile + ", usercomment="
				+ usercomment + ", reporting_date=" + reporting_date + "]";
	}
	
}
