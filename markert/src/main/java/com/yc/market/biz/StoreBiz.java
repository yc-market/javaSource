package com.yc.market.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.market.bean.Store;
import com.yc.market.dao.StoreDao;
import com.yc.market.dao.UserDao;

@Service
public class StoreBiz {
	@Resource
	StoreDao sdao ;
	UserDao udao;
	
	public void insert(Store s){
		sdao.insert(s);
	}
	
	public Store select(int uid){
		return sdao.selectById(uid);		
	}
	public Store selectStoreByUid(Integer uid) {
		return sdao.selectStoreByUid(uid);
		
	}
}
