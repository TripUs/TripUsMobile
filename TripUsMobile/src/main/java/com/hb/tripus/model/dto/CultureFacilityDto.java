package com.hb.tripus.model.dto;

public class CultureFacilityDto implements TourAreaInterface {
	private String accomcountculture, chkbabycarriageculture, chkpetculture, discountinfo;
	private String infocenterculture, parkingculture, restdateculture, usetimeculture, parkingfee, usefee ;

	@Override
	public String[] getTags() {
		String[] tags = { "accomcountculture", "chkbabycarriageculture", "chkpetculture", "discountinfo",
				"infocenterculture", "parkingculture", "restdateculture","usetimeculture", "parkingfee", "usefee" };
		return tags;
	}

	@Override
	public void setTagValue(String[] tags) {
		accomcountculture = tags[0];
		chkbabycarriageculture = tags[1];
		chkpetculture = tags[2];
		discountinfo = tags[3];
		infocenterculture = tags[4];
		parkingculture = tags[5];
		restdateculture = tags[6];
		usetimeculture = tags[7];
		parkingfee = tags[8];
		usefee = tags[9];

	}

	public CultureFacilityDto() {
	}
	
	public void setParkingfee(String parkingfee) {
		this.parkingfee = parkingfee;
	}
	
	public String getParkingfee() {
		return parkingfee;
	}
	
	public void setUsefee(String usefee) {
		this.usefee = usefee;
	}
	
	public String getUsefee() {
		return usefee;
	}
	
	public String getAccomcountculture() {
		return accomcountculture;
	}

	public void setAccomcountculture(String accomcountculture) {
		this.accomcountculture = accomcountculture;
	}

	public String getChkbabycarriageculture() {
		return chkbabycarriageculture;
	}

	public void setChkbabycarriageculture(String chkbabycarriageculture) {
		this.chkbabycarriageculture = chkbabycarriageculture;
	}

	public String getChkpetculture() {
		return chkpetculture;
	}

	public void setChkpetculture(String chkpetculture) {
		this.chkpetculture = chkpetculture;
	}

	public String getDiscountinfo() {
		return discountinfo;
	}

	public void setDiscountinfo(String discountinfo) {
		this.discountinfo = discountinfo;
	}

	public String getInfocenterculture() {
		return infocenterculture;
	}

	public void setInfocenterculture(String infocenterculture) {
		this.infocenterculture = infocenterculture;
	}

	public String getParkingculture() {
		return parkingculture;
	}

	public void setParkingculture(String parkingculture) {
		this.parkingculture = parkingculture;
	}

	public String getRestdateculture() {
		return restdateculture;
	}

	public void setRestdateculture(String restdateculture) {
		this.restdateculture = restdateculture;
	}

	public String getUsetimeculture() {
		return usetimeculture;
	}

	public void setUsetimeculture(String usetimeculture) {
		this.usetimeculture = usetimeculture;
	}

	@Override
	public String toString() {
		return "CultureFacilityDto [accomcountculture=" + accomcountculture + ", chkbabycarriageculture="
				+ chkbabycarriageculture + ", chkpetculture=" + chkpetculture + ", discountinfo=" + discountinfo
				+ ", infocenterculture=" + infocenterculture + ", parkingculture=" + parkingculture
				+ ", restdateculture=" + restdateculture + ", usetimeculture=" + usetimeculture + ", parkingfee="
				+ parkingfee + ", usefee=" + usefee + "]";
	}

	

}
