package com.yc.market.web.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.market.bean.Goods;
import com.yc.market.bean.Type;
import com.yc.market.biz.TypeBiz;

@Controller
public class TypeAction {
	@Resource
	private TypeBiz typebiz;
	
	@ResponseBody
	@RequestMapping("getNextClassfy.do")
	public List<Type> getJson(HttpServletRequest request,Type type){
		String parentid = request.getParameter("parentid");
        System.out.println(parentid);
		List<Type> nextType = typebiz.selectType2(Integer.valueOf(parentid));
		//System.out.println("===================================="+nextType);
		/*String nextTypeName;
		for(int i= 0;i<nextType.size();i++){
			nextTypeName = nextType.get(i).getTypename();
		}*/
		return nextType;
		
	}
	
	@ResponseBody
	@RequestMapping("getLastClassfy.do")
	public List<Type> getJson2(HttpServletRequest request,Type type){
		int typeid1 = Integer.valueOf(request.getParameter("firstid"));
		String secondid = request.getParameter("secondid");
		int typeid2;
		if(secondid.equals("undefined")){
			secondid="11";
		}
		typeid2 = Integer.valueOf(secondid);
		//System.out.println("========================="+request.getParameter("secondid"));
		List<Type> lastType = typebiz.selectType3(typeid1, typeid2);
		System.out.println("===================================="+lastType);
		return lastType;
	}
	
	
}
