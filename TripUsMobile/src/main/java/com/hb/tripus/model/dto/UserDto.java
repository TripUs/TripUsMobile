package com.hb.tripus.model.dto;

public class UserDto {

	private String id, pw, name, nicname, birthday, email, profile;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}
	
	public UserDto(String id, String pw, String name, String nicname, String birthday, String email, String profile) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nicname = nicname;
		this.birthday = birthday;
		this.email = email;
		this.profile = profile;
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

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
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
		return "UserDto [id=" + id + ", pw=" + pw + ", name=" + name + ", nicname=" + nicname + ", birthday=" + birthday
				+ ", email=" + email + ", profile=" + profile + "]";
	}
		
}
