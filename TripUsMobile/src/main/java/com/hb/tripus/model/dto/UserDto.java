package com.hb.tripus.model.dto;

public class UserDto {

	private String id, pw, name, nicname, email, profile, usertype, token;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}
	
	public UserDto(String id, String pw, String name, String nicname, String birthday, String email, String profile, String usertype, String token) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nicname = nicname;
		this.email = email;
		this.profile = profile;
		this.usertype = usertype;
		this.token = token;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNicname() {
		return nicname;
	}

	public void setNicname(String nicname) {
		this.nicname = nicname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "UserDto [id=" + id + ", pw=" + pw + ", name=" + name + ", nicname=" + nicname
				+ ", email=" + email + ", profile=" + profile + ", usertype=" + usertype + "]";
	}
	
}
