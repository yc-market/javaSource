package com.yc.market.web.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.market.bean.Favorite;
import com.yc.market.bean.User;
import com.yc.market.biz.BizException;
import com.yc.market.biz.FavoriteBiz;

@Controller
public class FavoriteAction {
	@Resource
	FavoriteBiz fbiz;
	
	@RequestMapping("Favorite.do")
	public String SelectFavorite(Model model,HttpSession session){
		User user = (User) session.getAttribute("loginedUser");
		List<Favorite> list = fbiz.selectFavorite(user.getUid());
		model.addAttribute("list", list);
		return "Member_Collect";
	}
	/*@RequestMapping("addFavorite.do")
	public String addFavorite(Model model,Favorite favorite,HttpSession session){
		User user = (User) session.getAttribute("loginedUser");
		favorite.setUid(user.getUid());
		try {
			fbiz.addFavorite(favorite);
			return "redirect:/Product.do?gid="+ favorite.getGid() ;
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "收藏失败");
			return "Product";
		}
	}
	@RequestMapping("deleteFavorite.do")
	public String deleteFavorite(Model model,Favorite favorite,HttpSession session){
		User user = (User) session.getAttribute("loginedUser");
		favorite.setUid(user.getUid());
		try {
			fbiz.deleteFavorite(favorite);
			return "redirect:/Product.do?gid="+ favorite.getGid() ;
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "取消失败");
			return "Product";
		}
	}*/
	@ResponseBody
	@RequestMapping("addFavorite.do")
	public Boolean getJson1(HttpServletRequest request,Favorite favorite,HttpSession session){
		User user = (User) session.getAttribute("loginedUser");
		favorite.setUid(user.getUid());
		try {
			fbiz.addFavorite(favorite);
			return true;
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	
	@ResponseBody
	@RequestMapping("deleteFavorite.do")
	public Boolean getJson2(HttpServletRequest request,Favorite favorite,HttpSession session){
		User user = (User) session.getAttribute("loginedUser");
		favorite.setUid(user.getUid());
		try {
			fbiz.deleteFavorite(favorite);
			return true;
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
