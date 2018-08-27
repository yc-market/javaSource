package com.yc.market.bean;

import java.sql.Timestamp;

public class Order {
	private Integer oid;
	private Integer uid;
	private String orderid;
	private Timestamp buydate;
	private Double buymoney;
	private String address;
	private Integer enter;
	private Integer pay;
	private Integer deliver;
	private String way;
	private String receiver;
	
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public Timestamp getBuydate() {
		return buydate;
	}
	public void setBuydate(Timestamp buydate) {
		this.buydate = buydate;
	}
	public Double getBuymoney() {
		return buymoney;
	}
	public void setBuymoney(Double buymoney) {
		this.buymoney = buymoney;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getEnter() {
		return enter;
	}
	public void setEnter(Integer enter) {
		this.enter = enter;
	}
	public Integer getPay() {
		return pay;
	}
	public void setPay(Integer pay) {
		this.pay = pay;
	}
	public Integer getDeliver() {
		return deliver;
	}
	public void setDeliver(Integer deliver) {
		this.deliver = deliver;
	}
	public String getWay() {
		return way;
	}
	public void setWay(String way) {
		this.way = way;
	}
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", uid=" + uid + ", orderid=" + orderid + ", buydate=" + buydate + ", buymoney="
				+ buymoney + ", address=" + address + ", enter=" + enter + ", pay=" + pay + ", deliver=" + deliver
				+ ", way=" + way + "]";
	}
	
}
