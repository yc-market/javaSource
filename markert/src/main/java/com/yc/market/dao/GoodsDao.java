package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Goods;
import com.yc.market.bean.Image;
import com.yc.market.bean.Attribute;

@Repository
public interface GoodsDao extends BaseDao<Goods> {

	@Override
	void update(Goods t) ;
	
	List<Goods> selectgood() ;
	
	List<Image> selectimg(Integer gid);

	//Goods selectbygid1(Integer gid);

	@Override
	void setSession(SqlSession session) ;


	@Insert("insert into goods values (null,#{gname},#{price},#{type},#{grade},#{des},#{storeid})")
	@Options(useGeneratedKeys=true,keyColumn="gid",keyProperty="gid")
	void insert(Goods good);
	
	@Select("select * from goods where gid = #{gid}")
	Goods selectById(Integer gid);
	
	@Select("select * from goods")
	List<Goods> selectAll();
	
	List<Attribute> selectSize(Integer gid);
}
