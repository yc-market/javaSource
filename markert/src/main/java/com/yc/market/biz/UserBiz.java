package com.yc.market.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.market.bean.Store;
import com.yc.market.bean.User;
import com.yc.market.dao.UserDao;

@Service
public class UserBiz {

	@Autowired
	private UserDao userDao;

	public void register(User user) throws BizException {

		List<User> list = userDao.selectUser(user.getUname());

		if (list.size() > 0) {
			throw new BizException("该用户名已被注册，请登录或重新输入用户名");
		} else {
			userDao.insert(user);
		}
	}

	public User login(String uname, String upass) throws BizException {
		User user = userDao.selectUserByName(uname);
		if (user==null) {
			throw new BizException("用户名输入错误");
		} else {
			
			if (upass.equals(user.getUpass())) {
				return user;
			} else {
				throw new BizException("密码输入错误");
			}
		}
	}
	
	public Store selectStoreByUid(Integer uid){
		return userDao.selectStoreByUid(uid);
	}
}
