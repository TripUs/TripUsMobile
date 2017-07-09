package com.hb.tripus.model.dto;

public class AreaDto {

	private int areacode, sigungucode, likeflag;
	private String name, content, imgname;
	
	public AreaDto() {
		// TODO Auto-generated constructor stub
	}

	public AreaDto(int areacode, int sigungucode, int likeflag, String name, String content, String imgname) {
		super();
		this.areacode = areacode;
		this.sigungucode = sigungucode;
		this.likeflag = likeflag;
		this.name = name;
		this.content = content;
		this.imgname = imgname;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

	@Override
	public String toString() {
		return "AreaDto [areacode=" + areacode + ", sigungucode=" + sigungucode + ", likeflag=" + likeflag + ", name="
				+ name + ", content=" + content + ", imgname=" + imgname + "]";
	}
	
}
