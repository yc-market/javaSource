package com.yc.market.web.action;


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

import com.google.gson.Gson;
import com.yc.market.bean.Address;

import com.yc.market.bean.User;
import com.yc.market.biz.AddressBiz;

import com.yc.market.util.ServletUtils;

@Controller
public class AddressAction {
    @Resource
	private  AddressBiz aBiz;
    private HttpSession session;
	@RequestMapping("address.do")
	public String DoGet(String op,Model model,Address address,HttpServletRequest request, HttpServletResponse response){
		String JspName=null;
		this.session=getSession();
		String a=op.split(",")[0];
		if("SelectAddress".equals(a)){
			JspName=SelectAddress(address, session, model);
		}else if("add".equals(a)){
			JspName=AddAddress(address, request, session, model);
		}else if("delete".equals(a)){
			JspName=DeleteAddress(address, session, model);
		}else if("update".equals(a)){
			JspName=UpdateAddress(address, request, session, model);
		}else if("SelectAddressByAddrId".equals(a)){
			JspName=SelectAddressByAddrId(address,  session, model, request, response);
		}
		System.out.println(JspName);
		return JspName;
	}
	//地址详情查询
	private String SelectAddressByAddrId(Address address, HttpSession session2,
			Model model, HttpServletRequest request,  HttpServletResponse response) {

		
		try {
			Address list1 =  aBiz.SelectAddressByAddrId(address.getAddrid());
			model.addAttribute("list1", list1);
		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Member_Address_Orgnized";
	}
	@RequestMapping("/ajaxAddress.do")
	private void ajaxAddressByAddrId(Address address, HttpSession session2,
			Model model, HttpServletRequest request,  HttpServletResponse response) {

		
		try {
			Address list1 =  aBiz.SelectAddressByAddrId(address.getAddrid());
			model.addAttribute("list1", list1);
			System.out.println(list1.toString());
			Gson gson=new Gson();
			String gson1=gson.toJson(list1);
			System.out.println(gson1);
			response.getWriter().print(gson1);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	//更新地址
	
	private String UpdateAddress(Address address,HttpServletRequest request, HttpSession session2, Model model) {
		Timestamp now=new Timestamp(System.currentTimeMillis());
		address.setPostdate(now);
		String area = ServletUtils.getParameter(request, java.lang.String.class, "cmbProvince")+
				ServletUtils.getParameter(request, java.lang.String.class, "cmbCity")+
				ServletUtils.getParameter(request, java.lang.String.class, "cmbArea")+
				ServletUtils.getParameter(request, java.lang.String.class, "area");
		address.setArea(area);
		int addrid=ServletUtils.getParameter(request, java.lang.Integer.class, "addrid");
		try{
		aBiz.update(address);
		model.addAttribute("msg","修改成功" );
		return "redirect:address.do?op=SelectAddressByAddrId&addrid="+addrid;
		}catch(Exception e){
			model.addAttribute("error","修改失败" );
		}
		return "redirect:address.do?op=SelectAddressByAddrId&addrid="+addrid;
	}

    //删除地址 
	private String DeleteAddress(Address address, HttpSession session2, Model model) {
		
		try{
		aBiz.delete(address);
		model.addAttribute("msg","删除成功" );
		return "redirect:address.do?op=SelectAddress";
		}catch(Exception e){
			model.addAttribute("error","删除失败" );
		}
		return "redirect:address.do?op=SelectAddress";
	}

    //添加地址
	private String AddAddress(Address address,HttpServletRequest request, HttpSession session2, Model model) {
		
		String area = ServletUtils.getParameter(request, java.lang.String.class, "cmbProvince")+
				ServletUtils.getParameter(request, java.lang.String.class, "cmbCity")+
				ServletUtils.getParameter(request, java.lang.String.class, "cmbArea")+
				ServletUtils.getParameter(request, java.lang.String.class, "area");
		address.setArea(area);
		
		System.out.println(area);
		Timestamp now=new Timestamp(System.currentTimeMillis());
		address.setPostdate(now);
		
		User user=(User) session2.getAttribute("loginedUser");
		address.setUid(user.getUid());
		try{
		aBiz.add(address);
		session.setAttribute("address", address);
		model.addAttribute("msg1","msg" );
		return "redirect:address.do?op=SelectAddress";
		}catch(Exception e){
			model.addAttribute("error1","添加失败" );
		}
		return "redirect:address.do?op=SelectAddress";
	}

    //根据用户Id来查询地址
	private String SelectAddress(Address address, HttpSession session2, Model model) {
		
		User user=(User) session2.getAttribute("loginedUser");
		address.setUid(user.getUid());
				try {
					List<Address> list = aBiz.SelectAddress(address.getUid());
					model.addAttribute("list", list);
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "Member_Address";
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
