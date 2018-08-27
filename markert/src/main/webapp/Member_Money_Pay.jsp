<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
		
		function rpay(){
			var r=confirm('是否确定购买?');
			if(r==true){
				
				location.href='payment.do';
			}
		}
</script>
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
        
	<script type="text/javascript" src="js/select.js"></script>
        
    
<title>尤洪</title>
</head>
<body>  
<%@ include file="header.jsp"%>
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
   		<div class="m_left">
        	<div class="left_n">管理中心</div>
            <div class="left_m">
            	<div class="left_m_t t_bg1">订单中心</div>
                <ul>
                	<li><a href="Member_Order.jsp">我的订单</a></li>
                    <li><a href="Member_Address.jsp">收货地址</a></li>
                    <li><a href="#">缺货登记</a></li>
                    <li><a href="#">跟踪订单</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg2">会员中心</div>
                <ul>
                	<li><a href="Member_User.jsp">用户信息</a></li>
                    <li><a href="Member_Collect.jsp">我的收藏</a></li>
                    <li><a href="Member_Msg.jsp">我的留言</a></li>
                    <li><a href="Member_Links.jsp">推广链接</a></li>
                    <li><a href="#">我的评论</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg3">账户中心</div>
                <ul>
                	<li><a href="Member_Safe.jsp">账户安全</a></li>
                    <li><a href="Member_Packet.jsp">我的红包</a></li>
                    <li><a href="Member_Money.jsp" class="now">资金管理</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg4">分销中心</div>
                <ul>
                	<li><a href="Member_Member.jsp">我的会员</a></li>
                    <li><a href="Member_Results.jsp">我的业绩</a></li>
                    <li><a href="Member_Commission.jsp">我的佣金</a></li>
                    <li><a href="Member_Cash.jsp">申请提现</a></li>
                </ul>
            </div>
        </div>
		<div class="m_right">
            <p></p>		
            <form action="payment.do" >
        	<input type="hidden" name="op" value="Payment" />
			<table border="0" class="ma_tab" style="width:930px; margin-top:50px;" cellspacing="0" cellpadding="0">
			  <tr>
                <td align="right" width="130" style="padding-right:30px;">订单号</td>                                                                       
                <td><input type="text" value="${param.orderid}" name="gid" readonly="readonly" /></td>
              </tr>
              <tr>
                <td align="right" width="130" style="padding-right:30px;">您需支付的金额为</td>                                                                       
                <td><input type="text" value="${param.buymoney}" name="buymoney" readonly="readonly" /></td>
              </tr>
              <tr>
                <td align="right" style="padding-right:30px;">您选择的支付方式为</td>
                <td><input id="r1" type="radio" value="1" name="account">支付宝</input>
					<input id="r2" type="radio" value="2" name="account">微信</input>
					<input id="r3" type="radio" value="3" name="account">账户余额</input></td>
              </tr>
              <tr>
                <td align="right" style="padding-right:30px;">支付手续费用为</td>
                <td>￥ 0.00</td>
              </tr>
			</table>
            
            <p align="center">
            	<input type="submit" value="立即支付" class="btn_tj" />
            </p>
			
			</form>
			<c:if test="${not empty msg}">
				<script>
				alert("${msg}");
				</script>
			</c:if>
        </div>
    </div>
    
	<!--End 用户中心 End--> 
<%@ include file="Footer.jsp" %>
	</div>
	
</body>




