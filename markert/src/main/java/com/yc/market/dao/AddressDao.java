package com.yc.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.market.bean.Address;
@Repository
public interface AddressDao extends BaseDao<Address> {

	@Select("SELECT * from addr where uid= #{uid}")
	List<Address> selectAddress(Integer uid);
    @Update("update addr set area=#{area},receiver=#{receiver},phone=#{phone},building=#{building},email=#{email},emailid=#{emailid},tel=#{tel},postdate=#{postdate} where addrid=#{addrid}")
	void update(Address t);
    @Insert("insert into addr(area,receiver,phone,building,email,emailid,tel,postdate,uid) values (#{area},#{receiver},#{phone},#{building},#{email},#{emailid},#{tel},#{postdate},#{uid})")
    @Options(useGeneratedKeys=true,keyColumn="addrid",keyProperty="addrid")
    void add(Address t);
    @Delete("delete from addr where addrid=#{addrid}")
    void delete(Address t);
    @Select("SELECT * from addr where addrid= #{addrid}")
	Address selectAddressByAddrId(Integer addrid);
	
    
}
