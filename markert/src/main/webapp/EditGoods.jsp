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
<script type="text/javascript">
	function validate() {
		var a = document.getElementById("file");
		var form = document.getElementById("upload");
		if (a.value == "") {
			alert("请先选择图片");
			return false;
		} else {
			form.submit();
		}
	}
	function validate1() {
		var a = document.getElementById("addsize");
		var b = document.getElementById("addprice");
		var form = document.getElementById("size");
		if (a.value == "") {
			alert("请输入商品规格");
			return false;
		} else if(b.value == ""){
			alert("请输入对应的商品价格");
			return false;
		}else {
		}
			form.submit();
    }
	
	function returnStore(){
		
	}
</script>
<title>尤洪</title>
<c:if test="${! empty msg}">
	<script>
		alert("${msg}");
	</script>
</c:if>
</head>
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
			<div
				style="height: 40px; width: 972px; float: left; text-align: center; margin-top: 10px; color: #ff4e00">
				<h1>
					<a href="store.do?op=showStore">返回商店</a>
				</h1>
			</div>

		</div>

		<div class="regist">
			<div class="log_img">
				<img src="images/l_img.png" width="611" height="425" />
			</div>
			<div class="reg_c"
				style="width: 500px; height: 500px; margin-top: 0px">
				<form id="upload" action="thumb.do?gid=${param.gid}" method="post"
					enctype="multipart/form-data">
					<table border="0"
						style="width: 420px; font-size: 14px; margin-top: 10px;"
						cellspacing="0" cellpadding="0">
						<tr>
							<td width="95">&nbsp;</td>
							<td><span style="font-size: 24px; margin-left: 55px">编辑商品属性</span></td>
						</tr>
						<tr height="50" valign="top">

							<tr height=100>
							<td width="95">&nbsp;</td>
							<td>
								<div class="img">
									<c:if test="${imgname!=null}">
										<a href="upload/rawImages/${imgname}" target="_blank"><img
											src="upload/thumbImages/${imgname}" width="100" height="100" /></a>
									</c:if>
								</div><tr height="50">
							<td align="right">
						<font color="#ff4e00">*</font>商品图片 &nbsp;</td>
							<td><input id="file" type="file" name="image" id="image"
								class="l_add"></td>
						</tr>
						<tr height="60">
							<td width="80">&nbsp;</td>
							<td><input type="button" value="上传" onclick="validate()"
								class="log_btn" /></td>
						</tr>
					</table>
				</form>
				<form id="size"action="goods.do" method="post">
				<input type="hidden" name="op" value="addSize">
				<input type="hidden" name="gid" value="${param.gid }">
					<table border="0"
						style="width: 420px; font-size: 14px; margin-top: 30px;"
						cellspacing="0" cellpadding="0">
						<tr height="50">
							<td align="right">
							<font color="#ff4e00">*</font>&nbsp;商品规格 &nbsp;</td>
							<td><input id="addsize" type="text" name="size" class="l_add" ></td>
							
						</tr>
						<tr height="50">
							<td align="right">
						<font color="#ff4e00">*</font>&nbsp;商品价格 &nbsp;</td>
							<td><input id="addprice" type="text" name="price" class="l_add" ></td>
					   </tr>
						<tr height="60">
							<td width="80">&nbsp;</td>
							<td><input  type="button" value="确定" onclick="validate1() "
								class="log_btn" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--End Login End-->
	<%@ include file="Footer.jsp"%>