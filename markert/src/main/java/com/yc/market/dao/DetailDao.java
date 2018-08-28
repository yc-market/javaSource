package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Detail;
import com.yc.market.bean.Favorite;
import com.yc.market.bean.Goods;

@Repository
public interface DetailDao extends BaseDao<Detail>{
	@Insert("insert into detail (uid,oid,gid,count,sizeid) values(#{uid},#{oid},#{gid},#{count},#{sizeid})")
	void insert(Detail t);
	
	List<Detail> selectDetail(Integer integer);
	
	Goods selectGoods(Integer gid);
}
