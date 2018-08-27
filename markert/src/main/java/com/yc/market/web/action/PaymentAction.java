package com.yc.market.web.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yc.market.bean.Payment;
import com.yc.market.bean.Record;
import com.yc.market.bean.User;
import com.yc.market.biz.BizException;
import com.yc.market.biz.OrderBiz;
import com.yc.market.biz.PaymentBiz;
import com.yc.market.biz.RecordBiz;

@Controller
public class PaymentAction {
	@Resource
	private PaymentBiz pbiz;
	@Resource
	private OrderBiz obiz;
	@Resource
	private RecordBiz rbiz;
	@Resource
	private HttpSession session;
	
	@RequestMapping("payment.do")
	public String DoGet(String op,Model model,Payment payment,HttpServletRequest request,Double buymoney,String gid,Double addCash) throws IOException, BizException{
		request.setCharacterEncoding("UTF-8");
		String JspName=null;
		this.session=getSession();
		String a=op.split(",")[0];
		if("Payment".equals(a)){
			JspName=Payment(payment, session, model,request,buymoney,gid);
		}else if("SelectBalance".equals(a)){
			JspName=SelectBalance(payment,session,model);
		}else if("addCash".equals(a)){
			JspName=addCash(payment,session,model,addCash);
		}else if("addType".equals(a)){
			JspName=addType(payment,session,model,addCash);
		}
		return JspName;
	}
	//添加账户类型
	private String addType(Payment payment, HttpSession session2, Model model, Double addCash) throws BizException {
		// TODO Auto-generated method stub
		User user = (User) session.getAttribute("loginedUser");
		int uid = user.getUid();
		payment.setUid(user.getUid());
		payment.setBalance(5000.0);
		try {
			
			pbiz.insert(payment);
			model.addAttribute("msg","绑定成功");
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg",e.getMessage());
			pbiz.SelectBalance(uid);
			return "Member_User";
		}
		return "Member_User";
	}
	//充值
	private String addCash(Payment payment, HttpSession session, Model model, Double addCash) {
		User user = (User) session.getAttribute("loginedUser");
		payment.setUid(user.getUid());
		try {
			pbiz.reduce(payment, addCash);
			pbiz.add(payment, addCash);
			
			List<Record> list = rbiz.SelectRecord(user.getUid());
			model.addAttribute("list",list);
			model.addAttribute("msg","充值成功");
			return "Member_Money";
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg",e.getMessage());
		}
		return "Member_Money_Charge";
	}
	//查找账户余额
	private String SelectBalance(Payment payment, HttpSession session, Model model) {
		// TODO Auto-generated method stub
		User user = (User) session.getAttribute("loginedUser");
		try {
			payment = pbiz.SelectBalance(user.getUid());
			
			List<Record> list = rbiz.SelectRecord(user.getUid());
			model.addAttribute("list",list);
			model.addAttribute("payment", payment);
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg",e.getMessage());
		}
		return "Member_Money";
	}

	//付款
	private String Payment(Payment payment, HttpSession session, Model model,HttpServletRequest request, Double buymoney,String gid) {
		// TODO Auto-generated method stub
		User user = (User) session.getAttribute("loginedUser");
		payment.setUid(user.getUid());
		try {
			pbiz.payment(payment, buymoney);
			obiz.update(gid);
			model.addAttribute("msg","购买成功");
			return "Member";
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg",e.getMessage());
		}
		return "Member_Money_Pay";
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
