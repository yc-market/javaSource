package com.yc.market.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.yc.market.bean.BuyCar;
import com.yc.market.dao.BuyCarDao;
@Service
public class BuyCarBiz {
	@Autowired
	private BuyCarDao byDao;
	public List<BuyCar> ViewShoppingCar(Integer uid) {
		List<BuyCar> list = byDao.ViewShoppingCar(uid);
		System.out.println("aaaaa"+list);
		if(list.isEmpty()){
			return null;
		}else{
			return list;
		}
	}
	public void delete(Integer gid) {
		byDao.delete(gid);
	}
	
	public BuyCar addModel(BuyCar buyCar) {
		
		return buyCar =byDao.addModel(buyCar);
	}
	public List<BuyCar> selectByCarid(Integer carid) {
		
		List<BuyCar> buyCar=byDao.selectByCarid(carid);
		return buyCar;
		
	}
	public void update(BuyCar buyCar) {
		byDao.update(buyCar);
		
	}
	public List<BuyCar> selectBuyCar(Integer uid) {
		return byDao.selectBuyCar(uid);
		
	}

}
