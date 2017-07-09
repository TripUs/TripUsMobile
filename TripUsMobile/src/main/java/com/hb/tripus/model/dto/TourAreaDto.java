package com.hb.tripus.model.dto;

public class TourAreaDto {

	private String contentid, contenttypeid, title, firstimage, mapx, mapy;
	private int areacode, sigungucode, likeflag;
	
	public TourAreaDto() {
		// TODO Auto-generated constructor stub
	}

	public TourAreaDto(String contentid, String contenttypeid, String title, String firstimage, String mapx,
			String mapy, int areacode, int sigungucode, int likeflag) {
		super();
		this.contentid = contentid;
		this.contenttypeid = contenttypeid;
		this.title = title;
		this.firstimage = firstimage;
		this.mapx = mapx;
		this.mapy = mapy;
		this.areacode = areacode;
		this.sigungucode = sigungucode;
		this.likeflag = likeflag;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
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

	public int getAreacode() {
		return areacode;
	}

	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}

	public int getSigungucode() {
		return sigungucode;
	}

	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}

	public int getLikeflag() {
		return likeflag;
	}

	public void setLikeflag(int likeflag) {
		this.likeflag = likeflag;
	}

	@Override
	public String toString() {
		return "TourAreaDto [contentid=" + contentid + ", contenttypeid=" + contenttypeid + ", title=" + title
				+ ", firstimage=" + firstimage + ", mapx=" + mapx + ", mapy=" + mapy + ", areacode=" + areacode
				+ ", sigungucode=" + sigungucode + ", likeflag=" + likeflag + "]";
	}
	
}
