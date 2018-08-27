package com.yc.market.bean;

import java.util.List;

public class Store {
	private Integer storeid;
	private String storename;
	private Integer uid;
	
	private List<Goods> goods; //店铺对应商品,通过storeid连接商品表查出商品
	public Integer getStoreid() {
		return storeid;
	}
	@Override
	public String toString() {
		return "Store [storeid=" + storeid + ", storename=" + storename + ", uid=" + uid + ", goods=" + goods + "]";
	}
	public void setStoreid(Integer storeid) {
		this.storeid = storeid;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
}
