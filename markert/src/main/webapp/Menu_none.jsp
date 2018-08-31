<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
#a #b{ 
	width:989px; height:411px; background-color:#FFF; left:210px; top:0; display:none; 
}
</style>
<!--Begin Menu Begin-->
<div class="menu_bg">
	<div class="menu">
    	<!--Begin 商品分类详情 Begin-->    
    	<div class="nav">
        	<div class="nav_t">全部商品分类</div>
            <div class="leftNav none">
                <ul>
                	<c:forEach items="${map}" var="first" varStatus="b">
                	      
                    <li>
                    	
                    	<div class="fj">
                    		
                        	<span class="n_img"><span></span><img src="images/nav${b.count}.png" /></span>                       	
                            <span class="fl">${first.key}</span>                                                        
                        </div>                                                                                                                                      
                        <div class="zj" style="top:-${40*(b.count-1)}px;">
                            <div class="zj_l"> 
                            		<c:forEach items="${first.value}" var="second">          	
	                                <div class="zj_l_c">
	                                
	                                    <h2>${second.key}</h2>
	                                    <c:forEach items="${second.value}" var="third">
	                                    <a href="goods.do?op=selectByThird&typeid=${third.typeid}">${third.typename}</a>|
	                                    </c:forEach>	                                
									
	                                </div>
	                                </c:forEach>                                                                
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>                       
                    </li>
                    </c:forEach>                   	
                </ul>            
            </div>
        </div>  
        <!--End 商品分类详情 End-->                                                     
    	<ul class="menu_r">                                                                                                                                               
        	<li><a href="indexAction.do">首页</a></li>
            <li><a href="Food.jsp">美食</a></li>
            <li><a href="Fresh.jsp">生鲜</a></li>
            <li><a href="HomeDecoration.jsp">家居</a></li>
            <li><a href="SuitDress.jsp">女装</a></li>
            <li><a href="MakeUp.jsp">美妆</a></li>
            <li><a href="Digital.jsp">数码</a></li>
            <li><a href="GroupBuying.jsp">团购</a></li>
        </ul>
        <div class="m_ad">中秋送好礼！</div>
    </div>
</div>
<!--End Menu End--> 