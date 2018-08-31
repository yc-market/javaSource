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
		try {
			List<Detail> list = dbiz.SelectDetail(detail.getOid());
			model.addAttribute("list",list);
			return "Member_Order_Detail";
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "商品不存在");
			return "Member_Order";
		}
	}
	@RequestMapping("selectAllDetail.do")
	public String selectAllDetail(Model model,Integer storeid){
		try {
			List<Detail> list = dbiz.selectAllDetail(storeid);
			model.addAttribute("list",list);
			return "Store_order";
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "商品不存在");
			return "Store_order";
			
		}
	}
	@RequestMapping("selectDeliverDetail.do")
	public String selectDeliverDetail(Model model,Integer storeid,Integer deliver){
		try {
			List<Detail> list = dbiz.selectDeliverDetail(storeid,deliver);
			model.addAttribute("list",list);
			return "Store_order_deliver";
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "商品不存在");
			return "Store_order_deliver";
			
		}
	}
	@RequestMapping("UpdateDeliverDetail.do")
	public String UpdateDeliverDetail(Model model,Detail detail,Integer storeid,Integer deliver){
		try {
			detail.setDeliver(1);
			dbiz.update(detail);
			model.addAttribute("msg", "发货成功");
			return "redirect:/selectAllDetail.do?storeid=" + storeid;
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "发货失败");
			return "redirect:/selectDeliverDetail.do?storeid="+ storeid+"&deliver="+ deliver;
		}
	}
}
