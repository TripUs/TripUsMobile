package com.hb.tripus.model.dto;

public class TourAreaBasicDto implements TourAreaInterface {
	private String contentid, contenttypeid, homepage, tel, title, firstimage, firstimage2;
	private String areacode, sigungucode, cat1, cat2, cat3, addr1, addr2, mapx, mapy, overview;
	
	public TourAreaBasicDto() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String[] getTags() {
		String[] tags = {"contentid", "contenttypeid", "homepage", "tel", "title",
				"firstimage", "firstimage2", "areacode", "sigungucode", "cat1", "cat2", "cat3",
				"addr1", "addr2", "mapx", "mapy", "overview"};
		return tags;
	}
	
	@Override
	public void setTagValue(String[] tags) {
		this.contentid = tags[0];		this.contenttypeid = tags[1];
		this.homepage = tags[2];		this.tel = tags[3];
		this.title = tags[4];			this.firstimage = tags[5];		
		this.firstimage2 = tags[7];		this.areacode = tags[8];		
		this.sigungucode = tags[8];		this.cat1 = tags[9];			
		this.cat2 = tags[10];			this.cat3 = tags[11];			
		this.addr1 = tags[12];			this.addr2 = tags[13];			
		this.mapx = tags[14];			this.mapy = tags[15];			
		this.overview = tags[16];
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

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public String getFirstimage2() {
		return firstimage2;
	}

	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}

	public String getAreacode() {
		return areacode;
	}

	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}

	public String getSigungucode() {
		return sigungucode;
	}

	public void setSigungucode(String sigungucode) {
		this.sigungucode = sigungucode;
	}

	public String getCat1() {
		return cat1;
	}

	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}

	public String getCat2() {
		return cat2;
	}

	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}

	public String getCat3() {
		return cat3;
	}

	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
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

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	@Override
	public String toString() {
		return "TourAeraBasicDto [contentid=" + contentid + ", contenttypeid=" + contenttypeid + ", homepage="
				+ homepage + ", tel=" + tel + ", title=" + title + ", firstimage=" + firstimage
				+ ", firstimage2=" + firstimage2 + ", areacode=" + areacode + ", sigungucode=" + sigungucode + ", cat1="
				+ cat1 + ", cat2=" + cat2 + ", cat3=" + cat3 + ", addr1=" + addr1 + ", addr2=" + addr2 + ", mapx="
				+ mapx + ", mapy=" + mapy + ", overview=" + overview + "]";
	}
	
}
