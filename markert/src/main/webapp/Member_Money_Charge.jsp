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
            <div class="mem_tit">
            	<span class="fr" style="font-size:12px; color:#55555; font-family:'宋体'; margin-top:5px;"></span>会员余额
            </div>
            
            
            <form action="payment.do">
            <input type="hidden" name="op" value="addCash" />
			<table border="0" class="ma_tab" style="width:930px; margin-bottom:30px;" cellspacing="0" cellpadding="0">
              <tr>
              	<td class="ma_a" colspan="3" align="right"><a href="payment.do?op=SelectBalance">查看账户明细</a></td>
              </tr>
              <tr>
                <td align="center">充值金额</td>
                <td colspan="2"><input type="text" class="add_ipt" name="addCash" style="width:190px;" /></td>
              </tr>
              <tr>
              	<td align="center">支付方式</td>
                <td colspan="3"><input id="r1" type="radio" value="1" name="account">支付宝</input>&nbsp; &nbsp;
					<input id="r2" type="radio" value="2" name="account">微信</input></td>
              </tr>
              <tr>                                                                                                                                                    
                <td width="200" align="center">名称</td>                                                            
                <td width="500" align="center">描述</td>
                <td width="230" align="center">手续费</td>                   
              </tr>
              <tr>
                <td><label class="r_rad"></label><label class="r_txt" style="margin-left:84px">微信</label></td>
                <td>
                	微信支付（商户功能）， 用户可在微信公众号中完成选购支付的流程。商户也可以把商品网页生成二维码
                ，在微信中直接购买。
                </td>
                <td align="center">0</td>
              </tr>
              <tr>
                <td ><label class="r_rad"></label><label class="r_txt" style="margin-left:80px;">支付宝</label></td>
                <td>
                	支付宝网站(www.alipay.com) 是国内先进的网上支付平台。<br />
                    支付宝收款接口：在线即可开通，<font color="#ff4e00">零预付，免年费，</font>单笔阶梯费率，无流量限制。<br />
                </td>
                <td align="center">0</td>
              </tr>
              <tr>
                <td colspan="7" align="right">您当前的可用资金为：￥${param.balance}</td>
              </tr>
			</table>
            
            <p align="center">
            	<input type="submit" value="提交申请" class="btn_tj" />&nbsp; &nbsp; <input type="reset" value="重置表单" class="btn_tj" />
            </p>
			</form>


            
        </div>
    </div>
	<!--End 用户中心 End--> 
   <%@ include file="Footer.jsp" %>
</div>
</body>