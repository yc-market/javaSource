package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Payment;

@Repository
public interface PaymentDao extends BaseDao<Payment>{
	
	@Select("SELECT * from payment where uid= #{uid} and account = #{account}")
	List<Payment> selectUser(@Param("uid")Integer uid,@Param("account")Integer account);
	
	@Update("update payment set balance = #{balance} where uid = #{uid} and account = #{account}")
	void update(Payment t);
	
	@Insert("insert into payment values (null,#{uid},#{account},#{balance},#{accname})")
	@Options(useGeneratedKeys=true,keyColumn="aid",keyProperty="aid")
	void insert(Payment t);
}
