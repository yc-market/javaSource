package com.yc.market.bean;
/**
 * 商品规格
 * @author user
 *
 */
public class Attribute {
	private Integer sizeid;
	private Integer gid;
	private String size;
	private Double price; 
	
	
	
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getSizeid() {
		return sizeid;
	}
	public void setSizeid(Integer sizeid) {
		this.sizeid = sizeid;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	@Override
	public String toString() {
		return "Attribute [sizeid=" + sizeid + ", gid=" + gid + ", size=" + size + ", price=" + price + "]";
	}
	
	
}
