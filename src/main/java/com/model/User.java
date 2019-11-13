package com.model;

public class User {
	
	private Integer uId;
	private String userName;
	private String userPass;
	private String email;
	private String phone;
	private Integer root;
	
	


	public Integer getRoot() {
		return root;
	}
	public void setRoot(Integer root) {
		this.root = root;
	}
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public User(String userName, String userPass) {
		super();
		this.userName = userName;
		this.userPass = userPass;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public User(Integer uId, String userName, String userPass, String email, String phone) {
		super();
		this.uId = uId;
		this.userName = userName;
		this.userPass = userPass;
		this.email = email;
		this.phone = phone;
	}
	public User(String userName, String userPass, String email, String phone) {
		super();
		this.userName = userName;
		this.userPass = userPass;
		this.email = email;
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "User [uId=" + uId + ", userName=" + userName + ", userPass=" + userPass + ", email=" + email
				+ ", phone=" + phone + "]";
	}
	
	
	
}
