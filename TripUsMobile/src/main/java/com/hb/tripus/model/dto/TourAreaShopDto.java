package com.hb.tripus.model.dto;

public class TourAreaShopDto implements TourAreaInterface{
	private String chkbabycarriageshopping, chkpetshopping, fairday, infocentershopping, opentime; 
	private String parkingshopping, restdateshopping, saleitem, saleitemcost, scaleshopping, shopguide;
	
	@Override
	public String[] getTags() {
		String[] tags = {"chkbabycarriageshopping", "chkpetshopping", "fairday", "infocentershopping", "opentime",
				"parkingshopping", "restdateshopping", "saleitem", "saleitemcost", "scaleshopping", "shopguide"};
		return tags;
	}

	@Override
	public void setTagValue(String[] tags) {
		this.chkbabycarriageshopping = tags[0];		this.chkpetshopping = tags[1];
		this.fairday = tags[2];						this.infocentershopping = tags[3];
		this.opentime = tags[4];					this.parkingshopping = tags[5];		
		this.restdateshopping = tags[7];			this.saleitem = tags[8];		
		this.saleitemcost = tags[8];				this.scaleshopping = tags[9];			
		this.shopguide = tags[10];
	}

	public String getChkbabycarriageshopping() {
		return chkbabycarriageshopping;
	}

	public void setChkbabycarriageshopping(String chkbabycarriageshopping) {
		this.chkbabycarriageshopping = chkbabycarriageshopping;
	}

	public String getChkpetshopping() {
		return chkpetshopping;
	}

	public void setChkpetshopping(String chkpetshopping) {
		this.chkpetshopping = chkpetshopping;
	}

	public String getFairday() {
		return fairday;
	}

	public void setFairday(String fairday) {
		this.fairday = fairday;
	}

	public String getInfocentershopping() {
		return infocentershopping;
	}

	public void setInfocentershopping(String infocentershopping) {
		this.infocentershopping = infocentershopping;
	}

	public String getOpentime() {
		return opentime;
	}

	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}

	public String getParkingshopping() {
		return parkingshopping;
	}

	public void setParkingshopping(String parkingshopping) {
		this.parkingshopping = parkingshopping;
	}

	public String getRestdateshopping() {
		return restdateshopping;
	}

	public void setRestdateshopping(String restdateshopping) {
		this.restdateshopping = restdateshopping;
	}

	public String getSaleitem() {
		return saleitem;
	}

	public void setSaleitem(String saleitem) {
		this.saleitem = saleitem;
	}

	public String getSaleitemcost() {
		return saleitemcost;
	}

	public void setSaleitemcost(String saleitemcost) {
		this.saleitemcost = saleitemcost;
	}

	public String getScaleshopping() {
		return scaleshopping;
	}

	public void setScaleshopping(String scaleshopping) {
		this.scaleshopping = scaleshopping;
	}

	public String getShopguide() {
		return shopguide;
	}

	public void setShopguide(String shopguide) {
		this.shopguide = shopguide;
	}

	@Override
	public String toString() {
		return "TourAreaShopDto [chkbabycarriageshopping=" + chkbabycarriageshopping + ", chkpetshopping="
				+ chkpetshopping + ", fairday=" + fairday + ", infocentershopping=" + infocentershopping + ", opentime="
				+ opentime + ", parkingshopping=" + parkingshopping + ", restdateshopping=" + restdateshopping
				+ ", saleitem=" + saleitem + ", saleitemcost=" + saleitemcost + ", scaleshopping=" + scaleshopping
				+ ", shopguide=" + shopguide + "]";
	}
	
	
	

}
