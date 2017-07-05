package com.hb.tripus.model.dto;

public class TripNoteImgDto {
	private int idx, daynum;
	private String imgname;
	
	public TripNoteImgDto() {
		// TODO Auto-generated constructor stub
	}

	public TripNoteImgDto(int idx, int daynum, String imgname) {
		super();
		this.idx = idx;
		this.daynum = daynum;
		this.imgname = imgname;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getDaynum() {
		return daynum;
	}

	public void setDaynum(int daynum) {
		this.daynum = daynum;
	}

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

	@Override
	public String toString() {
		return "TripNoteImgDto [idx=" + idx + ", daynum=" + daynum + ", imgname=" + imgname + "]";
	}
	
}
