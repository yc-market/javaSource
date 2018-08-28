package com.yc.market.bean;

import java.sql.Timestamp;

/**
 * 购物车
 * @author Lenovo
 *
 */
public class BuyCar {
     private  Integer  carid ;
     private  Integer  gid ;
     private  Integer  uid ;
     private  Integer  count;   //数量
     private  Integer   sizeid;
     private  Timestamp buydate;
     
     private Goods goods;
     private Attribute attribute;
     
	public Attribute getAttribute() {
		return attribute;
	}
	public void setAttribute(Attribute attribute) {
		this.attribute = attribute;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Timestamp getBuydate() {
		return buydate;
	}
	public void setBuydate(Timestamp buydate) {
		this.buydate = buydate;
	}
	
	public Integer getSizeid() {
		return sizeid;
	}
	public void setSizeid(Integer sizeid) {
		this.sizeid = sizeid;
	}
	
	public Integer getCarid() {
		return carid;
	}
	public void setCarid(Integer carid) {
		this.carid = carid;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
}
