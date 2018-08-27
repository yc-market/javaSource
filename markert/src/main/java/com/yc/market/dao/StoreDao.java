package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Goods;
import com.yc.market.bean.Image;
import com.yc.market.bean.Store;
@Repository
public interface StoreDao extends BaseDao<Store> {
	
	@Override
	@Insert("insert into store values(null,#{storename},#{uid})")
	@Options(useGeneratedKeys=true,keyColumn="storeid",keyProperty="storeid")
	 void insert(Store t) ;

	@Override
	 void update(Store t);

	@Override
	 Store selectById(Integer id);

	@Override
	 void setSession(SqlSession session) ;

	Store selectStoreByUid(Integer uid);
	
	List<Goods> selectGoods(Integer storeid);
	
	List<Image> selectImage(Integer gid);
}
