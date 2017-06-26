package com.hb.tripus.model.dto;

public class FriendListDto {

	private String userid, friendid, friendprofile, friendnicname;
	
	public FriendListDto() {
		// TODO Auto-generated constructor stub
	}

	public FriendListDto(String userid, String friendid, String friendprofile, String friendnicname) {
		super();
		this.userid = userid;
		this.friendid = friendid;
		this.friendprofile = friendprofile;
		this.friendnicname = friendnicname;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getFriendid() {
		return friendid;
	}

	public void setFriendid(String friendid) {
		this.friendid = friendid;
	}

	public String getFriendprofile() {
		return friendprofile;
	}

	public void setFriendprofile(String friendprofile) {
		this.friendprofile = friendprofile;
	}

	public String getFriendnicname() {
		return friendnicname;
	}

	public void setFriendnicname(String friendnicname) {
		this.friendnicname = friendnicname;
	}

	@Override
	public String toString() {
		return "FriendListDto [userid=" + userid + ", friendid=" + friendid + ", friendprofile=" + friendprofile
				+ ", friendnicname=" + friendnicname + "]";
	}
	
}
