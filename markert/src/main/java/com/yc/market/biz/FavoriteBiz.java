package com.yc.market.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.market.bean.Favorite;
import com.yc.market.dao.FavoriteDao;

@Service
public class FavoriteBiz {
	@Autowired
	private FavoriteDao favoriteDao;
	
	public List<Favorite> selectFavorite(Integer uid){
		List<Favorite> list = favoriteDao.selectFavorite(uid);
		if(list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	
	public void addFavorite(Favorite favorite) throws BizException {
		List<Favorite> list = favoriteDao.selectByGid(favorite.getUid(),favorite.getGid());
		if(list.size()>0){
			throw new BizException("该商品已关注");
		}else{
			favoriteDao.insert(favorite);
		}
	}
	public void deleteFavorite(Favorite favorite) throws BizException {
		List<Favorite> list = favoriteDao.selectByGid(favorite.getUid(),favorite.getGid());
		if(list.size()>0){
			favoriteDao.delete(favorite);
		}else{
			throw new BizException("不存在该商品");
		}
	}
	
	public List<Favorite> selectByGid(Integer uid,Integer gid){
		return favoriteDao.selectByGid(uid, gid);
	}
}
