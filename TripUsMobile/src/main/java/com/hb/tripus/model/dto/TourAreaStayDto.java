package com.hb.tripus.model.dto;

public  class TourAreaStayDto implements TourAreaInterface {
	
	private String accomcountlodging, checkintime, checkouttime, chkcooking, foodplacem, goodstay,
	infocenterlodging, parkinglodging, pickup, roomcount, reservationlodging, reservationurl, roomtype,scalelodging;
	private String  barbecue, bicycle, campfire, fitness, karaoke, publicpc, sauna, sports;
	
	public TourAreaStayDto(){
		
	}
	@Override
	public String[] getTags(){
		String[] tags ={"accomcountlodging","checkintime","checkouttime","chkcooking","foodplacem","goodstay"
				,"infocenterlodging","parkinglodging","pickup","roomcount","reservationlodging","reservationurl"
				,"roomtype","scalelodging"
				,"barbecue","bicycle","campfire","fitness","karaoke","publicpc"
				,"sauna","sports"};
		return tags;
	}
	
	@Override
	public void setTagValue(String[] tags) {
		this.accomcountlodging = tags[0];		this.checkintime = tags[1];
		this.checkouttime = tags[2];		this.chkcooking = tags[3];
		this.foodplacem = tags[4];			this.goodstay = tags[5];		
		this.infocenterlodging = tags[7];		this.parkinglodging = tags[8];		
		this.pickup = tags[8];		this.roomcount = tags[9];			
		this.reservationlodging = tags[10];			this.reservationurl = tags[11];			
		this.roomtype = tags[12];			this.scalelodging = tags[13];			
		this.barbecue = tags[14];			this.bicycle = tags[15];
		this.campfire = tags[16];			this.fitness = tags[17];
		this.karaoke = tags[18];			this.publicpc = tags[19];
		this.sauna = tags[20];			this.sports = tags[21];
		
	}
	public String getAccomcountlodging() {
		return accomcountlodging;
	}
	public String getCheckintime() {
		return checkintime;
	}
	public String getCheckouttime() {
		return checkouttime;
	}
	public String getChkcooking() {
		return chkcooking;
	}
	public String getFoodplacem() {
		return foodplacem;
	}
	public String getGoodstay() {
		return goodstay;
	}
	public String getInfocenterlodging() {
		return infocenterlodging;
	}
	public String getParkinglodging() {
		return parkinglodging;
	}
	public String getPickup() {
		return pickup;
	}
	public String getRoomcount() {
		return roomcount;
	}
	public String getReservationlodging() {
		return reservationlodging;
	}
	public String getReservationurl() {
		return reservationurl;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public String getScalelodging() {
		return scalelodging;
	}
	
	public String getBarbecue() {
		return barbecue;
	}
	public String getBicycle() {
		return bicycle;
	}
	public String getCampfire() {
		return campfire;
	}
	public String getFitness() {
		return fitness;
	}
	public String getKaraoke() {
		return karaoke;
	}
	public String getPublicpc() {
		return publicpc;
	}
	public String getSauna() {
		return sauna;
	}
	public String getSports() {
		return sports;
	}
	public void setAccomcountlodging(String accomcountlodging) {
		this.accomcountlodging = accomcountlodging;
	}
	public void setCheckintime(String checkintime) {
		this.checkintime = checkintime;
	}
	public void setCheckouttime(String checkouttime) {
		this.checkouttime = checkouttime;
	}
	public void setChkcooking(String chkcooking) {
		this.chkcooking = chkcooking;
	}
	public void setFoodplacem(String foodplacem) {
		this.foodplacem = foodplacem;
	}
	public void setGoodstay(String goodstay) {
		this.goodstay = goodstay;
	}
	public void setInfocenterlodging(String infocenterlodging) {
		this.infocenterlodging = infocenterlodging;
	}
	public void setParkinglodging(String parkinglodging) {
		this.parkinglodging = parkinglodging;
	}
	public void setPickup(String pickup) {
		this.pickup = pickup;
	}
	public void setRoomcount(String roomcount) {
		this.roomcount = roomcount;
	}
	public void setReservationlodging(String reservationlodging) {
		this.reservationlodging = reservationlodging;
	}
	public void setReservationurl(String reservationurl) {
		this.reservationurl = reservationurl;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public void setScalelodging(String scalelodging) {
		this.scalelodging = scalelodging;
	}
	
	public void setBarbecue(String barbecue) {
		this.barbecue = barbecue;
	}
	public void setBicycle(String bicycle) {
		this.bicycle = bicycle;
	}
	public void setCampfire(String campfire) {
		this.campfire = campfire;
	}
	public void setFitness(String fitness) {
		this.fitness = fitness;
	}
	public void setKaraoke(String karaoke) {
		this.karaoke = karaoke;
	}
	public void setPublicpc(String publicpc) {
		this.publicpc = publicpc;
	}
	public void setSauna(String sauna) {
		this.sauna = sauna;
	}
	public void setSports(String sports) {
		this.sports = sports;
	}
	@Override
	public String toString() {
		return "TourAreaStayDto [accomcountlodging=" + accomcountlodging + ", checkintime=" + checkintime
				+ ", checkouttime=" + checkouttime + ", chkcooking=" + chkcooking + ", foodplacem=" + foodplacem
				+ ", goodstay=" + goodstay + ", infocenterlodging=" + infocenterlodging + ", parkinglodging="
				+ parkinglodging + ", pickup=" + pickup + ", roomcount=" + roomcount + ", reservationlodging="
				+ reservationlodging + ", reservationurl=" + reservationurl + ", roomtype=" + roomtype
				+ ", scalelodging=" + scalelodging + ", subfacility=" +  ", barbecue=" + barbecue
				+ ", bicycle=" + bicycle + ", campfire=" + campfire + ", fitness=" + fitness + ", karaoke=" + karaoke
				+ ", publicpc=" + publicpc + ", sauna=" + sauna + ", sports=" + sports + "]";
	}
	



}
