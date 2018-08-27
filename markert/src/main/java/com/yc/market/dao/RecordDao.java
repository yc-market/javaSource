package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Record;

@Repository
public interface RecordDao extends BaseDao<Record>{
	@Select("SELECT * from record where uid= #{uid}")
	List<Record> selectRecord(Integer uid);
	
	@Insert("insert into record (uid,modtime,account,changes) values(#{uid},#{modtime},#{account},#{changes})")
	void insert(Record t);
}
