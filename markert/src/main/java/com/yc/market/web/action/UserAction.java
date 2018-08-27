package com.yc.market.web.action;

import java.io.IOException;
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

import com.yc.market.bean.BuyCar;
import com.yc.market.bean.Goods;
import com.yc.market.bean.Payment;
import com.yc.market.bean.Store;
import com.yc.market.bean.User;
import com.yc.market.biz.BizException;
import com.yc.market.biz.BuyCarBiz;
import com.yc.market.biz.GoodsBiz;
import com.yc.market.biz.PaymentBiz;
import com.yc.market.biz.StoreBiz;
import com.yc.market.biz.UserBiz;
import com.yc.market.util.VerifyCodeUtils;



@Controller
public class UserAction {
	@Resource
	private UserBiz ubiz;
	@Resource
	private StoreBiz sbiz;
	@Resource
	private GoodsBiz gbiz;
	
	@Resource
	private BuyCarBiz bbiz;
	
	@Resource
	private PaymentBiz pbiz;
	
	private Model model;
	@Resource
	private HttpSession session;
	
	@RequestMapping("user.do")
	public String DoGet(String op,Model model,User user,String upass1,String vcode,HttpServletRequest request,Store store){
		String JspName=null;
		this.model=model;
		this.session=getSession();
		String a=op.split(",")[0];
		if("login".equals(a)){
			JspName=login(user, session, model);
		}else if("reg".equals(a)){
			JspName=register(user, session, model,vcode,upass1,request);
		}else if("logout".equals(a)){
			JspName=logout();
		}else if("business".equals(a)){
			JspName=business(user, session,store,model);
		}
		System.out.println(JspName);
		return JspName;
	}
	
	public String business(User user, HttpSession session, Store store,Model model) {
		// TODO Auto-generated method stub
		user = (User) session.getAttribute("loginedUser");
    	//根据uid查商店，为空则还未建立商店
    	if(ubiz.selectStoreByUid(user.getUid())==null){
    		//跳转到建立商店的界面
    		return "AddStore";
    	}else{  
    		store = sbiz.selectStoreByUid(user.getUid());
    		//session.setAttribute("store", store);
    		
    		model.addAttribute("store", store);
    		System.out.println("===================="+store.getStoreid());
    		return "Store";
    	}
	}

	@RequestMapping("vc.do")
	public void ajax1(HttpServletResponse response,HttpServletRequest request) throws IOException{
		request.setCharacterEncoding("utf-8");
		int w = 200, h = 80;
		// 闅忔満鐢熸垚楠岃瘉鐮�
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		// 灏嗛獙璇佺爜娣诲姞鍒颁細璇濅腑锛屾敞鎰忥細鍦ㄤ細璇濅腑淇濆瓨鐨勯獙璇佺爜鐨勫悕绉� vscode
		request.getSession().setAttribute("vcode", verifyCode);
		// 鍥惧舰鍐欑粰娴忚鍣�  
		response.setContentType("image/jpeg");
		// 鍙戝ご鎺у埗娴忚鍣ㄤ笉瑕佺紦瀛�  
		response.setDateHeader("expries", -1);
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		// 杈撳嚭鍥剧墖
		VerifyCodeUtils.outputImage(w, h, response.getOutputStream(),
				verifyCode);
	}
	
	
    //注册
	public String register(User user,HttpSession session,Model model,String vcode,String upass,HttpServletRequest request) {
		String vcode1=(String)request.getSession().getAttribute("vcode");
		//BeanUtils.toBean(request, user);
		if(user.getIdentity()==null){
			user.setIdentity(0);
		}
		if(vcode.equals(vcode1)==false){
			model.addAttribute("msg","验证码错误!");
		}else{
			if(upass.equals(user.getUpass())){
				try {
					ubiz.register(user);
					Payment payment = new Payment();
					payment.setUid(user.getUid());
					payment.setAccount(3);
					payment.setBalance(0.0);
					pbiz.insert(payment);
					request.setAttribute("ok", "ok");
				} catch (BizException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					model.addAttribute("msg",e.getMessage());
				}
			}else{
				model.addAttribute("msg","两次密码不一致!");
			}
		}
		return "Regist";
    }
    //登录
    public String login(User user,HttpSession session,Model model){
		try {
			user=ubiz.login(user.getUname(),user.getUpass() );
			List<BuyCar> buyCarList = bbiz.selectBuyCar(user.getUid());
			session.setAttribute("buyCarList", buyCarList);
			if(user!=null){
				session.setAttribute("loginedUser", user);
				double c=0;
				for(int i=0;i<buyCarList.size();i++){
					int a=(int) buyCarList.get(i).getCount();
					double b=(double) buyCarList.get(i).getGoods().getPrice();
					c=c+a*b;
					
				}
				session.setAttribute("totalMoney", c);
				
				//判断用户 身份，为0普通用户,1为商家
				if(user.getIdentity()==0){
					List<Goods> goods = gbiz.selectgood();
					model.addAttribute("goods", goods);
					return "Index";
				}else{
					//
					return "redirect:/user.do?op=business";
					
				}
			
			}
		} catch (BizException e) {
			model.addAttribute("msg",e.getMessage());
			return "Login";
		}
		return "Login";
    	
    }
    
    /**
     * 修改时间：8.18
     * 商家登录时，判断商家是否建立了店铺
     * @return
     */
    /*public String business(Store store,User user,HttpSession session){
    	user = (User) session.getAttribute("loginedUser");
    	//根据uid查商店，为空则还未建立商店
    	if(ubiz.selectStoreByUid(user.getUid())==null){
    		//跳转到建立商店的界面
    		return "AddStore";
    	}else{  
    		store = sbiz.selectStoreByUid(user.getUid());
    		session.setAttribute("store", store);
    		
    		model.addAttribute("store", store);
    		System.out.println("===================="+store.getStoreid());
    		return "Store";
    	}
		
	}*/
    
	//退出
	private String logout(){
		session.setAttribute("loginedUser", null);
		model.addAttribute("msg", "已退出，感谢您的使用！");
		return "Login";
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
