package com.yc.market.web.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yc.market.bean.Store;
import com.yc.market.bean.Type;
import com.yc.market.bean.User;
import com.yc.market.biz.StoreBiz;
import com.yc.market.biz.TypeBiz;

@Controller
public class StoreAction {
	@Resource
	StoreBiz sbiz;
	@Resource
	TypeBiz tbiz;
	
	private Model model;
	
	private HttpSession session;
	
	/*@RequestMapping("addStore.do")
	public String addStore1(User user,Store store,HttpServletRequest request){
		
		user = (User) request.getSession().getAttribute("loginedUser");
		store.setUid(user.getUid());
		int uid = user.getUid();
		System.out.println("==============================="+uid);
		sbiz.insert(store);
		Store m_store = sbiz.select(uid);
		return "StoreDetails";
		
	}*/
	
	@RequestMapping("/store.do")
	public String storeAction(Store store,HttpServletRequest request,HttpSession session, Model model){
		
		this.model=model;
		this.session=getSession();
		String op = request.getParameter("op");
		String ret = "";
		if("addGoods".equals(op)){
			ret = addGoods(store,request,session);
		}if("editGoods".equals(op)){
			ret = "EditGoods";
		}if("showStore".equals(op)){
			ret = showStore(model, session);
		}if("addStore".equals(op)){
			ret = addStore(store, session) ;
		}
		return ret;
		
	}
	

	private String addGoods(Store store, HttpServletRequest request, HttpSession session) {
		List<Type> first = tbiz.selectType1();
		session.setAttribute("first", first);
		return "add";
	}

//	@RequestMapping("/addStore.do")
	public String addStore(Store store,HttpSession session){
		User user = (User) session.getAttribute("loginedUser");
		store.setUid(user.getUid());
		sbiz.insert(store);
		return "redirect:/store.do?op=showStore";
	}
	//@RequestMapping("/showStore.do")
	public String showStore(Model model,HttpSession session){
		User user  = (User) session.getAttribute("loginedUser");
		Store store = sbiz.selectStoreByUid(user.getUid()) ;
		model.addAttribute("store", store); 
		return "Store";
	}
	
	public static HttpSession getSession() { 
        HttpSession session = null; 
         try { 
              session = getRequest().getSession(); 
          } catch (Exception e) {} 
            return session; 
     } 
	public static HttpServletRequest getRequest() { 
        ServletRequestAttributes attrs =(ServletRequestAttributes) RequestContextHolder.getRequestAttributes(); 
        return attrs.getRequest(); 
  }
	
	
}
