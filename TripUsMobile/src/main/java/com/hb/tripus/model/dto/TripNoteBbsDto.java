package com.hb.tripus.model.dto;

public class TripNoteBbsDto {
	private int idx, tripnote_idx, grp, seq, lvl;
	private String userid, usernicname, userprofile, usercomment, reporting_date, reporting_time;
	
	public TripNoteBbsDto() {
		// TODO Auto-generated constructor stub
	}

	public TripNoteBbsDto(int idx, int tripnote_idx, int grp, int seq, int lvl, String userid, String usernicname,
			String userprofile, String usercomment, String reporting_date, String reporting_time) {
		super();
		this.idx = idx;
		this.tripnote_idx = tripnote_idx;
		this.grp = grp;
		this.seq = seq;
		this.lvl = lvl;
		this.userid = userid;
		this.usernicname = usernicname;
		this.userprofile = userprofile;
		this.usercomment = usercomment;
		this.reporting_date = reporting_date;
		this.reporting_time = reporting_time;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getTripnote_idx() {
		return tripnote_idx;
	}

	public void setTripnote_idx(int tripnote_idx) {
		this.tripnote_idx = tripnote_idx;
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

	public String getUsercomment() {
		return usercomment;
	}

	public void setUsercomment(String usercomment) {
		this.usercomment = usercomment;
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
		return "TripNoteBbsDto [idx=" + idx + ", tripnote_idx=" + tripnote_idx + ", grp=" + grp + ", seq=" + seq
				+ ", lvl=" + lvl + ", userid=" + userid + ", usernicname=" + usernicname + ", userprofile="
				+ userprofile + ", usercomment=" + usercomment + ", reporting_date=" + reporting_date + ", reporting_time="
				+ reporting_time + "]";
	}
	
}
