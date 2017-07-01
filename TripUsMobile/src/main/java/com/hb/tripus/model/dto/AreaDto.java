package com.hb.tripus.model.dto;

public class AreaDto implements TourAreaInterface {

	private int areacode, sigungucode;
	private String name;
	
	@Override
	public String[] getTags() {
		String tags[] = {"areacode", "sigungucode", "name"};
		return tags;
	}
	@Override
	public void setTagValue(String[] tags) {
		this.areacode = Integer.parseInt(tags[0]);
		this.sigungucode = Integer.parseInt(tags[1]);
		this.name = tags[2];
	}
	
	public AreaDto() {
		// TODO Auto-generated constructor stub
	}
	
	public AreaDto(int areacode, int sigungucode, String name) {
		super();
		this.areacode = areacode;
		this.sigungucode = sigungucode;
		this.name = name;
	}
	
	public int getAreacode() {
		return areacode;
	}
	
	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}
	
	public int getSigungucode() {
		return sigungucode;
	}
	
	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "AreaDto [areacode=" + areacode + ", sigungucode=" + sigungucode + ", name=" + name + "]";
	}
	
}
