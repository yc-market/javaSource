package com.yc.market.web.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yc.market.bean.Address;
import com.yc.market.bean.BuyCar;
import com.yc.market.bean.Detail;
import com.yc.market.bean.Order;
import com.yc.market.bean.User;
import com.yc.market.biz.BizException;
import com.yc.market.biz.BuyCarBiz;
import com.yc.market.biz.DetailBiz;
import com.yc.market.biz.OrderBiz;
import com.yc.market.util.ServletUtils;

@Controller
public class OrderAction {
	@Resource
	private OrderBiz obiz;
	@Resource
	private BuyCarBiz bbiz;
	@Resource
	private DetailBiz dbiz;
	private HttpSession session;
	@RequestMapping("order.do")
	public String DoGet(String op,Model model,Order order,HttpServletRequest request){
		String JspName=null;
		this.session=getSession();
		String a=op.split(",")[0];
		if("SelectOrder".equals(a)){
			JspName=SelectOrder(order, session, model);
		}else if("addOrder".equals(a)){
			JspName=addOrder(order,session,model, request);
		}
		return JspName;
	}
	private String addOrder(Order order, HttpSession session, Model model, HttpServletRequest request) {
		User user = (User) session.getAttribute("loginedUser");
		String address=ServletUtils.getParameter(request, java.lang.String.class, "area"); 
		String receiver=ServletUtils.getParameter(request, java.lang.String.class, "receiver");
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		Double totalMoney = (Double) session.getAttribute("totalMoney");
	    order.setBuymoney(totalMoney+15);
		order.setUid(user.getUid());
		order.setBuydate(ts);
		order.setAddress(address);
		order.setEnter(0);
		order.setPay(0);
		order.setDeliver(0);
		order.setReceiver(receiver);
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tsStr = sdf.format(ts); 
        tsStr = tsStr.replaceAll("/", "").replaceAll(":", "").replaceAll(" ", "");
        order.setOrderid(tsStr);
        try {
			obiz.addOrder(order);
			model.addAttribute("order", order);
			Detail detail = new Detail();
			detail.setUid(user.getUid());
			detail.setOrderid(tsStr);
			List<BuyCar> list = bbiz.ViewShoppingCar(user.getUid());
			for(int i = 0;i<list.size();i++){
				detail.setGid(list.get(i).getGid());
				detail.setCount(list.get(i).getCount());
				dbiz.addDetail(detail);
				bbiz.delete(list.get(i).getGid());
			}
			return "BuyCar_Three";
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg","添加失败");
			return "BuyCar_Two";
		}
	}


	private String SelectOrder(Order order, HttpSession session, Model model) {
		// TODO Auto-generated method stub
		try {
			User user = (User) session.getAttribute("loginedUser");
			List<Order> list = obiz.order(user.getUid());
			model.addAttribute("list", list);
		} catch (BizException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Member_Order";
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
