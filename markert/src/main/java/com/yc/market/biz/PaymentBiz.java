package com.yc.market.biz;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.market.bean.Payment;
import com.yc.market.bean.Record;
import com.yc.market.dao.PaymentDao;
import com.yc.market.dao.RecordDao;

@Service
public class PaymentBiz {
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private RecordDao recordDao;
	
	public void insert(Payment payment) throws BizException{
		List<Payment> account = paymentDao.selectUser(payment.getUid(),payment.getAccount());
		if(account.size()==0){
			paymentDao.insert(payment);
		}else{
			if(payment.getAccount()==1){
				throw new BizException("支付宝账户已存在，无需多次绑定");
			}else if(payment.getAccount()==2){
				throw new BizException("微信账户已存在，无需多次绑定");
			}			
		}
		
	}
	
	public void payment(Payment payment,Double buymoney) throws BizException{
    	
    	List<Payment> list = paymentDao.selectUser(payment.getUid(),payment.getAccount());
    	
    	if(list.size()>0){
    		Double balance = list.get(0).getBalance()-buymoney;
    		if(balance>0){
    			payment.setBalance(balance);
    			paymentDao.update(payment);
    			
    			Record record = new Record();
    			record.setModtime(new Timestamp(System.currentTimeMillis()));
    			record.setUid(payment.getUid());
    			record.setAccount(payment.getAccount());
    			record.setChanges("-" + buymoney);
    	    	recordDao.insert(record);
    		}else{
    			throw new BizException("余额不足！");
    		}
    	}else{
    		throw new BizException("不存在该账户！");
    	}
    }
	//查找账户余额
	public Payment SelectBalance(Integer uid) throws BizException{
		List<Payment> list = paymentDao.selectUser(uid, 3);
		if(list.size()>0){
			Payment payment=list.get(0);
			return payment;
		}else{
			throw new BizException("不存在此账户！");
		}
	}
	//充值
	public  void  reduce(Payment payment,Double addCash) throws BizException{
    	List<Payment> list = paymentDao.selectUser(payment.getUid(),payment.getAccount());
    	
    	if(list.size()>0){
    		Double balance = list.get(0).getBalance()-addCash;
    		if(balance>0){
    			payment.setBalance(balance);
    			paymentDao.update(payment);
    			
    			//生成流水表
    			Record record = new Record();
    			record.setModtime(new Timestamp(System.currentTimeMillis()));
    			record.setUid(payment.getUid());
    			record.setAccount(payment.getAccount());
    			record.setChanges("-" + addCash);
    	    	recordDao.insert(record);
    		}else{
    			throw new BizException("余额不足！");
    		}
    	}else{
    		throw new BizException("不存在该账户！");
    	}
    }
	public  void  add(Payment payment,Double addCash) throws BizException{
    	
    	List<Payment> list = paymentDao.selectUser(payment.getUid(),3);
    	
    	if(list.size()>0){
    		Double balance = list.get(0).getBalance()+addCash;
    		payment.setBalance(balance);
    		payment.setAccount(3);
    		paymentDao.update(payment);
    		
    		//生成流水表
    		Record record = new Record();
			record.setModtime(new Timestamp(System.currentTimeMillis()));
			record.setUid(payment.getUid());
			record.setAccount(3);
			record.setChanges("+" + addCash);
	    	recordDao.insert(record);
    	}else{
    		throw new BizException("不存在该账户！");
    	}
    }
}
