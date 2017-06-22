package com.hb.tripus.model.dto;

public class FestivalDetailDto implements TourAreaInterface {

	private String agelimit, bookingplace, discountinfofestival, eventenddate, eventhomepage, eventplace,
			eventstartdate, festivalgrade;
	private String playtime, spendtimefestival, usetimefestival, subevent, program;

	@Override
	public String[] getTags() {
		String[] tags = { "agelimit", "bookingplace", "discountinfofestival", "eventenddate", "eventhomepage",
				"eventplace", "eventstartdate", "festivalgrade", "playtime", "spendtimefestival", "usetimefestival", "subevent", "program"};
		return tags;
	}

	@Override
	public void setTagValue(String[] tags) {
		agelimit = tags[0];
		bookingplace = tags[1];
		discountinfofestival = tags[2];
		eventenddate = tags[3];
		eventhomepage = tags[4];
		eventplace = tags[5];
		eventstartdate = tags[6];
		festivalgrade = tags[7];
		playtime = tags[8];
		spendtimefestival = tags[9];
		usetimefestival = tags[10];
		subevent = tags[11];
		program = tags[12];

	}

	public FestivalDetailDto() {
	}

	public String getProgram() {
		return program;
	}
	
	public void setProgram(String program) {
		this.program = program;
	}
	
	public String getSubevent() {
		return subevent;
	}

	public void setSubevent(String subevent) {
		this.subevent = subevent;
	}

	public String getAgelimit() {
		return agelimit;
	}

	public void setAgelimit(String agelimit) {
		this.agelimit = agelimit;
	}

	public String getBookingplace() {
		return bookingplace;
	}

	public void setBookingplace(String bookingplace) {
		this.bookingplace = bookingplace;
	}

	public String getDiscountinfofestival() {
		return discountinfofestival;
	}

	public void setDiscountinfofestival(String discountinfofestival) {
		this.discountinfofestival = discountinfofestival;
	}

	public String getEventenddate() {
		return eventenddate;
	}

	public void setEventenddate(String eventenddate) {
		this.eventenddate = eventenddate;
	}

	public String getEventhomepage() {
		return eventhomepage;
	}

	public void setEventhomepage(String eventhomepage) {
		this.eventhomepage = eventhomepage;
	}

	public String getEventplace() {
		return eventplace;
	}

	public void setEventplace(String eventplace) {
		this.eventplace = eventplace;
	}

	public String getEventstartdate() {
		return eventstartdate;
	}

	public void setEventstartdate(String eventstartdate) {
		this.eventstartdate = eventstartdate;
	}

	public String getFestivalgrade() {
		return festivalgrade;
	}

	public void setFestivalgrade(String festivalgrade) {
		this.festivalgrade = festivalgrade;
	}

	public String getPlaytime() {
		return playtime;
	}

	public void setPlaytime(String playtime) {
		this.playtime = playtime;
	}

	public String getSpendtimefestival() {
		return spendtimefestival;
	}

	public void setSpendtimefestival(String spendtimefestival) {
		this.spendtimefestival = spendtimefestival;
	}

	public String getUsetimefestival() {
		return usetimefestival;
	}

	public void setUsetimefestival(String usetimefestival) {
		this.usetimefestival = usetimefestival;
	}

	@Override
	public String toString() {
		return "FestivalDetailDto [agelimit=" + agelimit + ", bookingplace=" + bookingplace + ", discountinfofestival="
				+ discountinfofestival + ", eventenddate=" + eventenddate + ", eventhomepage=" + eventhomepage
				+ ", eventplace=" + eventplace + ", eventstartdate=" + eventstartdate + ", festivalgrade="
				+ festivalgrade + ", playtime=" + playtime + ", spendtimefestival=" + spendtimefestival
				+ ", usetimefestival=" + usetimefestival + ", subevent=" + subevent + ", program=" + program + "]";
	}

}
