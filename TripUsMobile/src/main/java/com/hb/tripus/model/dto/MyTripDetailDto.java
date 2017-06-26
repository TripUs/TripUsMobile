package com.hb.tripus.model.dto;

public class MyTripDetailDto {

	private int idx, mytripcode, daynum;
	private String tripdate, contentid, content_title, content_img, mapx, mapy;
	
	public MyTripDetailDto() {
		// TODO Auto-generated constructor stub
	}

	public MyTripDetailDto(int idx, int mytripcode, int daynum, String tripdate, String contentid, String content_title,
			String content_img, String mapx, String mapy) {
		super();
		this.idx = idx;
		this.mytripcode = mytripcode;
		this.daynum = daynum;
		this.tripdate = tripdate;
		this.contentid = contentid;
		this.content_title = content_title;
		this.content_img = content_img;
		this.mapx = mapx;
		this.mapy = mapy;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getMytripcode() {
		return mytripcode;
	}

	public void setMytripcode(int mytripcode) {
		this.mytripcode = mytripcode;
	}
	
	public int getDaynum() {
		return daynum;
	}

	public void setDaynum(int daynum) {
		this.daynum = daynum;
	}

	public String getTripdate() {
		return tripdate;
	}

	public void setTripdate(String tripdate) {
		this.tripdate = tripdate;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getContent_title() {
		return content_title;
	}

	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}

	public String getContent_img() {
		return content_img;
	}

	public void setContent_img(String content_img) {
		this.content_img = content_img;
	}

	public String getMapx() {
		return mapx;
	}

	public void setMapx(String mapx) {
		this.mapx = mapx;
	}

	public String getMapy() {
		return mapy;
	}

	public void setMapy(String mapy) {
		this.mapy = mapy;
	}

	@Override
	public String toString() {
		return "MyTripDetailDto [idx=" + idx + ", mytripcode=" + mytripcode + ", daynum=" + daynum + ", tripdate="
				+ tripdate + ", contentid=" + contentid + ", content_title=" + content_title + ", content_img="
				+ content_img + ", mapx=" + mapx + ", mapy=" + mapy + "]";
	}
	
}
