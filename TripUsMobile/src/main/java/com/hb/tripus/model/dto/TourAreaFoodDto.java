package com.hb.tripus.model.dto;

public class TourAreaFoodDto implements TourAreaInterface{
	private String discountinfofood, firstmenu, infocenterfood, kidsfacility, opentimefood;
	private String packing, parkingfood, reservationfood, restdatefood, seat, treatmenu; 
	
	public TourAreaFoodDto() {
	}

	@Override
	public String[] getTags() {
		String[] tags = {"discountinfofood", "firstmenu", "infocenterfood", "kidsfacility", "opentimefood",
				"packing", "parkingfood", "reservationfood", "restdatefood", "seat", "treatmenu"};
		return tags;
	}

	@Override
	public void setTagValue(String[] tags) {
		this.discountinfofood = tags[0];		this.firstmenu = tags[1];
		this.infocenterfood = tags[2];			this.kidsfacility = tags[3];
		this.opentimefood = tags[4];			this.packing = tags[5];		
		this.parkingfood = tags[7];				this.reservationfood = tags[8];		
		this.restdatefood = tags[8];			this.seat = tags[9];			
		this.treatmenu = tags[10];
	}

	public String getDiscountinfofood() {
		return discountinfofood;
	}

	public void setDiscountinfofood(String discountinfofood) {
		this.discountinfofood = discountinfofood;
	}

	public String getFirstmenu() {
		return firstmenu;
	}

	public void setFirstmenu(String firstmenu) {
		this.firstmenu = firstmenu;
	}

	public String getInfocenterfood() {
		return infocenterfood;
	}

	public void setInfocenterfood(String infocenterfood) {
		this.infocenterfood = infocenterfood;
	}

	public String getKidsfacility() {
		return kidsfacility;
	}

	public void setKidsfacility(String kidsfacility) {
		this.kidsfacility = kidsfacility;
	}

	public String getOpentimefood() {
		return opentimefood;
	}

	public void setOpentimefood(String opentimefood) {
		this.opentimefood = opentimefood;
	}

	public String getPacking() {
		return packing;
	}

	public void setPacking(String packing) {
		this.packing = packing;
	}

	public String getParkingfood() {
		return parkingfood;
	}

	public void setParkingfood(String parkingfood) {
		this.parkingfood = parkingfood;
	}

	public String getReservationfood() {
		return reservationfood;
	}

	public void setReservationfood(String reservationfood) {
		this.reservationfood = reservationfood;
	}

	public String getRestdatefood() {
		return restdatefood;
	}

	public void setRestdatefood(String restdatefood) {
		this.restdatefood = restdatefood;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getTreatmenu() {
		return treatmenu;
	}

	public void setTreatmenu(String treatmenu) {
		this.treatmenu = treatmenu;
	}

	@Override
	public String toString() {
		return "TourAreaFoodDto [discountinfofood=" + discountinfofood + ", firstmenu=" + firstmenu
				+ ", infocenterfood=" + infocenterfood + ", kidsfacility=" + kidsfacility + ", opentimefood="
				+ opentimefood + ", packing=" + packing + ", parkingfood=" + parkingfood + ", reservationfood="
				+ reservationfood + ", restdatefood=" + restdatefood + ", seat=" + seat + ", treatmenu=" + treatmenu
				+ "]";
	}
	
	
	
	
	
	
}
