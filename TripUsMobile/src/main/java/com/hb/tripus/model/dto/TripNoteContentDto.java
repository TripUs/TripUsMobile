package com.hb.tripus.model.dto;

public class TripNoteContentDto {
	private int idx, daynum;
	private String content;

	public TripNoteContentDto() {
		// TODO Auto-generated constructor stub
	}

	public TripNoteContentDto(int idx, int daynum, String content) {
		super();
		this.idx = idx;
		this.daynum = daynum;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "TripNoteContentDto [idx=" + idx + ", daynum=" + daynum + ", content=" + content + "]";
	}
	
}
