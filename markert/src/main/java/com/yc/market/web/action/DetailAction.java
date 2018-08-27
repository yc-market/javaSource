package com.yc.market.web.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.market.bean.Detail;
import com.yc.market.biz.BizException;
import com.yc.market.biz.DetailBiz;

@Controller
public class DetailAction {
	@Resource
	private DetailBiz dbiz;
	
	@RequestMapping("SelectDetail.do")
	public String selectDetail(Model model,Detail detail){
		System.out.println("=========================================");
		try {
			List<Detail> list = dbiz.SelectDetail(detail.getOrderid());
			model.addAttribute("list",list);
			return "Member_Order_Detail";
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "商品不存在");
			return "Member_Order";
		}
	}
}
