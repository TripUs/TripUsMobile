package com.hb.tripus.model.dto;

public class TouristDetailDto implements TourAreaInterface {

	private String accomcount, chkbabycarriage, chkpet, expagerange, expguide3;
	private String heritage1, heritage2, heritage3, infocenter, opendate, parking, restdate, useseason, usetime;
		
	@Override
	public String[] getTags() {
		String[] tags = {"accomcount", "chkbabycarriage", "chkpet", "expagerange", "expguide3",
		"heritage1", "heritage2", "heritage3", "infocenter", "opendate", "parking", "restdate", "useseason", "usetime" };
		return tags;
	}

	@Override
	public void setTagValue(String[] tags) {
		accomcount = tags[0]; 	chkbabycarriage = tags[1];
		chkpet = tags[2]; 	expagerange = tags[3];
		expguide3 = tags[4]; 	heritage1 = tags[5];
		heritage2 = tags[6]; 	heritage3 = tags[7];
		infocenter = tags[8]; 	opendate = tags[9];
		parking = tags[10]; 	restdate = tags[11];
		useseason = tags[12]; 	usetime = tags[13];
		
	}

	public TouristDetailDto() {
	}

	public String getAccomcount() {
		return accomcount;
	}

	public void setAccomcount(String accomcount) {
		this.accomcount = accomcount;
	}

	public String getChkbabycarriage() {
		return chkbabycarriage;
	}

	public void setChkbabycarriage(String chkbabycarriage) {
		this.chkbabycarriage = chkbabycarriage;
	}

	public String getChkpet() {
		return chkpet;
	}

	public void setChkpet(String chkpet) {
		this.chkpet = chkpet;
	}

	public String getExpagerange() {
		return expagerange;
	}

	public void setExpagerange(String expagerange) {
		this.expagerange = expagerange;
	}

	public String getExpguide3() {
		return expguide3;
	}

	public void setExpguide3(String expguide) {
		this.expguide3 = expguide;
	}

	public String getHeritage1() {
		return heritage1;
	}

	public void setHeritage1(String heritage1) {
		this.heritage1 = heritage1;
	}

	public String getHeritage2() {
		return heritage2;
	}

	public void setHeritage2(String heritage2) {
		this.heritage2 = heritage2;
	}

	public String getHeritage3() {
		return heritage3;
	}

	public void setHeritage3(String heritage3) {
		this.heritage3 = heritage3;
	}

	public String getInfocenter() {
		return infocenter;
	}

	public void setInfocenter(String infocenter) {
		this.infocenter = infocenter;
	}

	public String getOpendate() {
		return opendate;
	}

	public void setOpendate(String opendate) {
		this.opendate = opendate;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getRestdate() {
		return restdate;
	}

	public void setRestdate(String restdate) {
		this.restdate = restdate;
	}

	public String getUseseason() {
		return useseason;
	}

	public void setUseseason(String useseason) {
		this.useseason = useseason;
	}

	public String getUsetime() {
		return usetime;
	}

	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}

	@Override
	public String toString() {
		return "TouristDetailDto [accomcount=" + accomcount + ", chkbabycarriage=" + chkbabycarriage + ", chkpet="
				+ chkpet + ", expagerange=" + expagerange + ", expguide3=" + expguide3 + ", heritage1=" + heritage1
				+ ", heritage2=" + heritage2 + ", heritage3=" + heritage3 + ", infocenter=" + infocenter + ", opendate="
				+ opendate + ", parking=" + parking + ", restdate=" + restdate + ", useseason=" + useseason
				+ ", usetime=" + usetime + "]";
	}

	
}
