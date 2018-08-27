<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
.add_b1{
	background:url("images/z_add.png");width:120px;height:35px;border:0px;margin-right:20px 
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
    <script type="text/javascript">
    function rdelete(addrid){
		var r=confirm('是否确定删除?');
		if(r==true){
			location.href='address.do?op=delete&addrid='+addrid;
		}
	}
    
    
    </script>   
  	      
    
<title>尤洪</title>
</head>
<body>  


<%@ include file="header.jsp"%>
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
   	<%@ include file="LeftMenu.jsp"%>
		<div class="m_right">
            <p></p>
            <div class="mem_tit">收货地址</div>
			<div class="address">
            	<div class="a_close"><a href="#"><img src="images/a_close.png" /></a></div>
            	
            	<table border="0" class="add_t" align="center" style="width:98%; margin:10px auto;" cellspacing="0" cellpadding="0">
                  
                  <c:forEach items="${list}" var="address">
                  <tr>
                    <td><a href="address.do?op=SelectAddressByAddrId&addrid=${address.addrid}">地址${address.addrid}</a></td>
                  
                  <td><A href="javascript:rdelete(${address.addrid})">[删除]</A></td>
                
                  </tr>
                  </c:forEach>
                </table>
				
                
            </div>

            <div class="mem_tit">
            	<a href="#"><img src="images/add_ad.gif" /></a>
            </div>
            </body>
            <form action="address.do">
            <input type="hidden" name="op" value="add"/>
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
                <td style="font-family:'宋体';"><input type="text"   name="receiver" class="add_ipt" />（必填）</td>
                <td align="right">电子邮箱</td>
                <td style="font-family:'宋体';"><input type="text" name="email" class="add_ipt" />（必填）</td>
              </tr>
              <tr>
                <td align="right">详细地址</td>
                <td style="font-family:'宋体';"><input type="text" name="area" class="add_ipt" />（必填）</td>
                <td align="right">邮政编码</td>
                <td style="font-family:'宋体';"><input type="text" name="emailid" class="add_ipt" /></td>
              </tr>
              <tr>
                <td align="right">手机</td>
                <td style="font-family:'宋体';"><input type="text" name="phone" class="add_ipt" />（必填）</td>
                <td align="right">电话</td>
                <td style="font-family:'宋体';"><input type="text" name="tel" class="add_ipt" /></td>
              </tr>
              <tr>
                <td align="right">标志建筑</td>
                <td style="font-family:'宋体';"><input type="text" name="building" class="add_ipt" /></td>
                
              </tr>
            </table>
            
           	<p align="right">
           	
           	<td><input type="submit" value="" class="add_b1" sylte="color:#ffffff"/></td>
          
            </p> 
           </form>
        <c:if test="${! empty param.msg1}">
	       <script>
		        alert("添加成功");
	       </script>
	    </c:if>
	    
	    <c:if test="${! empty param.error1}">
	       <script>
		        alert("添加失败");
	       </script>
	    </c:if>
	    <c:if test="${! empty param.msg}">
	       <script>
		        alert("删除成功");
	       </script>
	    </c:if>
	    
	    <c:if test="${! empty param.error}">
	       <script>
		        alert("删除失败");
	       </script>
	    </c:if>
	    
            
        </div>
    </div>
	<!--End 用户中心 End--> 
<%@ include file="Footer.jsp" %>
    