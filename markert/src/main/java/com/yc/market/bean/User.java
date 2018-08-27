package com.yc.market.bean;

import java.util.List;

public class User {
	private Integer uid;
	private String uname;
	private String upass;
	private String email;
	private String phone;
	private String invitor;
	private Integer invitid;
	private Integer totalgrade;
	private Integer identity;
	
	private Store store;
	private List<BuyCar> car;
	//
	
	private List<Favorite> favorites;
	
	
	public List<BuyCar> getCar() {
		return car;
	}
	public void setCar(List<BuyCar> car) {
		this.car = car;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
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
	public String getInvitor() {
		return invitor;
	}
	public void setInvitor(String invitor) {
		this.invitor = invitor;
	}
	public Integer getInvitid() {
		return invitid;
	}
	public void setInvitid(Integer invitid) {
		this.invitid = invitid;
	}
	public Integer getTotalgrade() {
		return totalgrade;
	}
	public void setTotalgrade(Integer totalgrade) {
		this.totalgrade = totalgrade;
	}
	public Integer getIdentity() {
		return identity;
	}
	public void setIdentity(Integer identity) {
		this.identity = identity;
	}
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
	public List<Favorite> getFavorites() {
		return favorites;
	}
	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}
	
}
