package com.hb.tripus.model.dto;

public class MyTripListDto {

	private int code, daynum;
	private String tripdate;
	
	public MyTripListDto() {
		// TODO Auto-generated constructor stub
	}

	public MyTripListDto(int code, int daynum, String tripdate) {
		super();
		this.code = code;
		this.daynum = daynum;
		this.tripdate = tripdate;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
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

	@Override
	public String toString() {
		return "MyTripListDto [code=" + code + ", daynum=" + daynum + ", tripdate=" + tripdate + "]";
	}
	
}
