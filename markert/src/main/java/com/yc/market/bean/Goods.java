package com.yc.market.bean;

import java.util.List;

/**
 * 商品类
 * @author user
 *
 */
public class Goods {
	

	private Integer gid;   		 //商品ID
	private String gname;		 //商品名称			 		 
	private Integer grade;		 //商品积分
	private String des;			 //商品简介
	private Double price;		 //商品价格
	private Integer storeid;	 //商品所属店铺
	private Integer count;
	private String type;		//商品类型
	
	private List<Attribute> attribute;	//商品规格  一个商品对应多个规格
	private List<Image> image;	//对应图片集合
	private Integer isDown ; //商品下架，0=未下架，1==下架

	
	
	
	public Integer getIsDown() {
		return isDown;
	}

	public void setIsDown(Integer isDown) {
		this.isDown = isDown;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public List<Attribute> getAttribute() {
		return attribute;
	}

	public void setAttribute(List<Attribute> attribute) {
		this.attribute = attribute;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Integer getStoreid() {
		return storeid;
	}

	public void setStoreid(Integer storeid) {
		this.storeid = storeid;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public List<Image> getImage() {
		return image;
	}

	public void setImage(List<Image> image) {
		this.image = image;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", gname=" + gname + ", grade=" + grade + ", des=" + des + ", price=" + price
				+ ", storeid=" + storeid + ", count=" + count + ", type=" + type + ", attribute=" + attribute
				+ ", image=" + image + ", isDown=" + isDown + "]";
	}

	
	
}
