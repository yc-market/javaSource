package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Attribute;
import com.yc.market.bean.BuyCar;
import com.yc.market.bean.Goods;
@Repository
public interface BuyCarDao extends BaseDao<BuyCar>{
    @Select("select c.*,g.*,i.* from shoppingcar c  left join goods g on c.gid=g.gid left join image i on g.gid=i.gid where uid=#{uid} ")
	List<BuyCar> ViewShoppingCar(Integer uid);

    
    @Delete("delete from shoppingcar where carid=#{carid}")
	void delete(Integer sizeid);

    @Insert("insert into shoppingcar(gid,uid,count,buydate,sizeid) values (#{gid},#{uid},#{count},#{buydate},#{sizeid})")
    @Options(useGeneratedKeys=true,keyColumn="carid",keyProperty="carid")
	void addModel(BuyCar buyCar);

   // @Select("select c.*,g.*,i.* from shoppingcar c  left join goods g on c.gid=g.gid  left join image i on g.gid=i.gid where carid=#{carid} ")
    List<BuyCar> selectByCarid(Integer carid);
    
    @Update("update shoppingcar set count=#{count} where carid=#{carid}")
    void update(BuyCar buyCar);


	List<BuyCar> selectBuyCar(Integer uid);
	
	Goods selectGoods();
	
	Attribute selectAttribute(Integer sizeid);
}
