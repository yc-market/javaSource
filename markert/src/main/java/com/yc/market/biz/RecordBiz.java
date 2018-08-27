package com.yc.market.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.market.bean.Record;
import com.yc.market.dao.RecordDao;

@Service
public class RecordBiz {

	@Autowired
	private RecordDao recordDao;
	
	public List<Record> SelectRecord(Integer uid) throws BizException{
		List<Record> list = recordDao.selectRecord(uid);
			if(list.isEmpty()){
				return null;
			}else{
				return list;
			}
		}
	
}
