<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        
	<script type="text/javascript" src="js/select.js"></script>
    <style type="text/css">
    	.ma_a_v a{
			color:#ff4e00; margin:0 60px;
		}
    </style>    
    
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
                    <li><a href="payment.do?op=SelectBalance" class="now">资金管理</a></li>
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
            <div class="mem_tit">
            	<span class="fr" style="font-size:12px; color:#55555; font-family:'宋体'; margin-top:5px;"></span>账单明细
            </div>
			<table border="0" class="ma_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
              <tr>
              	<td class="ma_a" colspan="7" align="right"><a href="Member_Money_type.jsp">添加绑定账户</a>|<a href="Member_Money_Charge.jsp?balance=${payment.balance}">充值</a></td>
              </tr>
              <tr>                                                                                                                                                    
                <td width="155">操作时间</td>                                                                                                                                         
                <td width="110">类型</td>
                <td width="110">金额</td>
              </tr>
              <c:forEach items="${list }" var="list">
              <tr>
                <td>${list.modtime}</td>
                <td>
                <c:if test="${list.account=='1' }">支付宝</c:if>
      			<c:if test="${list.account=='2' }">微信</c:if>
      			<c:if test="${list.account=='3' }">账户余额</c:if>
                </td>
                <td>${list.changes}</td>
              </tr>
              </c:forEach>
              <tr>
                <td colspan="7" align="right">您当前的可用资金为：￥${payment.balance}</td>
              </tr>
			</table>
			
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