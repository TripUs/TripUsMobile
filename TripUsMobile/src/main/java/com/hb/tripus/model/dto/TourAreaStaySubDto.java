package com.hb.tripus.model.dto;

public class TourAreaStaySubDto implements TourAreaInterface{
	
	private String roomcode, roomtitle, roomsize1, roomcount, roombasecount, roommaxcount
	,roomintro, roombathfacility, roombath, roomhometheater, roomaircondition, roomtv
	,roompc,roomcable, roominternet, roomrefrigerator,roomtoiletries,roomsofa
	,roomcook,roomTable,roomhairdryer;
	private String  roomimg1, roomimg1alt, roomimg2, roomimg2alt
	,roomimg3, roomimg3alt, roomimg4, roomimg4alt,roomimg5,roomimg5alt;
	
	public TourAreaStaySubDto(){
		
	}
	@Override
	public String[] getTags(){
		String[] tags ={"roomcode","roomtitle","roomsize1","roomcount","roombasecount","roommaxcount"
				,"roomintro","roombathfacility","roombath","roomhometheater","roomaircondition","roomtv"
				,"roompc","roomcable","roominternet","roomrefrigerator","roomtoiletries","roomsofa"
				,"roomcook","roomTable","roomhairdryer"
				,"roomimg1","roomimg1alt","roomimg2","roomimg2alt","roomimg3","roomimg3alt"
				,"roomimg4","roomimg4alt","roomimg5","roomimg5alt"};
		return tags;
	}
	
	@Override
	public void setTagValue(String[] tags) {
		this.roomcode = tags[0];		this.roomtitle = tags[1];
		this.roomsize1 = tags[2];		this.roomcount = tags[3];
		this.roombasecount = tags[4];			this.roommaxcount = tags[5];		
		this.roomintro = tags[7];		this.roombathfacility = tags[8];		
		this.roombath = tags[8];		this.roomhometheater = tags[9];			
		this.roomaircondition = tags[10];			this.roomtv = tags[11];			
		this.roompc = tags[12];			this.roomcable = tags[13];			
		this.roominternet = tags[14];			this.roomrefrigerator = tags[15];			
		this.roomtoiletries = tags[16];     this.roomsofa = tags[17];
		this.roomcook = tags[18];		this.roomTable = tags[19];
		this.roomhairdryer = tags[20];			
		this.roomimg1 = tags[21];		this.roomimg1alt = tags[22];
		this.roomimg2 = tags[23];		this.roomimg2alt = tags[24];
		this.roomimg3 = tags[25];		this.roomimg3alt = tags[26];
		this.roomimg4 = tags[27];		this.roomimg4alt = tags[28];
		this.roomimg5 = tags[29];		this.roomimg5alt = tags[30];
		
	}
	public String getRoomcode() {
		return roomcode;
	}
	public String getRoomtitle() {
		return roomtitle;
	}
	public String getRoomsize1() {
		return roomsize1;
	}
	public String getRoomcount() {
		return roomcount;
	}
	public String getRoombasecount() {
		return roombasecount;
	}
	public String getRoommaxcount() {
		return roommaxcount;
	}
	public String getRoomintro() {
		return roomintro;
	}
	public String getRoombathfacility() {
		return roombathfacility;
	}
	public String getRoombath() {
		return roombath;
	}
	public String getRoomhometheater() {
		return roomhometheater;
	}
	public String getRoomaircondition() {
		return roomaircondition;
	}
	public String getRoomtv() {
		return roomtv;
	}
	public String getRoompc() {
		return roompc;
	}
	public String getRoomcable() {
		return roomcable;
	}
	public String getRoominternet() {
		return roominternet;
	}
	public String getRoomrefrigerator() {
		return roomrefrigerator;
	}
	public String getRoomtoiletries() {
		return roomtoiletries;
	}
	public String getRoomsofa() {
		return roomsofa;
	}
	public String getRoomcook() {
		return roomcook;
	}
	public String getRoomTable() {
		return roomTable;
	}
	public String getRoomhairdryer() {
		return roomhairdryer;
	}
	public String getRoomimg1() {
		return roomimg1;
	}
	public String getRoomimg1alt() {
		return roomimg1alt;
	}
	public String getRoomimg2() {
		return roomimg2;
	}
	public String getRoomimg2alt() {
		return roomimg2alt;
	}
	public String getRoomimg3() {
		return roomimg3;
	}
	public String getRoomimg3alt() {
		return roomimg3alt;
	}
	public String getRoomimg4() {
		return roomimg4;
	}
	public String getRoomimg4alt() {
		return roomimg4alt;
	}
	public String getRoomimg5() {
		return roomimg5;
	}
	public String getRoomimg5alt() {
		return roomimg5alt;
	}
	public void setRoomcode(String roomcode) {
		this.roomcode = roomcode;
	}
	public void setRoomtitle(String roomtitle) {
		this.roomtitle = roomtitle;
	}
	public void setRoomsize1(String roomsize1) {
		this.roomsize1 = roomsize1;
	}
	public void setRoomcount(String roomcount) {
		this.roomcount = roomcount;
	}
	public void setRoombasecount(String roombasecount) {
		this.roombasecount = roombasecount;
	}
	public void setRoommaxcount(String roommaxcount) {
		this.roommaxcount = roommaxcount;
	}
	public void setRoomintro(String roomintro) {
		this.roomintro = roomintro;
	}
	public void setRoombathfacility(String roombathfacility) {
		this.roombathfacility = roombathfacility;
	}
	public void setRoombath(String roombath) {
		this.roombath = roombath;
	}
	public void setRoomhometheater(String roomhometheater) {
		this.roomhometheater = roomhometheater;
	}
	public void setRoomaircondition(String roomaircondition) {
		this.roomaircondition = roomaircondition;
	}
	public void setRoomtv(String roomtv) {
		this.roomtv = roomtv;
	}
	public void setRoompc(String roompc) {
		this.roompc = roompc;
	}
	public void setRoomcable(String roomcable) {
		this.roomcable = roomcable;
	}
	public void setRoominternet(String roominternet) {
		this.roominternet = roominternet;
	}
	public void setRoomrefrigerator(String roomrefrigerator) {
		this.roomrefrigerator = roomrefrigerator;
	}
	public void setRoomtoiletries(String roomtoiletries) {
		this.roomtoiletries = roomtoiletries;
	}
	public void setRoomsofa(String roomsofa) {
		this.roomsofa = roomsofa;
	}
	public void setRoomcook(String roomcook) {
		this.roomcook = roomcook;
	}
	public void setRoomTable(String roomTable) {
		this.roomTable = roomTable;
	}
	public void setRoomhairdryer(String roomhairdryer) {
		this.roomhairdryer = roomhairdryer;
	}
	public void setRoomimg1(String roomimg1) {
		this.roomimg1 = roomimg1;
	}
	public void setRoomimg1alt(String roomimg1alt) {
		this.roomimg1alt = roomimg1alt;
	}
	public void setRoomimg2(String roomimg2) {
		this.roomimg2 = roomimg2;
	}
	public void setRoomimg2alt(String roomimg2alt) {
		this.roomimg2alt = roomimg2alt;
	}
	public void setRoomimg3(String roomimg3) {
		this.roomimg3 = roomimg3;
	}
	public void setRoomimg3alt(String roomimg3alt) {
		this.roomimg3alt = roomimg3alt;
	}
	public void setRoomimg4(String roomimg4) {
		this.roomimg4 = roomimg4;
	}
	public void setRoomimg4alt(String roomimg4alt) {
		this.roomimg4alt = roomimg4alt;
	}
	public void setRoomimg5(String roomimg5) {
		this.roomimg5 = roomimg5;
	}
	public void setRoomimg5alt(String roomimg5alt) {
		this.roomimg5alt = roomimg5alt;
	}
	@Override
	public String toString() {
		return "TourAreaStayDto_sub [roomcode=" + roomcode + ", roomtitle=" + roomtitle + ", roomsize1=" + roomsize1
				+ ", roomcount=" + roomcount + ", roombasecount=" + roombasecount + ", roommaxcount=" + roommaxcount
				+ ", roomintro=" + roomintro + ", roombathfacility=" + roombathfacility + ", roombath=" + roombath
				+ ", roomhometheater=" + roomhometheater + ", roomaircondition=" + roomaircondition + ", roomtv="
				+ roomtv + ", roompc=" + roompc + ", roomcable=" + roomcable + ", roominternet=" + roominternet
				+ ", roomrefrigerator=" + roomrefrigerator + ", roomtoiletries=" + roomtoiletries + ", roomsofa="
				+ roomsofa + ", roomcook=" + roomcook + ", roomTable=" + roomTable + ", roomhairdryer=" + roomhairdryer
				+ ", roomimg1=" + roomimg1 + ", roomimg1alt=" + roomimg1alt + ", roomimg2=" + roomimg2
				+ ", roomimg2alt=" + roomimg2alt + ", roomimg3=" + roomimg3 + ", roomimg3alt=" + roomimg3alt
				+ ", roomimg4=" + roomimg4 + ", roomimg4alt=" + roomimg4alt + ", roomimg5=" + roomimg5
				+ ", roomimg5alt=" + roomimg5alt + "]";
	}
	
	
}
