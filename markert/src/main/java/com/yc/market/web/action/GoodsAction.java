package com.yc.market.web.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yc.market.bean.Favorite;
import com.yc.market.bean.Goods;
import com.yc.market.bean.Image;
import com.yc.market.bean.Size;
import com.yc.market.bean.Store;
import com.yc.market.bean.User;
import com.yc.market.biz.FavoriteBiz;
import com.yc.market.biz.GoodsBiz;
import com.yc.market.biz.ImageBiz;
import com.yc.market.biz.SizeBiz;
import com.yc.market.util.ServletUtils;

@Controller
public class GoodsAction {
	
	@Resource
	private GoodsBiz gbiz;
	@Resource
	private SizeBiz sizeBiz;
	@Resource
	private FavoriteBiz fbiz;
	@Resource
	private ImageBiz ibiz;
	
	
	private Model model;
	
	private HttpSession session;
	
	/*@RequestMapping("/goodsAdd.do")
	public String insert(Model model,Goods g){
		gb.insert(g);
		model.addAttribute("msg", "添加商品成功");
		return "StoreDetails";
	}*/
	@RequestMapping("goods.do")
		public String goodsAction(String op,Model model,HttpSession session, HttpServletRequest request,Goods goods){
			String JspName=null;
			this.model = model;
			this.session = getSession();
			String a=op.split(",")[0];
			if("goodsAdd".equals(a)){
				JspName = goodsAdd(model, goods, request);
			}else if("addSize".equals(a)){
				JspName = addSize(model,goods);
			}
			return JspName;
		}
	
	private String addSize(Model model2, Goods goods) {
		// TODO Auto-generated method stub
		return null;
	}

	//@RequestMapping("goodsAdd.do")
	public String goodsAdd(Model model,Goods g,HttpServletRequest request){
        g.setStoreid(ServletUtils.getParameter(request, java.lang.Integer.class, "storeid"));
        System.out.println("================="+g.getStoreid());
        gbiz.insert(g);
		model.addAttribute("msg", "添加商品成功");
		return "redirect:/store.do?op=showStore";
	}
	
	@RequestMapping("/Product.do")
	public String selectById(Model model,Goods g,HttpSession session){
		//int gid = Integer.parseInt(request.getParameter("gid"));
		User u;
		Goods detail = gbiz.selectById(g.getGid());
		List<Size> size = sizeBiz.selectByGid(g.getGid());
		List<Image> image = ibiz.selectByGid(g.getGid());
		Image i = image.get(0);
		//model.addAttribute("detail", detail);
		session.setAttribute("detail", detail);
		model.addAttribute("size", size);
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
		List<Size> size = sizeBiz.selectByGid(g.getGid());
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
