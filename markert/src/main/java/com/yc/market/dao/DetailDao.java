package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Detail;
import com.yc.market.bean.Favorite;
import com.yc.market.bean.Goods;

@Repository
public interface DetailDao extends BaseDao<Detail>{
	@Insert("insert into detail (uid,orderid,gid,count) values(#{uid},#{orderid},#{gid},#{count})")
	void insert(Detail t);
	
	List<Detail> selectDetail(String orderid);
	
	Goods selectGoods(Integer gid);
}
