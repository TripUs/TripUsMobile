package com.hb.tripus.model.dto;

public class ReviewDto {
	private String contentid, userid, nicname, review;

	public String getContentid() {
		return contentid;
	}

	public String getUserid() {
		return userid;
	}

	public String getNicname() {
		return nicname;
	}

	public void setNicname(String nicname) {
		this.nicname = nicname;
	}

	public String getReview() {
		return review;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public void setReview(String review) {
		this.review = review;
	}
	

}
