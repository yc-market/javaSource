package com.yc.market.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.market.bean.Detail;
import com.yc.market.bean.User;
import com.yc.market.dao.DetailDao;

@Service
public class DetailBiz {
	@Autowired
	private DetailDao detatlDao;
	
	public void addDetail(Detail detail) throws BizException {
		detatlDao.insert(detail);
	}
	public List<Detail> SelectDetail(String orderid) throws BizException {
		List<Detail> list = detatlDao.selectDetail(orderid);
		return list;
	}
}
