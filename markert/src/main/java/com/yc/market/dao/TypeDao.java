package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Type;

@Repository
public interface TypeDao extends BaseDao<Type> {
	
	//一级目录
	@Select("select * from type where parentid=0")
	List<Type> selectType1();
	
	//二级目录
	List<Type> selectType2(Integer typeid);
	
	//三级目录
	List<Type> selectType3(@Param("typeid1")Integer typeid1,@Param("typeid2")Integer typeid2);
}
