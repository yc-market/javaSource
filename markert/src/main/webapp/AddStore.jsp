<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.l_add {
	width: 267px;
	height: 38px;
	line-height: 38px\9;
	overflow: hidden;
	background: url(../images/i_u.png) no-repeat 285px center;
	background-color: #FFF;
	color: #888888;
	font-size: 14px;
	font-family: "Microsoft YaHei";
	padding: 0 40px 0 10px;
	border: 1px solid #cccccc;
}
</style>
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

<script type="text/javascript" src="js/select.js"></script>

<script type="text/javascript" src="js/lrscroll.js"></script>

<script type="text/javascript" src="js/iban.js"></script>
<script type="text/javascript" src="js/fban.js"></script>
<script type="text/javascript" src="js/f_ban.js"></script>
<script type="text/javascript" src="js/mban.js"></script>
<script type="text/javascript" src="js/bban.js"></script>
<script type="text/javascript" src="js/hban.js"></script>
<script type="text/javascript" src="js/tban.js"></script>

<script type="text/javascript" src="js/lrscroll_1.js"></script>

<title>尤洪</title>
</head>
<body>
	<div class="soubg">
		<span class="fr"> <c:if test="${empty loginedUser }">
				<span class="fl">你好，请<a href="Login.jsp">登录</a>&nbsp; <a
					href="Regist.jsp" style="color: #ff4e00;">免费注册</a>&nbsp;|&nbsp;<a
					href="Member_Order.jsp">个人中心</a>&nbsp;|
				</span>
			</c:if> <c:if test="${!empty loginedUser }">

				<span class="fl">欢迎<a>${loginedUser.uname}</a>&nbsp; <a
					href="Regist.jsp" style="color: #ff4e00;">免费注册</a>&nbsp;|&nbsp;<a
					href="Member_Order.jsp">个人中心</a>&nbsp;|&nbsp;<a
					href="user.do?op=logout">退出</a>|&nbsp;
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
								<li><a href="#">网站导航</a></li>
								<li><a href="#">网站导航</a></li>
							</ul>
						</div>
					</div>
				</div>
		</span> <span class="fl">|&nbsp;关注我们：</span> <span class="s_sh"><a
				href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span> <span
			class="fr">|&nbsp;<a href="#">手机版&nbsp;<img
					src="images/s_tel.png" align="absmiddle" /></a></span>
		</span>
	</div>

	<!--Begin Login Begin-->
	<div class="log_bg">
		<div class="top">
			<div class="logo">
				<a href="Index.html"><img src="images/logo.png" /></a>
			</div>
		</div>
		<div class="regist">
			<div class="log_img">
				<img src="images/l_img.png" width="611" height="425" />
			</div>
			<div class="reg_c"
				style="width: 500px; height: 500px; margin-top: 0px">
				<%if(request.getAttribute("msg") != null){ %>
				<div style="color: red; padding-left: 40px">
					<%=request.getAttribute("msg") %>
				</div>
				<%}%>
				<form action="store.do">
				<input type="hidden" name="op" value="addStore">
					<table border="0"
						style="width: 420px; font-size: 14px; margin-top: 30px;"
						cellspacing="0" cellpadding="0">
						<tr height="50" valign="top">
						<tr>
							<td width="95"><br></td>
						</tr>
						<tr>
							<td width="95"><br></td>
						</tr>
							<td width="95">&nbsp;</td>
							<td><span style="font-size: 24px; margin-left: 55px">添加店铺</span>
							</td>
						</tr>
						<tr>
							<td width="95"><br></td>
						</tr>
						<tr>
							<td width="95"><br></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;店铺名称
								&nbsp;</td>
							<td><input type="text" value="" class="l_add" name="storename" /></td>
						</tr>
						<tr>
							<td width="95"><br></td>
						</tr>
						<tr height="60">
							<td>&nbsp;</td>
							<td><input type="submit" value="立即添加" class="log_btn" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--End Login End-->
	<%@ include file="Footer.jsp"%>