<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
.update{
	background:url("images/upadte.png") no-repeat;width:80px;height:20px;border:0px;margin-right:0px;padding-bottom:70px
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
        
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>    
        <script type="text/javascript" src="js/jsAddress.js"></script>
	<script type="text/javascript" src="js/select.js"></script>
        
    
<title>尤洪</title>
</head>
<body>  
<%@ include file="header.jsp"%>
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
   	<%@ include file="LeftMenu.jsp"%>
		<div class="m_right">

            <div class="mem_tit">
            	<input type="submit" value="地址管理"  />
            </div>
            </body>
            <form action="address.do">
            <input type="hidden" name="op" value="update"/>
            <input type="hidden" name="addrid" value="${param.addrid}"/>
            <table border="0" class="add_tab" style="width:930px;"  cellspacing="0" cellpadding="0">
              <tr>
                <td width="135" align="right">配送地区</td>
                <td colspan="3" style="font-family:'宋体';">
                	<select id="cmbProvince" name="cmbProvince"></select>
						<select id="cmbCity" name="cmbCity"></select>
						<select id="cmbArea" name="cmbArea"></select>
 
 
			   <script type="text/javascript">
					addressInit('cmbProvince', 'cmbCity', 'cmbArea');
			   </script>

                	
                    （必填）
                </td>
              </tr>
              <tr>
                <td align="right">收货人姓名</td>
                <td style="font-family:'宋体';"><input type="text"   name="receiver" value="${list1.receiver}" class="add_ipt" />（必填）</td>
                <td align="right">电子邮箱</td>
                <td style="font-family:'宋体';"><input type="text" name="email" value="${list1.email}"class="add_ipt" />（必填）</td>
              </tr>
              <tr>
                <td align="right">详细地址</td>
                <td style="font-family:'宋体';"><input type="text" name="area" value="${list1.area}" class="add_ipt" />（必填）</td>
                <td align="right">邮政编码</td>
                <td style="font-family:'宋体';"><input type="text" name="emailid" value="${list1.emailid}" class="add_ipt" /></td>
              </tr>
              <tr>
                <td align="right">手机</td>
                <td style="font-family:'宋体';"><input type="text" name="phone" value="${list1.phone}" class="add_ipt" />（必填）</td>
                <td align="right">电话</td>
                <td style="font-family:'宋体';"><input type="text" name="tel" value="${list1.tel}" class="add_ipt" /></td>
              </tr>
              <tr>
                <td align="right">标志建筑</td>
                <td style="font-family:'宋体';"><input type="text" name="building" value="${list1.building}" class="add_ipt" /></td>
                
              </tr>
            </table>
            
           	<p align="right">
           
           	
           	
            
            <input type="submit" value="" class="update"/>
            <a href="address.do?op=SelectAddress" >
            	<img src="images/return.png" style="padding-top:20px;margin-top:30px"></img>
            </a>
            </p> 
           </form>
           
           
             
           <c:if test="${! empty param.msg}">
	       <script>
		        alert("修改成功");
	       </script>
	    </c:if>
	    
	    <c:if test="${! empty param.error}">
	       <script>
		        alert("修改失败");
	       </script>
	    </c:if>

            
        </div>
    </div>
	<!--End 用户中心 End--> 
<%@ include file="Footer.jsp" %>
    