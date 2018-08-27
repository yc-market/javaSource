package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Favorite;
import com.yc.market.bean.Goods;
import com.yc.market.bean.Image;

@Repository
public interface FavoriteDao extends BaseDao<Favorite>{
	//@Select("SELECT * from favorite where uid= #{uid}")
	List<Favorite> selectFavorite(Integer uid);
	
	@Insert("insert into favorite (fid,uid,gid) values(#{fid},#{uid},#{gid})")
	void insert(Favorite t);
	
	@Delete("delete from favorite where uid = #{uid} and gid = #{gid}")
	void delete(Favorite t);
	
	@Select("select * from favorite where uid = #{uid} and gid = #{gid}")
	List<Favorite> selectByGid(@Param("uid")Integer uid,@Param("gid")Integer gid) ;
	
	List<Image>	selectImage(Integer gid);
	
	Goods selectGoods(Integer gid);
	
}
