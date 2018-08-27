package com.yc.market.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.market.bean.Size;
import com.yc.market.dao.SizeDao;

@Service
public class SizeBiz {
	
	@Resource
	private SizeDao sizeDao;
	
	public List<Size> selectByGid(int gid){
		return sizeDao.selectByGid(gid);
	}
}
