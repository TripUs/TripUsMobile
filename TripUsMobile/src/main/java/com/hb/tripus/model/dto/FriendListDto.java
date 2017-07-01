package com.hb.tripus.model.dto;

public class FriendListDto {

	private String userid, friendid, friendprofile, friendname, friendnicname, friendemail;
	private int flag;
	
	public FriendListDto() {
		// TODO Auto-generated constructor stub
	}

	public FriendListDto(String userid, String friendid, String friendprofile, String friendname, String friendnicname, String friendemail, int flag) {
		super();
		this.userid = userid;
		this.friendid = friendid;
		this.friendprofile = friendprofile;
		this.friendname = friendname;
		this.friendnicname = friendnicname;
		this.friendemail = friendemail;
		this.flag = flag;
	}
	
	public String getFriendemail() {
		return friendemail;
	}

	public void setFriendemail(String friendemail) {
		this.friendemail = friendemail;
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

	public String getFriendname() {
		return friendname;
	}

	public void setFriendname(String friendname) {
		this.friendname = friendname;
	}

	public String getFriendnicname() {
		return friendnicname;
	}

	public void setFriendnicname(String friendnicname) {
		this.friendnicname = friendnicname;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "FriendListDto [userid=" + userid + ", friendid=" + friendid + ", friendprofile=" + friendprofile
				+ ", friendname=" + friendname + ", friendnicname=" + friendnicname + ", friendemail=" + friendemail
				+ ", flag=" + flag + "]";
	}
	
}
