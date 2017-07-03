package com.hb.tripus.model.dto;

public class TourAreaRecommendDto implements TourAreaInterface {

	private String distance, infocentertourcourse, schedule, taketime, theme;
	
	@Override
	public String toString() {
		return "TourAreaRecommendDto [distance=" + distance + ", infocentertourcourse=" + infocentertourcourse
				+ ", schedule=" + schedule + ", taketime=" + taketime + ", theme=" + theme + "]";
	}
					

	
	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getInfocentertourcourse() {
		return infocentertourcourse;
	}

	public void setInfocenterourcourse(String infocentertourcourse) {
		this.infocentertourcourse = infocentertourcourse;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getTaketime() {
		return taketime;
	}

	public void setTaketime(String taketime) {
		this.taketime = taketime;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}



	@Override
	public String[] getTags() {
		String[] tags = {"distance","infocentertourcourse","schedule","taketime","theme"};
		return tags;
	}

	@Override
	public void setTagValue(String[] tags) {
		this.distance = tags[0];	this.infocentertourcourse = tags[1];
		this.schedule = tags[2];	this.taketime = tags[3];
		this.theme = tags[4];		
	
	}

}
