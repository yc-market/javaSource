<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->
    
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>    
                
	<script type="text/javascript" src="js/n_nav.js"></script>   
    
    <script type="text/javascript" src="js/select.js"></script>
    
    <script type="text/javascript" src="js/num.js">
    	var jq = jQuery.noConflict();
    </script>     
    
    <script type="text/javascript" src="js/shade.js"></script>
    <script type="text/javascript">
         function a(addrid){
        	 //alert(addrid);
        	 
        	 jQuery.getJSON('ajaxAddress.do',{addrid:addrid},function(address){
        		// document.getElementById("receiver").value="jQuery{address.receiver}";
        		 //alert(address.receiver);
        		 jQuery("#receiver").html(address.receiver);
        		 jQuery("#email").html(address.email);
        		 jQuery("#area").html(address.area);
        		 jQuery("#emailid").html(address.emailid);
        		 jQuery("#tel").html(address.tel);
        		 jQuery("#phone").html(address.phone);
        		 jQuery("#building").html(address.building);
        		 jQuery("#postdate").html(address.postdate);
        		 jQuery("#GGBOND").val(address.area);
        		 jQuery("#rec").val(address.receiver);
        	 });
        	 
         }
    
    </script>
<title>尤洪</title>
</head>
<body>  
<%@ include file="header.jsp"%>
<%@ include file="Menu.jsp"%>
<div class="i_bg">  
    <div class="content mar_20">
    	<img src="images/img2.jpg" />        
    </div>
    
    <!--Begin 第二步：确认订单信息 Begin -->
    <div class="content mar_20">
    	<div class="two_bg">
        	<div class="two_t">
            	<span class="fr"><a href="buycar.do?op=ViewShoppingCar">修改</a></span>商品列表
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
              <tr>
                <td class="car_th" width="550">商品名称</td>
                <td class="car_th" width="140">属性</td>
                <td class="car_th" width="150">购买数量</td>
                <td class="car_th" width="130">小计</td>
                <td class="car_th" width="140">返还积分</td>
              </tr>
               <c:forEach items="${list}" var="buyCar">
          <tr>
            <td>
            	<div class="c_s_img"><img src="upload/rawImages/${buyCar.goods.image[0].imgname }" width="73" height="73" /></div>
                ${buyCar.goods.gname }
            </td>
            <td align="center">${buyCar.goods.size[0].size}</td>
            <td align="center">
            <input type="hidden" value="${buyCar.goods.size[0].price}" name="price"/>
            	<div class="c_num">
                    
                	<input id="number" type="text" value="${buyCar.count}" name="count" class="car_ipt" />  
                    
                </div>
            </td>
            <td align="center" style="color:#ff4e00;" id="xiaoji_${buyCar.goods.gid}">${buyCar.goods.price*buyCar.count}</td>
            <td align="center">${buyCar.goods.grade }</td>
            
          </tr>
          </c:forEach>
           
             
              <tr>
                <td colspan="5" align="right" style="font-family:'Microsoft YaHei';">
                    商品总价：￥${sessionScope.totalMoney} ； 返还积分 ${sessionScope.totalGrade}R  
                </td>
              </tr>
            </table>
            
            <div class="two_t">
            <span class="fr">
            	
                      
                     <c:forEach items="${addressList}" var="address"> 
                        <input type="button" onclick="a(${address.addrid});" value="地址${address.addrid}"></input>
                 </c:forEach> 
                 
            </span>
            	收货人信息
            </div>
            <div style="z-index:-100;position: relative;">
            <table border="0" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
              <tr>
                <td class="p_td" width="160">收货人姓名</td>
                <td width="395" id="receiver"></td>
                <td class="p_td" width="160">电子邮件</td>
                <td width="395" id="email"></td>
              </tr>
              <tr>
                <td class="p_td">详细信息</td>
                <td id="area"></td>
                <td class="p_td">邮政编码</td>
                <td id="emailid"></td>
              </tr>
              <tr>
                <td class="p_td">电话</td>
                <td id="tel"></td>
                <td class="p_td">手机</td>
                <td id="phone"></td>
              </tr>
              <tr>
                <td class="p_td">标志建筑</td>
                <td id="building"></td>
                <td class="p_td">最佳送货时间</td>
                <td id="postdate"></td>
              </tr>
            </table>
            </div>
            
            <div class="two_t">
            	配送方式
            </div>
            <form action="order.do">
            <input type="hidden" name="op" value="addOrder" />
            <input type="hidden" name="area"  id="GGBOND"/>
            <input type="hidden" name="receiver"  id="rec"/>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
              <tr>
                <td class="car_th" width="80"></td>
                <td class="car_th" width="200">名称</td>
                <td class="car_th" width="370">订购描述</td>
                <td class="car_th" width="150">费用</td>
                <td class="car_th" width="135">免费额度</td>
                <td class="car_th" width="175">保价费用</td>
              </tr>
              <tr>
              	<td align="center"><input id="r1" type="radio" value="申通快递" name="way"></input></td>
                <td align="center" style="font-size:14px;"><b>申通快递</b></td>
                <td>江、浙、沪地区首重为15元/KG，其他地区18元/KG，续重均为5-6元/KG， 云南地区为8元</td>
                <td align="center">￥15.00</td>
                <td align="center">￥0.00</td>
                <td align="center">不支持保价</td>
              </tr>
              <tr>
              	<td align="center"><input id="r2" type="radio" value="城际快递" name="way"></input></td>
                <td align="center" style="font-size:14px;"><b>城际快递</b></td>
                <td>运费固定</td>
                <td align="center">￥15.00</td>
                <td align="center">￥0.00</td>
                <td align="center">不支持保价</td>
              </tr>
              <tr>
              	<td align="center"><input id="r2" type="radio" value="邮局平邮" name="way"></input></td>
                <td align="center" style="font-size:14px;"><b>邮局平邮</b></td>
                <td>运费固定</td>
                <td align="center">￥15.00</td>
                <td align="center">￥0.00</td>
                <td align="center">不支持保价</td>
              </tr>
            </table> 
            
            <table border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right">
                	该订单完成后，您将获得 <font color="#ff4e00">${sessionScope.totalGrade}</font> 积分 ，以及价值 <font color="#ff4e00">￥0.00</font> 的红包 <br />
                    商品总价: <font color="#ff4e00">￥${sessionScope.totalMoney}</font>  + 配送费用: <font color="#ff4e00">￥15.00</font>
                </td>
              </tr>
              <tr height="70">
                <td align="right">
                	<b style="font-size:14px;">应付款金额：<span style="font-size:22px; color:#ff4e00;">￥${sessionScope.totalMoney+15}</span></b>
                </td>
              </tr>
              <tr height="70">
                <td align="right"><input type="image" src="images/btn_sure.gif" /></td>
              </tr>
            </table>
            </form>
		
            
        	
        </div>
    </div>
	<!--End 第二步：确认订单信息 End-->
    
    <%@ include file="Footer.jsp" %>
</div>
</body>
    