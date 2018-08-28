package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Attribute;

@Repository
public interface AttributeDao extends BaseDao<Attribute> {

	@Select("select * from attribute where gid = #{gid}")
	List<Attribute> selectByGid(Integer gid);

	@Override
	void insert(Attribute t) ;

	@Override
	default void update(Attribute t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	 Attribute selectById(Integer id);

	@Override
	 void setSession(SqlSession session) ;
    @Insert("insert into attribute(gid,size,price) values (#{gid},#{size},#{price})")
    @Options(useGeneratedKeys=true,keyColumn="sizeid",keyProperty="sizeid")
	void addSize(Attribute attribute);
    
    @Select("select * from attribute where sizeid=#{sizeid}")
	Attribute SelectPriceBySize(Integer sizeid);
}
