package com.yc.market.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.market.bean.Address;

import com.yc.market.dao.AddressDao;

@Service
public class AddressBiz {

	@Autowired
	private AddressDao aDao;
	public List<Address> SelectAddress(Integer uid) {
		
		List<Address> list = aDao.selectAddress(uid);
		if(list.isEmpty()){
			return null;
		}else{
			return list;
		}
	}
	public void update(Address address) {
		aDao.update(address);
		
	
	}
	public void delete(Address address) {
		aDao.delete(address);
		
	}
	public void add(Address address) {
		
		aDao.add(address);
		
	}
	public Address SelectAddressByAddrId(Integer addrid) {
		Address address= aDao.selectAddressByAddrId(addrid);
		return address;
	}
     
}
