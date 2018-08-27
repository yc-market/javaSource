package com.yc.market.bean;

import java.sql.Timestamp;

public class Address {
     private Integer addrid ;
     private String area;
     private String receiver;
     private String phone;
     private String building;
     private String email;
     private Integer emailid;
     private String tel;
     private Timestamp postdate;
     private Integer uid;
     
	public Integer getAddrid() {
		return addrid;
	}
	public void setAddrid(Integer addrid) {
		this.addrid = addrid;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBuilding() {
		return building;
	}
	public void setBuilding(String building) {
		this.building = building;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getEmailid() {
		return emailid;
	}
	public void setEmailid(Integer emailid) {
		this.emailid = emailid;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Timestamp getPostdate() {
		return postdate;
	}
	public void setPostdate(Timestamp postdate) {
		this.postdate = postdate;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "Address [addrid=" + addrid + ", area=" + area + ", receiver=" + receiver + ", phone=" + phone
				+ ", building=" + building + ", email=" + email + ", emailid=" + emailid + ", tel=" + tel
				+ ", postdate=" + postdate + ", uid=" + uid + "]";
	}
     
     
}
