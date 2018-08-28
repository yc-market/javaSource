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
		}, function(attribute1) {
			$("#price").html(attribute1.price);
			$("#sizeid").val(attribute1.sizeid);
		});

	}
    $(function(){
    	$("#test li").click(function(){
    		
    		$(this).siblings('li').removeClass("checked");
    		
    		$(this).addClass("checked");
        });
    });
	    
	    $(function(){
	    	$("#test1 li").click(function(){
	    		
	    		$(this).siblings('li').removeClass("tsSelectImg");
	    		
	    		$(this).addClass("tsSelectImg");
	        });
	    });
	    
	    
    </script>
    <script type="text/javascript">

function deleteFavorite(gid){
	$.ajax({
		type:"post",
		contentType:"application/json",  
		url:"deleteFavorite.do?gid="+gid,
		success:function (data) {			
			/* var data = eval('('+data+')'); */
			console.log(data);
			if(data){
				ShowDiv('MyDiv2','fade2')
			}else{
				
			}
		},
		error:function(data){
			alert("error");
		}
	});
}
function addCart(){
	
	var price=$("#price").val();
	var count=$("#goodscount").val();
	var sizeid=$("#sizeid").val();
	$.post("ajax_addCart.do",{sizeid:sizeid,count:count},function(data){
		$("#cars").prepend(data);
		$("#total").text(parseInt($("#total").text())+1);
		$("#totalMoney").text(parseInt($("#totalMoney").text())+price);
		
		ShowDiv_1('MyDiv1','fade1');
		
	});
	//alert("添加成功");
}


function addFavorite(gid){
	$.ajax({
		type:"post",
		contentType:"application/json",  
		url:"addFavorite.do?gid="+gid,
		success:function (data) {			
			/* var data = eval('('+data+')'); */
			console.log(data);
			if(data){
				ShowDiv('MyDiv','fade')
			}else{
				
			}
		},
		error:function(data){
			alert("error");
		}
	});
}


</script>
    <style type="text/css">
    .d_care_h{
		height:27px; line-height:27px; overflow:hidden; background:url(images/heart.png) no-repeat left center; float:left; display:inline; margin-left:50px; padding-left:22px;
	}
	.d_care_f{
		height:27px; line-height:27px; overflow:hidden; background:url(images/heart_h.png) no-repeat left center; float:left; display:inline; margin-left:50px; padding-left:22px;
	}
    </style>
<title>尤洪</title>
</head>
<body>  

<%@ include file="IndexHeader.jsp"%>
<%@ include file="Menu_none.jsp"%>
<div class="i_bg">
	<div class="postion">
    	<span class="fl">全部 > 美妆个护 > 香水 > 迪奥 > 迪奥真我香水</span>
    </div>    
    <div class="content">
    	                    
        <div id="tsShopContainer">
            <div id="tsImgS"><a href="upload/rawImages/${i.imgname}" title="Images" class="MagicZoom" id="MagicZoom"><img src="upload/rawImages/${i.imgname}" width="390" height="390" /></a></div>
            <div id="tsPicContainer">
                <div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
                <div id="tsImgSCon">
                	<c:forEach items="${image}" var="image">
                    <ul id="test1">
                         <li onclick="showPic(0)" rel="MagicZoom" class="tsSelectImg"><img src="images/ps1.jpg" tsImgS="images/ps1.jpg" width="79" height="79" /></li> 
                        <%-- <li onclick="showPic(${image.imgid})" rel="MagicZoom" class="SelectImg"><img src="upload/rawImages/${image.imgname}" tsImgS="upload/rawImages/${image.imgname}" width="79" height="79" /></li> --%>
                        <li onclick="showPic(2)" rel="MagicZoom"><img src="images/ps3.jpg" tsImgS="images/ps3.jpg" width="79" height="79" /></li>
                        <li onclick="showPic(3)" rel="MagicZoom"><img src="images/ps4.jpg" tsImgS="images/ps4.jpg" width="79" height="79" /></li>
                        <li onclick="showPic(4)" rel="MagicZoom"><img src="images/ps1.jpg" tsImgS="images/ps1.jpg" width="79" height="79" /></li>
                        <li onclick="showPic(5)" rel="MagicZoom"><img src="images/ps2.jpg" tsImgS="images/ps2.jpg" width="79" height="79" /></li>
                        <li onclick="showPic(6)" rel="MagicZoom"><img src="images/ps3.jpg" tsImgS="images/ps3.jpg" width="79" height="79" /></li>
                        <li onclick="showPic(7)" rel="MagicZoom"><img src="images/ps4.jpg" tsImgS="images/ps4.jpg" width="79" height="79" /></li>
                    </ul>
                    </c:forEach>
                </div>
                <div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
            </div>
            <img class="MagicZoomLoading" width="16" height="16" src="images/loading.gif" alt="Loading..." />				
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
           <!--  <div class="des_choice">
            	<span class="fl">颜色选择：</span>
                <ul>
                	<li>红色<div class="ch_img"></div></li>
                    <li class="checked">白色<div class="ch_img"></div></li>
                    <li>黑色<div class="ch_img"></div></li>
                </ul>
            </div> -->
            <div class="des_share">
            	<div class="d_sh">
                	分享
                    <div class="d_sh_bg">
                    	<a href="#"><img src="images/sh_1.gif" /></a>
                        <a href="#"><img src="images/sh_2.gif" /></a>
                        <a href="#"><img src="images/sh_3.gif" /></a>
                        <a href="#"><img src="images/sh_4.gif" /></a>
                        <a href="#"><img src="images/sh_5.gif" /></a>
                    </div>
                </div>
                <c:if test="${! empty loginedUser}">
                	<c:if test="${ empty success}">
                		<div class="d_care_h"><a onclick="addFavorite(${detail.gid})">关注商品</a></div>
                	</c:if>
                	<c:if test="${! empty success}">
                		<div class="d_care_f"><a onclick="deleteFavorite(${detail.gid})">取消关注</a></div>
                	</c:if>
                </c:if>
                <c:if test="${empty loginedUser}">
                	<div class="d_care_h"><a onclick="ShowDiv('MyDiv0','fade0')">关注商品</a></div>
                </c:if>
            </div>
            <div class="des_join">
            	<div class="j_nums">
            	<input id="sizeid" type="hidden"></input>
                	<input id="goodscount" type="text" value="1" name="count" class="n_ipt" />
                    <input type="button" value="" onclick="addUpdate(jq(this));" class="n_btn_1" />
                    <input type="button" value="" onclick="jianUpdate(jq(this));" class="n_btn_2" />   
                </div>
                <!-- 加入购物车   ShowDiv_1('MyDiv1','fade1')-->
                <c:if test="${! empty loginedUser}">
                
                <span class="fl"><a onclick="addCart()"><img src="images/j_car.png" /></a></span>
                </c:if>
                
                <c:if test="${empty loginedUser}">
                <span class="fl"><a onclick="ShowDiv('MyDiv0','fade0')"><img src="images/j_car.png" /></a></span>
                </c:if>
            </div>            
        </div>
        
            
        
        <div class="s_brand">
        	<div class="s_brand_img"><img src="images/sbrand.jpg" width="188" height="132" /></div>
            <div class="s_brand_c"><a href="#">进入品牌专区</a></div>
        </div>    
        
        
    </div>
    <div class="content mar_20">
    	<div class="l_history">
        	<div class="fav_t">用户还喜欢</div>
        	<ul>
            	<li>
                    <div class="img"><a href="#"><img src="images/his_1.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="images/his_2.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>768.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="images/his_3.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>680.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="images/his_4.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="images/his_5.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
        	</ul>
        </div>
        <div class="l_list">        	
            <div class="des_border">
            	<div class="des_tit">
                	<ul>
                    	<li class="current">推荐搭配</li>
                    </ul>
                </div>
                <div class="team_list">
                	<div class="img"><a href="#"><img src="images/mat_1.jpg" width="160" height="140" /></a></div>
                	<div class="name"><a href="#">倩碧补水组合套装8折促销</a></div>
                    <div class="price">
                    	<div class="checkbox"><input type="checkbox" name="zuhe" checked="checked" /></div>
                    	<font>￥<span>768.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="images/jia_b.gif" /></div>
                <div class="team_list">
                	<div class="img"><a href="#"><img src="images/mat_2.jpg" width="160" height="140" /></a></div>
                	<div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                    <div class="price">
                    	<div class="checkbox"><input type="checkbox" name="zuhe" /></div>
                    	<font>￥<span>749.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="images/jia_b.gif" /></div>
                <div class="team_list">
                	<div class="img"><a href="#"><img src="images/mat_3.jpg" width="160" height="140" /></a></div>
                	<div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                    <div class="price">
                    	<div class="checkbox"><input type="checkbox" name="zuhe" checked="checked" /></div>
                    	<font>￥<span>749.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="images/equl.gif" /></div>
                <div class="team_sum">
                	套餐价：￥<span>1517</span><br />
                    <input type="text" value="1" class="sum_ipt" /><br />
                    <a href="#"><img src="images/z_buy.gif" /></a> 
                </div>
                
            </div>
            <div class="des_border">
                <div class="des_tit">
                	<ul>
                    	<li class="current"><a href="#p_attribute">商品属性</a></li>
                        <li><a href="#p_details">商品详情</a></li>
                        <li><a href="#p_comment">商品评论</a></li>
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">
                	
                	<table border="0" align="center" style="width:100%; font-family:'宋体'; margin:10px auto;" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>商品名称：${detail.gname }</td>
                        <td>商品编号：${detail.gid }</td>
                        <!-- <td>品牌： 迪奥（Dior）</td>
                        <td>上架时间：2015-09-06 09:19:09 </td> -->
                      </tr>
                      
                      
                    </table>                                               
                                            
                        
                </div>
          	</div>  
            
            <div class="des_border" id="p_details">
                <div class="des_t">商品详情</div>
                
                <div class="des_con">
                	<table border="0" align="center" style="width:745px; font-size:14px; font-family:'宋体';" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="265"><img src="upload/rawImages/${i.imgname}" width="206" height="412" /></td>
                        <td>
                        	${detail.des}
                        </td>
                      </tr>
                    </table>
                    <c:forEach items="${image}" var="image">
                    <p align="center">
                    <img src="upload/rawImages/${image.imgname}" width="746" height="425" /><br /><br />
                    
					</p>
                    </c:forEach>
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
                    	<table border="0" style="width:100%;" cellspacing="0" cellpadding="0">
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
                    	购买过雅诗兰黛第六代特润精华露50ml的顾客，在收到商品才可以对该商品发表评论
                    </td>
                    <td class="jud_bg">您可对已购买商品进行评价<br /><a href="#"><img src="images/btn_jud.gif" /></a></td>
                  </tr>
                </table>
                
                
                				
                <table border="0" class="jud_list" style="width:100%; margin-top:30px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="160"><img src="images/peo1.jpg" width="20" height="20" align="absmiddle" />&nbsp;向死而生</td>
                    <td width="180">
                    	颜色分类：<font color="#999999">粉色</font> <br />
                        型号：<font color="#999999">50ml</font>
                    </td>
                    <td>
                    	产品很好，香味很喜欢，必须给赞。 <br />
                        <font color="#999999">2015-09-24</font>
                    </td>
                  </tr>
                  <tr valign="top">
                    <td width="160"><img src="images/peo2.jpg" width="20" height="20" align="absmiddle" />&nbsp;就是这么想的</td>
                    <td width="180">
                    	颜色分类：<font color="#999999">粉色</font> <br />
                        型号：<font color="#999999">50ml</font>
                    </td>
                    <td>
                    	送朋友，她很喜欢，大爱。 <br />
                        <font color="#999999">2015-09-24</font>
                    </td>
                  </tr>
                  <tr valign="top">
                    <td width="160"><img src="images/peo3.jpg" width="20" height="20" align="absmiddle" />&nbsp;墨镜墨镜</td>
                    <td width="180">
                    	颜色分类：<font color="#999999">粉色</font> <br />
                        型号：<font color="#999999">50ml</font>
                    </td>
                    <td>
                    	大家都说不错<br />
                        <font color="#999999">2015-09-24</font>
                    </td>
                  </tr>
                  <tr valign="top">
                    <td width="160"><img src="images/peo4.jpg" width="20" height="20" align="absmiddle" />&nbsp;那*****洋 <br /><font color="#999999">（匿名用户）</font></td>
                    <td width="180">
                    	颜色分类：<font color="#999999">粉色</font> <br />
                        型号：<font color="#999999">50ml</font>
                    </td>
                    <td>
                    	下次还会来买，推荐。<br />
                        <font color="#999999">2015-09-24</font>
                    </td>
                  </tr>
                </table>

                	
                    
                <div class="pages">
                    <a href="#" class="p_pre">上一页</a><a href="#" class="cur">1</a><a href="#">2</a><a href="#">3</a>...<a href="#">20</a><a href="#" class="p_pre">下一页</a>
                </div>
                
          	</div>
            
            
        </div>
    </div>
    
    
    <!--Begin 弹出层-收藏成功 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="images/close.gif" /></span>
            </div>
            <div class="notice_c">          		
                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="images/suc.png" /></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">您已成功收藏该商品</span><br />
                    	<!-- <a href="Favorite.do">查看我的关注 >></a> -->
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="Product.do?gid=${detail.gid}" class="b_sure">确定</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-收藏成功 End-->
    <!--Begin 弹出层-收藏成功 Begin-->
    <div id="fade0" class="black_overlay"></div>
    <div id="MyDiv0" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="images/close.gif" /></span>
            </div>
            <div class="notice_c">          		
                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">您尚未登录，请登录</span><br />
                    	<!-- <a href="Favorite.do">查看我的关注 >></a> -->
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="Login.jsp" class="b_sure">确定</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-收藏成功 End-->
    <!--Begin 弹出层-加入购物车 Begin-->
    <div id="fade1" class="black_overlay"></div>
    <div id="MyDiv1" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv_1('MyDiv1','fade1')"><img src="images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="images/suc.png" /></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">宝贝已成功添加到购物车</span><br />
                    	
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="buycar.do?op=ViewShoppingCar" class="b_sure">去购物车结算</a><a href="indexAction.do" class="b_buy">继续购物</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-加入购物车 End-->
     <!--Begin 弹出层-取消收藏 Begin-->
    <div id="fade2" class="black_overlay"></div>
    <div id="MyDiv2" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="images/close.gif" /></span>
            </div>
            <div class="notice_c">          		
                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="images/suc.png" /></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">您已成功取消收藏该商品</span><br />
                    	<!-- <a href="Favorite.do">查看我的关注 >></a> -->
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="Product.do?gid=${detail.gid}" class="b_sure">确定</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-取消收藏 End-->
   
    </div>
</body>


<%@ include file="Footer.jsp" %>

