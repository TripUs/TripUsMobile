package com.hb.tripus.model.dto;

import java.sql.Date;

public class ReviewDto {
	private String contentid, userid, nicname, profile, review;
	private Date writetime;

	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}
	
	public ReviewDto(String contentid, String userid, String nicname, String profile, String review, Date writetime) {
		super();
		this.contentid = contentid;
		this.userid = userid;
		this.nicname = nicname;
		this.profile = profile;
		this.review = review;
		this.writetime = writetime;
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

	public Date getWritetime() {
		return writetime;
	}

	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}

	@Override
	public String toString() {
		return "ReviewDto [contentid=" + contentid + ", userid=" + userid + ", nicname=" + nicname + ", profile="
				+ profile + ", review=" + review + ", writetime=" + writetime + "]";
	}
	
}
