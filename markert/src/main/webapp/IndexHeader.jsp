<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!--Begin Header Begin-->


<div class="soubg">
	<div class="sou">

        <span class="fr">
        
         <c:if test="${empty loginedUser }">
         <span class="fl">你好，请<a href="Login.jsp">登录</a>&nbsp; <a href="Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp;|&nbsp;<a href="Member.jsp">个人中心</a>&nbsp;|</span>	
		 </c:if>
		 
		<c:if test="${!empty loginedUser }">

		<span class="fl">欢迎<a>${loginedUser.uname}</a>&nbsp; <a href="Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp;|&nbsp;<a href="Member.jsp">个人中心</a>&nbsp;|&nbsp;<a href="user.do?op=logout">退出</a>|&nbsp;</span>
        	
		</c:if>
        
        
        	
        	<span class="ss">
            	<div class="ss_list">
                	<a href="#">收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">我的收藏夹</a></li>
                                <li><a href="#">我的收藏夹</a></li>
                            </ul>
                        </div>
                    </div>     
                </div>
                <div class="ss_list">
                	<a href="#">客户服务</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">客户服务</a></li>
                                <li><a href="#">客户服务</a></li>
                                <li><a href="#">客户服务</a></li>
                            </ul>
                        </div>
                    </div>    
                </div>
                <div class="ss_list">
                	<a href="#">网站导航</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="indexAction.do">首页</a></li>
                                <li><a href="#">网站导航</a></li>
                            </ul>
                        </div>
                    </div>    
                </div>
            </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<div class="top">
    <div class="logo"><a href="Index.jsp"><img src="images/logo.png" /></a></div>
    <div class="search">
    	<form>
        	<input type="text" value="" class="s_ipt" />
            <input type="submit" value="搜索" class="s_btn" />
        </form>                      
        <span class="fl"><a href="#">咖啡</a><a href="#">iphone 6S</a><a href="#">新鲜美食</a><a href="#">蛋糕</a><a href="#">日用品</a><a href="#">连衣裙</a></span>
    </div>
    <div class="i_car">
    
    	<div class="car_t">购物车 [ <span id="total">${buyCarList.size()}</span> ]</div>
        <div class="car_bg">
        <c:if test="${empty loginedUser }">
       		<!--Begin 购物车未登录 Begin-->
        	<div class="un_login">还未登录！<a href="Login.jsp" style="color:#ff4e00;">马上登录</a> 查看购物车！</div>
            <!--End 购物车未登录 End-->
        </c:if>
        
        <c:if test="${!empty loginedUser }">
        
            <!--Begin 购物车已登录 Begin-->
            <c:forEach items="${buyCarList}" var="c">
            <ul class="cars" id="cars">
            	<li>
                	<div class="img"><a href="#"><img src="upload/rawImages/${c.goods.image[0].imgname}" width="58" height="58" /></a></div>
                    <div class="name"><a href="#">${c.goods.gname }</a></div>
                    <div class="price"><font color="#ff4e00">${c.attribute.price }</font> X${c.count}</div>
                </li>
                
            </ul>
            </c:forEach> 
            <div class="price_sum">共计&nbsp; <font color="#ff4e00">￥</font><span id="totalMoney">${sessionScope.totalMoney}</span></div>
            <div class="price_a"><a href="buycar.do?op=ViewShoppingCar">去购物车结算</a></div>
            <!--End 购物车已登录 End-->
         </c:if>
        </div>
    </div>
</div>
<!--End Header End--> 