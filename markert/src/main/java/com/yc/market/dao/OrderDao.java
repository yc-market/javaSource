package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
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
	
	@Update("update orders set pay = #{pay} where orderid = #{orderid}")
	void update(Order t);
	
	@Insert("insert into orders (uid,orderid,buydate,buymoney,address,receiver,pay,way) values(#{uid},#{orderid},#{buydate},#{buymoney},#{address},#{receiver},#{pay},#{way})")
	@Options(useGeneratedKeys=true,keyColumn="oid",keyProperty="oid")
	void insert(Order t);
}
