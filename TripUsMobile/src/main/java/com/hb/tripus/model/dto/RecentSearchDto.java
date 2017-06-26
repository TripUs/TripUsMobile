package com.hb.tripus.model.dto;

public class RecentSearchDto {

	private int idx;
	private String userid, contentid, firstimage, title;
	
	public RecentSearchDto() {
		// TODO Auto-generated constructor stub
	}

	public RecentSearchDto(int idx, String userid, String contentid, String firstimage, String title) {
		super();
		this.idx = idx;
		this.userid = userid;
		this.contentid = contentid;
		this.firstimage = firstimage;
		this.title = title;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "RecentSearchDto [idx=" + idx + ", userid=" + userid + ", contentid=" + contentid + ", firstimage="
				+ firstimage + ", title=" + title + "]";
	}
	
}
