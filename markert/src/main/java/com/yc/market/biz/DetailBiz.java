package com.yc.market.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.market.bean.Detail;
import com.yc.market.bean.Order;
import com.yc.market.bean.User;
import com.yc.market.dao.DetailDao;

@Service
public class DetailBiz {
	@Autowired
	private DetailDao detatlDao;
	
	public void addDetail(Detail detail) throws BizException {
		detatlDao.insert(detail);
	}
	public List<Detail> SelectDetail(Integer integer) throws BizException {
		List<Detail> list = detatlDao.selectDetail(integer);
		return list;
	}
	public List<Detail> selectAllDetail(Integer storeid) throws BizException {
		List<Detail> list = detatlDao.selectAllDetail(storeid);
		return list;
	}
	public List<Detail> selectDeliverDetail(Integer storeid,Integer deliver) throws BizException {
		List<Detail> list = detatlDao.selectDeliverDetail(storeid, deliver);
		return list;
	}
	public  void  update(Detail detail) throws BizException{
		detatlDao.update(detail);
    }
}
