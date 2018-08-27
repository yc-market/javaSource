package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Size;

@Repository
public interface SizeDao extends BaseDao<Size> {

	@Select("select * from size where gid = #{gid}")
	List<Size> selectByGid(Integer gid);

	@Override
	void insert(Size t) ;

	@Override
	default void update(Size t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	 Size selectById(Integer id);

	@Override
	 void setSession(SqlSession session) ;
}
