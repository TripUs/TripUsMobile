package com.hb.tripus.model.dto;

import java.sql.Date;

public class MyTripBbsDto {

	private int idx, tripcode, tripnum, grp, seq, lvl;
	private String tripdate, userid, userprofile, memo;
	private Date reporting_date;
	
	public MyTripBbsDto() {
		// TODO Auto-generated constructor stub
	}

	public MyTripBbsDto(int idx, int tripcode, int tripnum, int grp, int seq, int lvl, String tripdate, String userid,
			String userprofile, String memo, Date reporting_date) {
		super();
		this.idx = idx;
		this.tripcode = tripcode;
		this.tripnum = tripnum;
		this.grp = grp;
		this.seq = seq;
		this.lvl = lvl;
		this.tripdate = tripdate;
		this.userid = userid;
		this.userprofile = userprofile;
		this.memo = memo;
		this.reporting_date = reporting_date;
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

	public int getTripnum() {
		return tripnum;
	}

	public void setTripnum(int tripnum) {
		this.tripnum = tripnum;
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

	public String getTripdate() {
		return tripdate;
	}

	public void setTripdate(String tripdate) {
		this.tripdate = tripdate;
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Date getReporting_date() {
		return reporting_date;
	}

	public void setReporting_date(Date reporting_date) {
		this.reporting_date = reporting_date;
	}

	@Override
	public String toString() {
		return "MyTripBbsDto [idx=" + idx + ", tripcode=" + tripcode + ", tripnum=" + tripnum + ", grp=" + grp
				+ ", seq=" + seq + ", lvl=" + lvl + ", tripdate=" + tripdate + ", userid=" + userid + ", userprofile="
				+ userprofile + ", memo=" + memo + ", reporting_date=" + reporting_date + "]";
	}
	
}
