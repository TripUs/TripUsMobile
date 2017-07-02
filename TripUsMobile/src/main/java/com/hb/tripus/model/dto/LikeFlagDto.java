package com.hb.tripus.model.dto;

public class LikeFlagDto {
	private int likeflag;
	private String contentid, userid;
	
	public LikeFlagDto() {
		// TODO Auto-generated constructor stub
	}
	
	public LikeFlagDto(int likeflag, String contentid, String userid) {
		super();
		this.likeflag = likeflag;
		this.contentid = contentid;
		this.userid = userid;
	}

	public int getLikeflag() {
		return likeflag;
	}

	public void setLikeflag(int likeflag) {
		this.likeflag = likeflag;
	}

	public String getContentid() {
		return contentid;
	}

	public String getUserid() {
		return userid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "LikeFlagDto [likeflag=" + likeflag + ", contentid=" + contentid + ", userid=" + userid + "]";
	}
}
