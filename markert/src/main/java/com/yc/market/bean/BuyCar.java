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
     
     private  Integer  grade;   //积分
     private  Integer  option;  //操作
     private  String   gname;
     private  String   size;
     private  double   price;
     private  Timestamp buydate;
     
     private Goods goods;
     private String imageName;
     
     
    
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
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
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
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
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public Integer getOption() {
		return option;
	}
	public void setOption(Integer option) {
		this.option = option;
	}
     
     
}
