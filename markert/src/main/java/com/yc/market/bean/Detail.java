package com.yc.market.bean;

public class Detail {
	private Integer did;
	private Integer uid;
	private Integer oid;
	private Integer gid;
	private Integer count;
	private Integer sizeid;
	private Integer deliver;
	
	
	private Attribute attribute;  //商品属性（包含规格和价格）
	private Goods goods;
	private Order order;
	
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getSizeid() {
		return sizeid;
	}
	public void setSizeid(Integer sizeid) {
		this.sizeid = sizeid;
	}
	public Attribute getAttribute() {
		return attribute;
	}
	public void setAttribute(Attribute attribute) {
		this.attribute = attribute;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Integer getDeliver() {
		return deliver;
	}
	public void setDeliver(Integer deliver) {
		this.deliver = deliver;
	}
	
}
