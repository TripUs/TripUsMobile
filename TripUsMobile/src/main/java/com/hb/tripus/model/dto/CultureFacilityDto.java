package com.hb.tripus.model.dto;

public class CultureFacilityDto implements TourAreaInterface {
	private String accomcountculture, chkbabycarriageculture, chkpetculture, discountinfo;
	private String infocenterculture, parkingculture, restdateculture, usetimeculture, parkingfee, usefee ;

	public CultureFacilityDto() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String[] getTags() {
		String[] tags = { "accomcountculture", "chkbabycarriageculture", "chkpetculture", "discountinfo",
				"infocenterculture", "parkingculture", "restdateculture","usetimeculture", "parkingfee", "usefee" };
		return tags;
	}

	@Override
	public void setTagValue(String[] tags) {
		this.accomcountculture = tags[0];		this.chkbabycarriageculture = tags[1];
		this.chkpetculture = tags[2];			this.discountinfo = tags[3];
		this.infocenterculture = tags[4];		this.parkingculture = tags[5];
		this.restdateculture = tags[6];			this.usetimeculture = tags[7];
		this.parkingfee = tags[8];				this.usefee = tags[9];
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

	public String getParkingfee() {
		return parkingfee;
	}

	public void setParkingfee(String parkingfee) {
		this.parkingfee = parkingfee;
	}

	public String getUsefee() {
		return usefee;
	}

	public void setUsefee(String usefee) {
		this.usefee = usefee;
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
