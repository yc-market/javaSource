package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;

import com.yc.market.bean.Image;

public interface ImageDao extends BaseDao<Image> {

	@Override
	@Insert("insert into image values(null,#{gid},#{imgname})")
	@Options(useGeneratedKeys=true,keyColumn="imgid",keyProperty="imgid")
	 void insert(Image t) ;

	@Override
	 void update(Image t) ;

	@Override
	@Select("select * from image where imgid = #{imgid}")
	 Image selectById(Integer id) ;

	@Override
	 void setSession(SqlSession session) ;
	
	@Select("select * from image where gid = #{gid}")
	List<Image> selectByGid(Integer gid);
	
}
