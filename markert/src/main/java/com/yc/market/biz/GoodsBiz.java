package com.yc.market.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.market.bean.Goods;
import com.yc.market.bean.Image;
import com.yc.market.dao.GoodsDao;

@Service
public class GoodsBiz {
	
	@Resource
	private GoodsDao gdao;
	
	public void insert(Goods g){
		gdao.insert(g);
	}
	
	public Goods selectById(int gid){
		return gdao.selectById(gid);		
	}
	
	public List<Goods> selectAll(){
		return gdao.selectAll();		
	}
	
	public List<Goods> selectgood(){
		return gdao.selectgood();
	}
	
	
}
