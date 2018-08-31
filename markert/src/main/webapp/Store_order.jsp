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
<script type="text/javascript" src="js/jquery-1.11.1.min_044d0927.js"></script>
<script type="text/javascript" src="js/jquery.bxslider_e88acd1b.js"></script>

<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>

<script type="text/javascript" src="js/lrscroll_1.js"></script>


<script type="text/javascript" src="js/n_nav.js"></script>
<script type="text/javascript" src="js/milk_ban.js"></script>
<script type="text/javascript" src="js/paper_ban.js"></script>
<script type="text/javascript" src="js/baby_ban.js"></script>
<script type="text/javascript" src="js/select.js"></script>
<title>尤洪</title>
<c:if test="${! empty param.msg}">
	<script>
		alert("${param.msg}");
	</script>
	</c:if>
</head>
<body>
	<div class="soubg">
		<div class="sou">
			<span class="fr"> <c:if test="${empty loginedUser }">
					<span class="fl">你好，请<a href="Login.jsp">登录</a>&nbsp; <a
						href="Regist.jsp" style="color: #ff4e00;">免费注册</a>&nbsp;|&nbsp;<a
						href="Member_Order.jsp">个人中心</a>&nbsp;|
					</span>
				</c:if> <c:if test="${!empty loginedUser }">
					<span class="fl">欢迎<a>${loginedUser.uname}</a>&nbsp; <a href="Regist.jsp" style="color: #ff4e00;">免费注册</a>&nbsp;|<a
						href="Member_Order.jsp">个人中心</a>&nbsp;|&nbsp;<a href="user.do?op=logout">退出</a>|
					</span>

				</c:if> <span class="ss">
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
			 <span class="fl">|&nbsp;关注我们：</span> <span class="s_sh"><a
					href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span> <span
				class="fr">|&nbsp;<a href="#">手机版&nbsp;<img
						src="images/s_tel.png" align="absmiddle" /></a></span>
			</span>
		</div>
	</div>
	<div class="top">
		<div class="logo">
			<a href="Index.html"><img src="images/logo.png" /></a>
		</div>
		<div style="height:40px;width:972px;float:left;text-align:center;margin-top:10px;color:#ff4e00"><h1>${store.storename}</h1></div>
			
		<div class="search">
			<form>
				<input type="text" value="" class="s_ipt" /> <input type="submit"
					value="搜索" class="s_btn" />
			</form>
		</div>
	</div>

	<div class="i_bg">
		<div class="content mar_20">
			<div class="m_left">
				<div class="left_n">管理中心</div>
				<div class="left_m">
					<div class="left_m_t t_bg4">订单中心</div>
					<ul>
						<li><a href="selectAllDetail.do?storeid=${store.storeid}">全部订单</a></li>
						<li><a href="selectDeliverDetail.do?storeid=${store.storeid}&deliver=1">已发货订单</a></li>
						<li><a href="selectDeliverDetail.do?storeid=${store.storeid}&deliver=0">未发货订单</a></li>
						<li><a href="Store.jsp">缺货登记</a></li>
					</ul>
				</div>
				<div class="left_m">
					<div class="left_m_t t_bg2">商品中心</div>
					<ul>
						<li><a href="store.do?op=addGoods&storeid=${store.storeid}" class="now">添加商品</a></li>
					</ul>
				</div>
				<div class="left_m">
					<div class="left_m_t t_bg3">销售中心</div>
					<ul>
						<li><a href="#">销售总额</a></li>
						<li><a href="#">销售详情</a></li>
					</ul>
				</div>
				
			</div>
            <div class="mem_tit">我的订单</div>
            <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
              <tr>                                                                                                                                                    
                <td width="20%">商品名</td>
                <td width="10%">商品价格</td>
                <td width="10%">购买数量</td>
                <td width="10%">商品规格</td>
                <td width="20%">下单时间</td>
                <td width="10%">收货人</td>
                <td width="10%">收货地址</td>
                <td width="10%">是否发货</td>
              </tr>
              
              
              <c:forEach items="${list }" var="list">
              <c:if test="${list.order != null}">
              <tr>
                <td><font color="#ff4e00">${list.goods.gname}</font></td>
                <td>${list.attribute.price}</td>
                <td>${list.count}</td>
                <td>${list.attribute.size}</td>
                <td>${list.order.buydate}</td>
                <td>${list.order.receiver}</td>
                <td>${list.order.address}</td>
                <td>
      			<c:if test="${list.deliver=='0' }">未发货</c:if>
      			<c:if test="${list.deliver=='1' }"><font color="#ff4e00">已发货</font></c:if>
                </td>
              </tr>
              </c:if>
              </c:forEach>
            </table>            
        </div>
		<%@ include file="Footer.jsp"%>