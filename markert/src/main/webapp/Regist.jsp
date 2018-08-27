<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
	
	<link rel="stylesheet" type="text/css" href="/market/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/market/easyui/themes/icon.css">
<script type="text/javascript" src="/market/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/market/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/market/easyui/locale/easyui-lang-zh_CN.js"></script>
<Link rel="stylesheet" type="text/css" href="style/style.css"/>
	
    
    
<title>尤洪</title>
</head>
<body>  

<script type="text/javascript">
      var i=0;
      function refreshVC(){
    	  a.src="/market/vc.s?a="+(i++);
      }
      
      
      function setIdentity(){
      	//判断checkbox有没有被选中
      	if(document.getElementById("businessman").checked==true)
      	{
      		document.getElementById("businessman").value="1";
      
      		
      	}else
      	{	
      		document.getElementById("businessman").value="0";
      		
      	}

      }
      

      function check(){
    	//判断checkbox有没有被选中
    	if(document.getElementById("ch").checked==true)
    	{
    		document.getElementById("zc").disabled="";//给BUTTON按钮的disabled属性赋值
    		document.getElementById("zc").style="";
    		
    	}else
    	{	
    		document.getElementById("zc").style="color:#2F4F4F";
    		document.getElementById("zc").disabled="disabled";
    		
    	}

    }
</script>


<!--Begin Header Begin-->
<div class="soubg">
	<div class="sou">
        <span class="fr">
        	<span class="fl">你好，请<a href="Login.jsp">登录</a>&nbsp; <a href="Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp; </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg">	
    <div class="top">
        <div class="logo"><a href="Index.jsp"><img src="images/logo.png" /></a></div>
    </div>
	<div class="regist">
    	<div class="log_img"><img src="images/l_img.png" width="611" height="425" /></div>
		<div class="reg_c">
		
		
		
		
        	<form action="user.do">
        	<input type="hidden" name="op" value="reg">
            <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="95">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">注册</span>
                    <span class="fr">已有商城账号，<a href="Login.jsp" style="color:#ff4e00;">我要登录</a></span>
                </td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;用户名 &nbsp;</td>
                <td><input type="text" name="uname" class="l_user" /></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                <td><input type="password" name="upass" class="l_pwd" /></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                <td><input type="password" name="upass1" class="l_pwd" /></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;邮箱 &nbsp;</td>
                <td><input type="text" name="email" class="l_email" /></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;手机 &nbsp;</td>
                <td><input type="text" name="phone" class="l_tel" /></td>
              </tr>
              <tr height="50">
                <td align="right">邀请人会员名 &nbsp;</td>
                <td><input type="text" name="invitor" class="l_mem" /></td>
              </tr>
              <tr height="50">
                <td align="right">邀请人ID号 &nbsp;</td>
                <td><input type="text" name="invitid" class="l_num" /></td>
              </tr>
              <tr height="50">
                <td align="right"> <font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;</td>
                <td>
                    <input name="vcode" class="l_ipt" />
                    <!-- <a href="#" style="font-size:12px; font-family:'宋体';">换一张</a> -->
                    <img id="a" alt="无图片" src="vc.do" height="40px" align="middle" onclick="refreshVC()"><br>
                </td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" id="ch" onclick="check()"/></label><label class="r_txt">我已阅读并接受《用户协议》</label>
                    </span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input id="businessman" type="checkbox" name="identity" value="0" onclick="setIdentity()"/></label><label class="r_txt">注册为商家</label>
                    </span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>										<!--   设置按钮不可按    只有勾选了协议才能按               -->
                <td><input type="submit" value="立即注册" class="log_btn" disabled="disabled" id="zc" style="color:#2F4F4F"/></td>
              </tr>
            </table>
            </form>
            <%if(request.getAttribute("msg")!=null){ %>
				<font color="red"><%=request.getAttribute("msg") %></font>
			<%} %>
        </div>
    </div>
</div>
<!--End Login End--> 
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
        <img src="images/b_1.gif" width="98" height="33" /><img src="images/b_2.gif" width="98" height="33" /><img src="images/b_3.gif" width="98" height="33" /><img src="images/b_4.gif" width="98" height="33" /><img src="images/b_5.gif" width="98" height="33" /><img src="images/b_6.gif" width="98" height="33" />
    </div>    	
</div>
<!--End Footer End -->    
	<c:if test="${! empty ok}">
	<script>
		alert("注册成功");
	</script>
	</c:if>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>