package com.yc.market.web.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.market.bean.Goods;
import com.yc.market.bean.Image;
import com.yc.market.biz.GoodsBiz;
import com.yc.market.biz.ImageBiz;
import com.yc.market.biz.TypeBiz;

@Controller
public class IndexAction {
	@Resource
	private GoodsBiz gbiz;
	@Resource
	private ImageBiz ibiz;
	@Resource
	private TypeBiz typebiz;
	
	@RequestMapping(path={"/","/indexAction.do",""})
    public String index(HttpSession session,Model model){
		List<Goods> goods = gbiz.selectgood();	
		Map<String,Map<String,List>> map = typebiz.getCategoryAndType();		
		//model.addAttribute("map", map);
		session.setAttribute("map", map);
		model.addAttribute("goods", goods);
    	return "Index";
    }
}
