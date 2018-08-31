package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Detail;
import com.yc.market.bean.Favorite;
import com.yc.market.bean.Goods;
import com.yc.market.bean.Order;

@Repository
public interface DetailDao extends BaseDao<Detail>{
	@Insert("insert into detail (uid,oid,gid,count,sizeid,deliver) values(#{uid},#{oid},#{gid},#{count},#{sizeid},default)")
	void insert(Detail t);
	
	@Update("update detail set deliver = #{deliver} where did = #{did}")
	void update(Detail t);
	
	List<Detail> selectDetail(Integer integer);
	
	Goods selectGoods(Integer gid);
	
		//后台查询全部的订单
		List<Detail> selectAllDetail(Integer storeid);
		//判断是否发货，deliver：0-未发货，1-发货
		List<Detail> selectDeliverDetail(@Param("storeid")Integer storeid,@Param("deliver")Integer deliver);
		
		Order selectPayOrder(Integer oid);
}
