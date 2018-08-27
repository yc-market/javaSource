package com.yc.market.dao;

import org.apache.ibatis.session.SqlSession;

public interface BaseDao <T>{
	
	void insert(T t);
	
	void update(T t);
	
	T selectById(Integer id);
	
	void setSession(SqlSession session);
	
}
