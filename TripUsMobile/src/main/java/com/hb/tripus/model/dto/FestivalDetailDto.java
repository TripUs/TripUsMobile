package com.hb.tripus.model.dto;

public class FestivalDetailDto implements TourAreaInterface {

	private String agelimit, bookingplace, discountinfofestival, eventenddate, eventhomepage, eventplace,
					eventstartdate, festivalgrade, playtime, spendtimefestival, usetimefestival, subevent, program;

	@Override
	public String[] getTags() {
		String[] tags = { "agelimit", "bookingplace", "discountinfofestival", "eventenddate", "eventhomepage",
				"eventplace", "eventstartdate", "festivalgrade", "playtime", "spendtimefestival", "usetimefestival", "subevent", "program"};
		return tags;
	}

	@Override
	public void setTagValue(String[] tags) {
		this.agelimit = tags[0];					this.bookingplace = tags[1];
		this.discountinfofestival = tags[2];		this.agelimit = tags[3];
		this.eventhomepage = tags[4];				this.eventplace = tags[5];
		this.eventstartdate = tags[6];				this.festivalgrade = tags[7];
		this.playtime = tags[8];					this.spendtimefestival = tags[9];
		this.usetimefestival = tags[10];				this.subevent = tags[11];
		this.program = tags[12];						
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

	public String getSubevent() {
		return subevent;
	}

	public void setSubevent(String subevent) {
		this.subevent = subevent;
	}

	public String getProgram() {
		return program;
	}

	public void setProgram(String program) {
		this.program = program;
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
