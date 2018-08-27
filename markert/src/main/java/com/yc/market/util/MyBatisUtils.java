package com.yc.market.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtils {
	private static SqlSessionFactory ssf;

	public static void init(String configFile){
	    InputStream in;
		try{
		

		in = Resources.getResourceAsStream(configFile);
		// 会话工厂构造器
		ssf= new SqlSessionFactoryBuilder().build(in);
		}catch(IOException e){
			throw new RuntimeException(e);
		}
	}
	public static SqlSession openSession(){
		
		return ssf.openSession();
	}
	
}

