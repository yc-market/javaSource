package com.yc.market.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.market.bean.Attribute;
import com.yc.market.dao.AttributeDao;

@Service
public class AttributeBiz {
	
	@Resource
	private AttributeDao sizeDao;
	
	public List<Attribute> selectByGid(int gid){
		return sizeDao.selectByGid(gid);
	}

	public Attribute SelectPriceBySize(Integer sizeid) {
		return sizeDao.SelectPriceBySize(sizeid);
	}

	public void addSize(Attribute attribute) {
		sizeDao.addSize(attribute);
		
	}
}
