<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->
    
    
    <script type="text/javascript" src="js/menu.js"></script>    
                
	<script type="text/javascript" src="js/n_nav.js"></script>   
    
    <script type="text/javascript" src="js/num.js">
    	var jq = jQuery.noConflict();
    </script>     
    
    <script type="text/javascript" src="js/shade.js"></script>
    
    <script type="text/javascript">
    function rdelete(gid){
		var r=confirm('是否确定删除?');
		if(r==true){
			location.href='buycar.do?op=delete&gid='+gid;
		}
	}
    
    
    </script>   
    
<title>尤洪</title>
</head>
<body>  
<%@ include file="header.jsp"%>
<%@ include file="Menu.jsp"%>
<div class="i_bg">  
    <div class="content mar_20">
    	<img src="images/img1.jpg" />        
    </div>
    
    <!--Begin 第一步：查看购物车 Begin -->
    <div class="content mar_20">
    <form action="buycar.do">
    <input type="hidden" name="op" value="ViewShoppingCar2"/>
    	<table border="0" class="car_tab" style="width:1200px; margin-bottom:50px;" cellspacing="0" cellpadding="0">
          <tr>
            <td class="car_th" width="490">商品名称</td>
            <td class="car_th" width="140">属性</td>
            <td class="car_th" width="150">购买数量</td>
            <td class="car_th" width="130">小计</td>
            <td class="car_th" width="140">返还积分</td>
            <td class="car_th" width="150">操作</td>
          </tr>
          <c:forEach items="${list}" var="buyCar">
          <tr>
            <td>
            	<div class="c_s_img"><img src="upload/rawImages/${buyCar.goods.image[0].imgname }" width="73" height="73" /></div>
                ${buyCar.goods.gname }
            </td>
            <td align="center">${buyCar.attribute.size}</td>
            <td align="center">
            <input type="hidden" value="${buyCar.attribute.price}" name="price"/>
            	<div class="c_num">
                    <input type="button" value="" onclick="jianUpdate1(jq(this),${buyCar.attribute.price},${buyCar.goods.gid});" class="car_btn_1" />
                	<input id="number" type="text" value="${buyCar.count}" name="count_${buyCar.carid}" class="car_ipt" />  
                    <input type="button" value="" onclick="addUpdate1(jq(this),${buyCar.attribute.price},${buyCar.goods.gid});" class="car_btn_2" />
                </div>
            </td>
            <td align="center" style="color:#ff4e00;" id="xiaoji_${buyCar.goods.gid}">${buyCar.attribute.price*buyCar.count}</td>
            <td align="center">${buyCar.goods.grade }</td>
            <td align="center"><a href="javascript:rdelete(${buyCar.goods.gid})">删除</a>&nbsp; &nbsp;<a href="#">加入收藏</a></td>
          </tr>
          </c:forEach>
          <tr height="70">
          	<td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">
            	<label class="r_rad"><input type="checkbox" name="clear" checked="checked" /></label><label class="r_txt">清空购物车</label>
                <span class="fr">商品总价：${sessionScope.totalMoney}<b style="font-size:22px; color:#ff4e00;"></b></span>
            </td>
          </tr>
          <tr valign="top" height="150">
          	<td colspan="6" align="right">
            	<a href="indexAction.do"><img src="images/buy1.gif" /></a>&nbsp; &nbsp; 
            	<input  type="image" src="images/buy2.gif" />
            	<!-- <a href="buycar.do?op=ViewShoppingCar2"><img src="images/buy2.gif" /></a> -->
            </td>
          </tr>
        </table>
        </form>
    </div>
	<!--End 第一步：查看购物车 End--> 
    
    
    <!--Begin 弹出层-删除商品 Begin-->
    <%-- <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td>您确定要把该商品移除购物车吗？</td>
                  </tr>
                  <tr height="50" valign="bottom">
                    <td><a href="buycar.do?op=delete&gid=${list.gid}" class="b_sure">确定</a><a href="buycar.do?op=ViewShoppingCar" class="b_buy">取消</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>     --%>
    <!--End 弹出层-删除商品 End-->
    
<%@ include file="Footer.jsp" %>