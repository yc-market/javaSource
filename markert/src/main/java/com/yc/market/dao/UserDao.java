package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.BuyCar;
import com.yc.market.bean.Goods;
import com.yc.market.bean.Store;
import com.yc.market.bean.User;



@Repository
public interface UserDao extends BaseDao<User>{
	
	@Select("SELECT * from user where uname= #{uname}")
	List<User> selectUser(String uname);
	
	@Insert("insert into user (uname,upass,email,phone,invitor,invitid,totalgrade,identity) values(#{uname},#{upass},#{email},#{phone},#{invitor},#{invitid},#{totalgrade},#{identity})")
	@Options(useGeneratedKeys=true,keyColumn="uid",keyProperty="uid")
	void insert(User t);
	
	Store selectStoreByUid(Integer uid);
	
	Goods selectGoods();
	List<BuyCar> selectBuyCar();
	
	User selectUserByName(String uname);
	
	
}
