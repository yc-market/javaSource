package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Order;



@Repository
public interface OrderDao extends BaseDao<Order>{
	@Select("SELECT * from orders where uid= #{uid}")
	List<Order> selectOrder(Integer uid);
	
	@Select("SELECT * from orders where orderid= #{orderid}")
	List<Order> selectOrderGid(String orderid);
	
	@Update("update orders set enter = #{enter} , pay = #{pay} , deliver = #{deliver} where orderid = #{orderid}")
	void update(Order t);
	
	@Insert("insert into orders (uid,orderid,buydate,buymoney,address,receiver,enter,pay,deliver,way) values(#{uid},#{orderid},#{buydate},#{buymoney},#{address},#{receiver},#{enter},#{pay},#{deliver},#{way})")
	void insert(Order t);
}
