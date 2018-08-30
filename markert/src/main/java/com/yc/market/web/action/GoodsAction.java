package com.yc.market.web.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yc.market.bean.Favorite;
import com.yc.market.bean.Goods;
import com.yc.market.bean.Image;
import com.google.gson.Gson;
import com.yc.market.bean.Address;
import com.yc.market.bean.Attribute;
import com.yc.market.bean.Store;
import com.yc.market.bean.Type;
import com.yc.market.bean.User;
import com.yc.market.biz.BizException;
import com.yc.market.biz.FavoriteBiz;
import com.yc.market.biz.GoodsBiz;
import com.yc.market.biz.ImageBiz;
import com.yc.market.biz.AttributeBiz;
import com.yc.market.biz.StoreBiz;
import com.yc.market.biz.TypeBiz;
import com.yc.market.util.ServletUtils;

@Controller
public class GoodsAction {
	
	@Resource
	private GoodsBiz gbiz;
	@Resource
	private AttributeBiz attributeBiz;
	@Resource
	private FavoriteBiz fbiz;
	@Resource
	private ImageBiz ibiz;
	@Resource
	private StoreBiz sbiz;
	@Resource
	private TypeBiz tbiz;
	
	private Model model;
	
	private HttpSession session;
	
	/*@RequestMapping("/goodsAdd.do")
	public String insert(Model model,Goods g){
		gb.insert(g);
		model.addAttribute("msg", "添加商品成功");
		return "StoreDetails";
	}*/
	@RequestMapping("goods.do")
		public String goodsAction(String op,Model model,HttpSession session, HttpServletRequest request,Goods goods,Attribute attribute){
			String JspName=null;
			this.model = model;
			this.session = getSession();
			String a=op.split(",")[0];
			if("goodsAdd".equals(a)){
				JspName = goodsAdd(model, goods, request);
			}else if("addSize".equals(a)){
				JspName = addSize(model,attribute, request);
			}else if("downGoods".equals(a)){//下架商品
				JspName = downGoods(model,goods, request);
			}else if("showDetail".equals(a)){//后台商品详情
				JspName = showDetail(model,goods,request);
			}else if("selectByName".equals(a)){
				JspName = selectByName(model,goods);
			}else if("selectByThird".equals(a)){
				JspName = selectByThird(model,goods,request);
			}
			return JspName;
		}
	
	private String selectByThird(Model model, Goods goods, HttpServletRequest request) {
		
			/*int typeid = Integer.valueOf(request.getParameter("typeid"));						
			Type third = tbiz.selectType(typeid);
			model.addAttribute("third", third);
			int thirdparent= third.getParentid();
			Type second = tbiz.selectType(thirdparent);
			model.addAttribute("second", second);
			Type first = tbiz.selectType(second.getParentid());
			model.addAttribute("first", first);
			List<Goods> goodsByThird = gbiz.selectByType(typeid);
			model.addAttribute("third", goodsByThird);
			return "TypeList";	*/
		return null;
	}

	private String selectByName(Model model, Goods goods) {
		goods.setGname("%"+goods.getGname()+"%");
		List<Goods> list=gbiz.selectByName(goods.getGname());
		model.addAttribute("list", list);
		return "CategoryList";
	}

	private String showDetail(Model model, Goods goods, HttpServletRequest request) {
		Goods detail = gbiz.selectById(goods.getGid());
		User u = (User)request.getSession().getAttribute("loginedUser");
		Store store = sbiz.selectStoreByUid(u.getUid());
		
		List<Attribute> attribute = attributeBiz.selectByGid(goods.getGid());
		List<Image> image = ibiz.selectByGid(goods.getGid());
		Image i = image.get(0);
		model.addAttribute("detail", detail);
		model.addAttribute("attribute", attribute);
		model.addAttribute("image", image);
		model.addAttribute("i", i);
		model.addAttribute("store", store);
		return "Product1";
	}

	private String downGoods(Model model, Goods goods, HttpServletRequest request) {
		Integer gid = ServletUtils.getParameter(request, Integer.class, "gid");
		goods = gbiz.selectById(gid);
		goods.setIsDown(1);
		try {
			gbiz.update(goods);
			model.addAttribute("msg","成功下架该商品");
		} catch (BizException e) {
			e.printStackTrace();
			model.addAttribute("msg",e.getMessage());
		}
		return "redirect:/store.do?op=showStore";
	}

	private String addSize(Model model, Attribute attribute, HttpServletRequest request) {
		
		/*size.setSize(ServletUtils.getParameter(request, java.lang.String.class, "size"));
		size.setPrice(ServletUtils.getParameter(request, java.lang.Double.class, "price"));*/
		attribute.setGid(ServletUtils.getParameter(request, java.lang.Integer.class, "gid"));
		attributeBiz.addSize(attribute);
		return "EditGoods";
	}

	//@RequestMapping("goodsAdd.do")
	public String goodsAdd(Model model,Goods g,HttpServletRequest request){
		String first = request.getParameter("first");
		String second = request.getParameter("second");
		String third = request.getParameter("third");
		String type = first+"_"+second+"_"+third;
		g.setType(type);
        g.setStoreid(ServletUtils.getParameter(request, java.lang.Integer.class, "storeid"));
        System.out.println("================="+g.getStoreid());
        gbiz.insert(g);
		model.addAttribute("msg", "添加商品成功");
		return "redirect:/store.do?op=showStore";
	}
	@RequestMapping("/ajaxPrice.do")
	public void ajaxPrice(Attribute attribute,Model model,HttpSession session,HttpServletRequest request,  HttpServletResponse response){
		try {
			//int gid=ServletUtils.getParameter(request, java.lang.Integer.class, "gid");
			//attribute.setGid(gid);
			Attribute attribute1 =  attributeBiz.SelectPriceBySize(attribute.getSizeid());
			System.out.println(attribute1.toString());
			
			
			Gson gson=new Gson();
			String gson1=gson.toJson(attribute1);
			System.out.println(gson1);
			response.getWriter().print(gson1);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/Product.do")
	public String selectById(Model model,Goods g,HttpSession session){
		//int gid = Integer.parseInt(request.getParameter("gid"));
		User u;
		Goods detail = gbiz.selectById(g.getGid());
		List<Attribute> attribute = attributeBiz.selectByGid(g.getGid());
		List<Image> image = ibiz.selectByGid(g.getGid());
		Image i = image.get(0);
		//model.addAttribute("detail", detail);
		session.setAttribute("detail", detail);
		model.addAttribute("attribute", attribute);
		//model.addAttribute("image", image);
		session.setAttribute("image", image);
		session.setAttribute("i", i);
		try {
			u = (User) session.getAttribute("loginedUser");
			List<Favorite> list = fbiz.selectByGid(u.getUid(), g.getGid());			
			if(list.size()>0){	
				model.addAttribute("success", "success");
			}			
				return "Product";
		} catch (Exception e) {			
			e.printStackTrace();
			return "Product";
		}
		
			
	}

	
	/*@RequestMapping("/Product1.do")
	public String selectById1(Model model,Goods g){
		//int gid = Integer.parseInt(request.getParameter("gid"));
		Goods detail = gb.selectById(g.getGid());
		List<Attribute> size = sizeBiz.selectByGid(g.getGid());
		model.addAttribute("detail", detail);
		model.addAttribute("size", size);
		return "Product1";	
	}*/
	public static HttpServletRequest getRequest() { 
        ServletRequestAttributes attrs =(ServletRequestAttributes) RequestContextHolder.getRequestAttributes(); 
        return attrs.getRequest(); 
  }
	
	private HttpSession getSession() {
		HttpSession session = null; 
        try { 
             session = getRequest().getSession(); 
         } catch (Exception e) {} 
           return session; 
	}
}
