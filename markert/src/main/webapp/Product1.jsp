<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script type="text/javascript" src="js/lrscroll_1.js"></script>


<script type="text/javascript" src="js/n_nav.js"></script>

<link rel="stylesheet" type="text/css" href="css/ShopShow.css" />
<link rel="stylesheet" type="text/css" href="css/MagicZoom.css" />
<script type="text/javascript" src="js/MagicZoom.js"></script>

<script type="text/javascript" src="js/num.js">
	var jq = jQuery.noConflict();
</script>

<script type="text/javascript" src="js/p_tab.js"></script>

<script type="text/javascript" src="js/shade.js"></script>

<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
		function show(sizeid){
			
			//var size = $(this).html();
			$.getJSON('ajaxPrice.do', {
				sizeid : sizeid
			}, function(attribute) {
				$("#price").html(attribute.price);
			});

		}
		$(function() {
			$("#test li").click(function() {

				$(this).siblings('li').removeClass("checked");
				$(this).addClass("checked");
			});
		});
	$(function() {
		$("#test1 li").click(function() {

			$(this).siblings('li').removeClass("tsSelectImg");

			$(this).addClass("tsSelectImg");
		});
	});
</script>
<style type="text/css">
.d_care_f {
	height: 27px;
	line-height: 27px;
	overflow: hidden;
	background: url(images/heart_h.png) no-repeat left center;
	float: left;
	display: inline;
	margin-left: 50px;
	padding-left: 22px;
}
</style>
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
						href="Regist.jsp" style="color: #ff4e00;">免费注册</a>&nbsp;|<a
						href="Member_Order.jsp">个人中心</a>&nbsp;|&nbsp;<a
						href="user.do?op=logout">退出</a>|
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
			</span> <span class="fl">|&nbsp;关注我们：</span> <span class="s_sh"><a
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
		<div
			style="height: 40px; width: 972px; float: left; text-align: center; margin-top: 10px; color: #ff4e00">
			<h1>
				<a href="store.do?op=showStore">${store.storename}</a>
			</h1>
		</div>
	</div>

	<div class="i_bg">
		<div class="content">

			<div id="tsShopContainer">
				<div id="tsImgS">
					<a href="images/p_big.jpg" title="Images" class="MagicZoom"
						id="MagicZoom"><img src="images/p_big.jpg" width="390"
						height="390" /></a>
				</div>
				<div id="tsPicContainer">
					<div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
					<div id="tsImgSCon">
						<ul>
							<li onclick="showPic(0)" rel="MagicZoom" class="tsSelectImg"><img
								src="images/ps1.jpg" tsImgS="images/ps1.jpg" width="79"
								height="79" /></li>
							<li onclick="showPic(1)" rel="MagicZoom"><img
								src="images/ps2.jpg" tsImgS="images/ps2.jpg" width="79"
								height="79" /></li>
							<li onclick="showPic(2)" rel="MagicZoom"><img
								src="images/ps3.jpg" tsImgS="images/ps3.jpg" width="79"
								height="79" /></li>
							<li onclick="showPic(3)" rel="MagicZoom"><img
								src="images/ps4.jpg" tsImgS="images/ps4.jpg" width="79"
								height="79" /></li>
							<li onclick="showPic(4)" rel="MagicZoom"><img
								src="images/ps1.jpg" tsImgS="images/ps1.jpg" width="79"
								height="79" /></li>
							<li onclick="showPic(5)" rel="MagicZoom"><img
								src="images/ps2.jpg" tsImgS="images/ps2.jpg" width="79"
								height="79" /></li>
							<li onclick="showPic(6)" rel="MagicZoom"><img
								src="images/ps3.jpg" tsImgS="images/ps3.jpg" width="79"
								height="79" /></li>
							<li onclick="showPic(7)" rel="MagicZoom"><img
								src="images/ps4.jpg" tsImgS="images/ps4.jpg" width="79"
								height="79" /></li>
						</ul>
					</div>
					<div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
				</div>
				<img class="MagicZoomLoading" width="16" height="16"
					src="images/loading.gif" alt="Loading..." />
			</div>

			<div class="pro_des">
				<div class="des_name">
					<p>${detail.gname}</p>

				</div>

				<div class="des_price">
					本店价格：￥<b id="price">${attribute[0].price}</b><br /> 消费积分：<span>${detail.grade}R</span>
				</div>
				<c:if test="${! empty attribute}">

					<div class="des_choice">
						<span class="fl">型号选择：</span>
						<ul id="test">
							<c:forEach items="${attribute}" varStatus="i" var="attribute">
								<li onclick="show(${attribute.sizeid})" class="check">${attribute.size}<div class="ch_img"></div></li>

							</c:forEach>
								<%-- <input type="radio" class="ch_img" name="size">${size.size}</input>  --%>
								<!-- <div class="ch_img"></div> -->
						</ul>
					</div>
				</c:if>
			</div>
		</div>
		<div class="content mar_20">
			<div class="des_border">
				<div class="des_tit">
					<ul>
						<li class="current"><a href="#p_attribute">商品属性</a></li>
						<li><a href="#p_details">商品详情</a></li>
						<li><a href="#p_comment">商品评论</a></li>
					</ul>
				</div>
				<div class="des_con" id="p_attribute">

					<table border="0" align="center"
						style="width: 100%; font-family: '宋体'; margin: 10px auto;"
						cellspacing="0" cellpadding="0">
						<tr>
							<td>商品名称：${detail.gname }</td>
							<td>商品编号：${detail.gid }</td>
							<td>商品描述：${detail.des}</td>

							<!-- <td>品牌： 迪奥（Dior）</td>
                        <td>上架时间：2015-09-06 09:19:09 </td> -->
						</tr>


					</table>


				</div>
			</div>

			<div class="des_border" id="p_details">
				<div class="des_t">商品详情</div>
				<div class="des_con">
					<table border="0" align="center"
						style="width: 745px; font-size: 14px; font-family: '宋体';"
						cellspacing="0" cellpadding="0">
						<tr>
							<td width="265"><img src="images/de1.jpg" width="206"
								height="412" /></td>
							<td>${detail.des}</td>
						</tr>
					</table>

					<p align="center">
						<img src="images/de2.jpg" width="746" height="425" /><br /> <br />
						<img src="images/de3.jpg" width="750" height="417" /><br /> <br />
						<img src="images/de4.jpg" width="750" height="409" /><br /> <br />
						<img src="images/de5.jpg" width="750" height="409" />
					</p>

				</div>
			</div>

			<div class="des_border" id="p_comment">
				<div class="des_t">商品评论</div>

				<table border="0" class="jud_tab" cellspacing="0" cellpadding="0">
					<tr>
						<td width="175" class="jud_per">
							<p>80.0%</p>好评度
						</td>
						<td width="300">
							<table border="0" style="width: 100%;" cellspacing="0"
								cellpadding="0">
								<tr>
									<td width="90">好评<font color="#999999">（80%）</font></td>
									<td><img src="images/pl.gif" align="absmiddle" /></td>
								</tr>
								<tr>
									<td>中评<font color="#999999">（20%）</font></td>
									<td><img src="images/pl.gif" align="absmiddle" /></td>
								</tr>
								<tr>
									<td>差评<font color="#999999">（0%）</font></td>
									<td><img src="images/pl.gif" align="absmiddle" /></td>
								</tr>
							</table>
						</td>
						<td width="185" class="jud_bg">
							购买过雅诗兰黛第六代特润精华露50ml的顾客，在收到商品才可以对该商品发表评论</td>
						<td class="jud_bg">您可对已购买商品进行评价<br /> <a href="#"><img
								src="images/btn_jud.gif" /></a></td>
					</tr>
				</table>



				<table border="0" class="jud_list"
					style="width: 100%; margin-top: 30px;" cellspacing="0"
					cellpadding="0">
					<tr valign="top">
						<td width="160"><img src="images/peo1.jpg" width="20"
							height="20" align="absmiddle" />&nbsp;向死而生</td>
						<td width="180">颜色分类：<font color="#999999">粉色</font> <br />
							型号：<font color="#999999">50ml</font>
						</td>
						<td>产品很好，香味很喜欢，必须给赞。 <br /> <font color="#999999">2015-09-24</font>
						</td>
					</tr>
					<tr valign="top">
						<td width="160"><img src="images/peo2.jpg" width="20"
							height="20" align="absmiddle" />&nbsp;就是这么想的</td>
						<td width="180">颜色分类：<font color="#999999">粉色</font> <br />
							型号：<font color="#999999">50ml</font>
						</td>
						<td>送朋友，她很喜欢，大爱。 <br /> <font color="#999999">2015-09-24</font>
						</td>
					</tr>
					<tr valign="top">
						<td width="160"><img src="images/peo3.jpg" width="20"
							height="20" align="absmiddle" />&nbsp;墨镜墨镜</td>
						<td width="180">颜色分类：<font color="#999999">粉色</font> <br />
							型号：<font color="#999999">50ml</font>
						</td>
						<td>大家都说不错<br /> <font color="#999999">2015-09-24</font>
						</td>
					</tr>
					<tr valign="top">
						<td width="160"><img src="images/peo4.jpg" width="20"
							height="20" align="absmiddle" />&nbsp;那*****洋 <br /> <font
							color="#999999">（匿名用户）</font></td>
						<td width="180">颜色分类：<font color="#999999">粉色</font> <br />
							型号：<font color="#999999">50ml</font>
						</td>
						<td>下次还会来买，推荐。<br /> <font color="#999999">2015-09-24</font>
						</td>
					</tr>
				</table>



				<div class="pages">
					<a href="#" class="p_pre">上一页</a><a href="#" class="cur">1</a><a
						href="#">2</a><a href="#">3</a>...<a href="#">20</a><a href="#"
						class="p_pre">下一页</a>
				</div>

			</div>
		</div>
	</div>


	<!--Begin 弹出层-收藏成功 Begin-->
	<div id="fade" class="black_overlay"></div>
	<div id="MyDiv" class="white_content">
		<div class="white_d">
			<div class="notice_t">
				<span class="fr" style="margin-top: 10px; cursor: pointer;"
					onclick="CloseDiv('MyDiv','fade')"><img
					src="images/close.gif" /></span>
			</div>
			<div class="notice_c">

				<table border="0" align="center" style="margin-top:;"
					cellspacing="0" cellpadding="0">
					<tr valign="top">
						<td width="40"><img src="images/suc.png" /></td>
						<td><span
							style="color: #3e3e3e; font-size: 18px; font-weight: bold;">您已取消收藏该商品</span><br />
						</td>
					</tr>
					<tr height="50" valign="bottom">
						<td>&nbsp;</td>
						<td><a href="deleteFavorite.do?gid=${detail.gid}"
							class="b_sure">确定</a></td>
					</tr>
				</table>

			</div>
		</div>
	</div>
	<!--End 弹出层-收藏成功 End-->



	</div>
</body>


<%@ include file="Footer.jsp"%>

