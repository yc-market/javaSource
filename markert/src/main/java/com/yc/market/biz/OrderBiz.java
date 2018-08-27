package com.yc.market.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.market.bean.Order;
import com.yc.market.bean.User;
import com.yc.market.dao.OrderDao;



@Service
public class OrderBiz {
	
	@Autowired
	private OrderDao orderDao;
	
	//修改订单状态
	public  void  update(String gid) throws BizException{
		List<Order> list = orderDao.selectOrderGid(gid);
		if(list.size()>0){
    		Order order = list.get(0);
    		order.setPay(1);
    		orderDao.update(order);
    	}else{
    		throw new BizException("不存在该订单！");
    	}
    }
	//订单查询
	public List<Order> order(Integer uid) throws BizException{
		List<Order> list = orderDao.selectOrder(uid);
			if(list.isEmpty()){
				return null;
			}else{
				return list;
			}
		}
	public void addOrder(Order order) throws BizException {

		List<Order> list = orderDao.selectOrderGid(order.getOrderid());

		if (list.size() > 0) {
			throw new BizException("该订单已存在");
		} else {
			orderDao.insert(order);
		}
	}
}
