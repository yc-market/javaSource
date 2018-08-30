package com.yc.market.biz;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.market.bean.Type;
import com.yc.market.dao.TypeDao;

@Service
public class TypeBiz {
	
	@Resource
	private TypeDao typeDao;
	
	//查询一级目录
	public List<Type> selectType1(){
		
		return typeDao.selectType1();
	}	
	//查询二级目录
	public List<Type> selectType2(int typeid){
		return typeDao.selectType2(typeid);
	}
	
	public List<Type> selectType3(int typeid1,int typeid2){
		return typeDao.selectType3(typeid1, typeid2);
	}
	
	public Type selectType(int typeid){
		return typeDao.selectType(typeid);
	}
	
	public Map<String,Map<String,List>> getCategoryAndType(){
		Map<String,Map<String,List>> map = new HashMap<String,Map<String,List>>();
		//查询一级目录 firstList
		List<Type> firstList = selectType1();
		for(Type list:firstList){
			//一级目录id  typeid
			//int typeid = list.getTypeid();
			//String type = list.getTypename();
			//查询二级目录 secondList
			List<Type> secondList = selectType2(list.getTypeid());
			Map<String,List> map1 = new LinkedHashMap<String,List>();
			for(Type list2:secondList){
				//二级目录
				//String type2 = list2.getTypename();
				//二级目录id
				//int typeid2 = list2.getTypeid();
				//三级目录
				List<Type> thirdList = selectType3(list.getTypeid(), list2.getTypeid());
				map1.put(list2.getTypename(), thirdList);
			}
			map.put(list.getTypename(), map1);
		}
		return map;
	}
	
	
}
