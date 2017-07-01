package com.hb.tripus.model.dto;

public class TourAreaRecommendDto2 implements TourAreaInterface {
	private String contentid, contenttypeid, subcontentid, subdetailalt, subdetailimg, subdetailoverview, subname,
			subnum;

	@Override
	public String toString() {
		return "TourAreaRecommendDto2 [contentid=" + contentid + ", contenttypeid=" + contenttypeid + ", subcontentid="
				+ subcontentid + ", subdetailalt=" + subdetailalt + ", subdetailimg=" + subdetailimg
				+ ", subdetailoverview=" + subdetailoverview + ", subname=" + subname + ", subnum=" + subnum + "]";
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getContenttypeid() {
		return contenttypeid;
	}

	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}

	public String getSubcontentid() {
		return subcontentid;
	}

	public void setSubcontentid(String subcontentid) {
		this.subcontentid = subcontentid;
	}

	public String getSubdetailalt() {
		return subdetailalt;
	}

	public void setSubdetailalt(String subdetailalt) {
		this.subdetailalt = subdetailalt;
	}

	public String getSubdetailimg() {
		return subdetailimg;
	}

	public void setSubdetailimg(String subdetailimg) {
		this.subdetailimg = subdetailimg;
	}

	public String getSubdetailoverview() {
		return subdetailoverview;
	}

	public void setSubdetailoverview(String subdetailoverview) {
		this.subdetailoverview = subdetailoverview;
	}

	public String getSubname() {
		return subname;
	}

	public void setSubname(String subname) {
		this.subname = subname;
	}

	public String getSubnum() {
		return subnum;
	}

	public void setSubnum(String subnum) {
		this.subnum = subnum;
	}

	@Override
	public String[] getTags() {
		String[] tags = { "contentid", "contenttypeid", "subcontentid", "subdetailalt", "subdetailimg",
				"subdetailoverview", "subname", "subnum" };
		return tags;
	}

	@Override
	public void setTagValue(String[] tags) {
		this.contentid = tags[0];
		this.contenttypeid = tags[1];
		this.subcontentid = tags[2];
		this.subdetailalt = tags[3];
		this.subdetailimg = tags[4];
		this.subdetailoverview = tags[5];
		this.subname = tags[6];
		this.subnum = tags[7];
	}
}
