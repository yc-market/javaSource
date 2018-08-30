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
$(function(){
	getNextClassify();
})
$(function(){
	getLastClassify();
})
function getNextClassify(){
	var firstid = $("#first").find('option:selected').val();
	$("#second").empty();
	var classNext = $("#second");
	$.ajax({
		type:"post",
		contentType:"application/json",  
		url:"getNextClassfy.do?parentid="+firstid,
		success:function (data) {			
			console.log(data);
			if(data.length!="" && data.length!=null){
				for(var i = 0;i < data.length ; i++){					
					classNext.append("<option value="+data[i].typeid+">"+data[i].typename+"</option>");
				}
			}else{
				classNext.append("<option value="+100000+">---无---</option>")
			}
		},
		error:function(data){
			alert("数据处理异常")
		}
	});	
	$(function(){
		getLastClassify();
	})
}
function getLastClassify(){
	var firstid = $("#first").find('option:selected').val();
	var secondid = $("#second").find('option:selected').val();
	$("#third").empty();
	var classLast = $("#third");
	$.ajax({
		type:"post",
		contentType:"application/json",  
		url:"getLastClassfy.do?firstid="+firstid+"&secondid="+secondid,
		success:function (data) {			
			if(data.length!="" && data.length!=null){
				for(var i = 0;i < data.length ; i++){					
					classLast.append("<option value="+data[i].typeid+">"+data[i].typename+"</option>");
				}
			}else{
				classLast.append("<option value="+100000+">---无---</option>")
			}
		},
		error:function(data){
			alert("数据处理异常")
		}
	});	
}


</script>
<title>尤洪</title>
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
			</span>
			 <span class="fl">|&nbsp;关注我们：</span> <span class="s_sh"><a
					href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span> <span
				class="fr">|&nbsp;<a href="#">手机版&nbsp;<img
						src="images/s_tel.png" align="absmiddle" /></a></span>
			</span>
		</div>
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
				style="width: 500px; height: 670px; margin-top: 0px">
				<form action="goods.do" method="get">
				<input type="hidden" name="storeid" value="${param.storeid}">
				<input type="hidden" name="op" value="goodsAdd">
					<table border="0"
						style="width: 420px; font-size: 14px; margin-top: 20px;"
						cellspacing="0" cellpadding="0">
						<tr height="50" valign="top">
							<td width="95">&nbsp;</td>
							<td><span style="font-size: 24px; margin-left: 55px">添加商品</span>
							</td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;商品名称
								&nbsp;</td>
							<td><input type="text" value="" class="l_add" name="gname" /></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;商品类目
								&nbsp;</td>
							<td>
												
								<select class="form-control" name="first" id="first" onchange="getNextClassify()">
								<c:forEach items="${first}" var="first" varStatus="id">
									<option value="${first.typeid}" style="width:40px">${first.typename}</option>
								</c:forEach>
								</select>																			
							
								<select class="form-control" name="second" id="second" onchange="getLastClassify()">								
								</select>
								<select class="form-control" name="third" id="third">
									<option value="other"></option>	 							
								</select>
							</td>
							
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;商品价格
								&nbsp;</td>
							<td><input type="text" value="" class="l_add" name="price" /></td>
						</tr>
						<!-- <tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;商品规格
								&nbsp;</td>
							<td><input type="text" value="" class="l_add" name="size" /></td>
						</tr> -->
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;库存数量
								&nbsp;</td>
							<td><input type="text" value="" class="l_add" name="count" /></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;商品积分
								&nbsp;</td>
							<td><input type="text" value="" class="l_add" name="grade" /></td>
						</tr>
						
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;商品简介
								&nbsp;</td>
							<td><textarea style="width: 309px; height: 165px" name="des"></textarea></td>
						</tr>
						<tr height="60">
							<td>&nbsp;</td>
							<td><input type="submit" value="立即添加" class="log_btn"/></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--End Login End-->
	<%@ include file="Footer.jsp"%>