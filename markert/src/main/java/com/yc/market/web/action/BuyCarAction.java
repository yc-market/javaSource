package com.yc.market.web.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

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

import com.yc.market.bean.Address;
import com.yc.market.bean.Attribute;
import com.yc.market.bean.BuyCar;
import com.yc.market.bean.User;
import com.yc.market.biz.AddressBiz;
import com.yc.market.biz.BuyCarBiz;
import com.yc.market.biz.AttributeBiz;
import com.yc.market.util.ServletUtils;


@Controller
public class BuyCarAction {
	@Resource
	private BuyCarBiz bcBiz;
	@Resource
	private  AddressBiz aBiz;
	@Resource
	private AttributeBiz attrBiz;
	private HttpSession session;
	@RequestMapping("buycar.do")
	public String DoGet(String op,Model model,BuyCar buyCar,HttpServletRequest request, PrintWriter out, Address address){
		String JspName=null;
		this.session=getSession();
		String a=op.split(",")[0];
		if("ViewShoppingCar".equals(a)){
			JspName=ViewShoppingCar(buyCar, session, model, request);
		}else if("ViewShoppingCar2".equals(a)){
			JspName=ViewShoppingCar2(address, buyCar, session, model, request);
		}else if("delete".equals(a)){
			JspName=Delete(buyCar, session, model);
		}else if("update".equals(a)){
			JspName=UpdateBuyCar(buyCar, session, model);
		}else if("selectAll".equals(a)){
			JspName=selectAll(buyCar, session, model,request);
		}
		System.out.println(JspName);
		return JspName;
	}
	
	
	private String UpdateBuyCar(BuyCar buyCar, HttpSession session2, Model model) {
		// TODO Auto-generated method stub
		return null;
	}


	private String Delete(BuyCar buyCar, HttpSession session2, Model model) {
		bcBiz.delete(buyCar.getGid());
		return "redirect:buycar.do?op=ViewShoppingCar";
	}

	@RequestMapping("ajax_addCart.do")
	private void addModel(HttpServletResponse response,Attribute attribute,PrintWriter out,BuyCar buyCar, HttpSession session2, Model model, HttpServletRequest request) {
		this.session=getSession();
		Timestamp now=new Timestamp(System.currentTimeMillis());
		buyCar.setBuydate(now);
		User user=(User) session.getAttribute("loginedUser");
		buyCar.setUid(user.getUid());
		 attribute =  attrBiz.SelectPriceBySize(attribute.getSizeid());
		
		System.out.println(attribute.toString());
		buyCar.setGid(attribute.getGid());
		
		buyCar.setSizeid(attribute.getSizeid());
		
		if(buyCar.getCount()==null){
			buyCar.setCount(1);
		}
		bcBiz.addModel(buyCar);
		
		
		List<BuyCar> buyCar1=bcBiz.selectByCarid(buyCar.getCarid());
		
		int count=buyCar1.get(0).getCount();
		double price= attribute.getPrice();
		String gname=buyCar1.get(0).getGoods().getGname();
		String imageName=buyCar1.get(0).getGoods().getImage().get(0).getImgname();
		//修改会话
		List<BuyCar> list2=bcBiz.selectBuyCar(user.getUid());
		session.setAttribute("car", list2);
		double c=0;
		for(int i=0;i<list2.size();i++){
			int a=(int) list2.get(i).getCount();
			double b=(double) list2.get(i).getAttribute().getPrice();
			c=c+a*b;
		}
		session.setAttribute("totalMoney", c);
		session.setAttribute("total",  list2.size());
		
		response.setContentType("text/html; charset=UTF-8");
		
		out.print("<ul class='cars' id='cars'>"+
                    "<li>"+
                      "<div class='img'><a href='#'><img src='upload/rawImages/"+imageName+"' width='58' height='58' /></a></div>"+
                        "<div class='name'><a href='#'>"+gname+"</a> </div>"+
                       "<div class='price'><font color='#ff4e00'>"+ price +"</font>"+"X"+count+"</div>"+
                    "</li>"+
                  "</ul>"
				);

	}


	private String ViewShoppingCar(BuyCar buyCar, HttpSession session2, Model model, HttpServletRequest request) {
		User user=(User) session2.getAttribute("loginedUser");
		buyCar.setUid(user.getUid());
		
		try {
			
			//List<BuyCar> list = bcBiz.ViewShoppingCar(buyCar.getUid());
			List<BuyCar> list = bcBiz.selectBuyCar(buyCar.getUid());
			System.out.println("====="+list);
			model.addAttribute("list", list);
			System.out.println("=========================================="+list.get(0).getGoods().toString());
			
			double c=0;
			for(int i=0;i<list.size();i++){
				int a=(int) list.get(i).getCount();
				double b=(double) list.get(i).getAttribute().getPrice();
				c=c+a*b;
			}
			session.setAttribute("totalMoney", c);
			session.setAttribute("total",  list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "BuyCar";
	}
	
	
	private String ViewShoppingCar2(Address address,BuyCar buyCar, HttpSession session2, Model model, HttpServletRequest request) {
		User user=(User) session2.getAttribute("loginedUser");
		buyCar.setUid(user.getUid());
		address.setUid(user.getUid());
		
		try {
			
			List<BuyCar> list1 = bcBiz.ViewShoppingCar(user.getUid());
			for(int j=0;j<list1.size();j++){
				int count = ServletUtils.getParameter(request, Integer.class, "count_"+list1.get(j).getCarid());	
				buyCar = list1.get(j);
				buyCar.setCount(count);
				bcBiz.update(buyCar);
			}
			
			//List<BuyCar> list = bcBiz.ViewShoppingCar(user.getUid());
			List<BuyCar> list = bcBiz.selectBuyCar(user.getUid());
			
			System.out.println("====="+list);
			model.addAttribute("list", list);
			List<Address> addressList = aBiz.SelectAddress(address.getUid());
			model.addAttribute("addressList", addressList);
			double c=0;
			for(int i=0;i<list.size();i++){
				int a=(int) list.get(i).getCount();
				double b=(double) list.get(i).getAttribute().getPrice();
				c=c+a*b;
			}
			int grade = 0;
			for(int i=0;i<list.size();i++){
				grade=list.get(i).getGoods().getGrade()+grade;
				
				
			}
			session.setAttribute("totalGrade", grade);
			session.setAttribute("totalMoney", c);
			session.setAttribute("total",  list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "BuyCar_Two";
	}
	
	
	//头里面的购物车查询所有
	private String selectAll(BuyCar buyCar, HttpSession session2, Model model, HttpServletRequest request) {
		
		User user=(User) session2.getAttribute("loginedUser");
		buyCar.setUid(user.getUid());
		try {
			List<BuyCar> list = bcBiz.selectBuyCar(buyCar.getUid());
			System.out.println("====="+list);
			model.addAttribute("car1", list);
			double c=0;
			for(int i=0;i<list.size();i++){
				int a=(int) list.get(i).getCount();
				double b=(double) list.get(i).getAttribute().getPrice();
				c=c+a*b;
				
			}
			session.setAttribute("totalMoney", c);
			session.setAttribute("total",  list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "Index";
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
