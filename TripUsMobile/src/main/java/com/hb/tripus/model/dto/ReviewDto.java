package com.hb.tripus.model.dto;

import java.sql.Date;

public class ReviewDto {
	private String contentid, userid, nicname, profile, review;
	private String reporting_date, reporting_time;

	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}
	
	public ReviewDto(String contentid, String userid, String nicname, String profile, String review, String reporting_date, String reporting_time) {
		super();
		this.contentid = contentid;
		this.userid = userid;
		this.nicname = nicname;
		this.profile = profile;
		this.review = review;
		this.reporting_date = reporting_date;
		this.reporting_time = reporting_time;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNicname() {
		return nicname;
	}

	public void setNicname(String nicname) {
		this.nicname = nicname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
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
		return "ReviewDto [contentid=" + contentid + ", userid=" + userid + ", nicname=" + nicname + ", profile="
				+ profile + ", review=" + review + ", reporting_date=" + reporting_date + ", reporting_time="
				+ reporting_time + "]";
	}
	
}
