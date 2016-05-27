<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="js/checkfrom.js"></script>
  </head>
  
  <body>
  <div class="R-CON" style="{position:absolute;bottom:20%;left:15%;}">
  	 <p class="R-Tit" align="center">表单验证</p>
<form action="index.jsp" method="get">
             <table width="500px" border="1" align="center" style="top: 51px; height: 149px;">
             <tr>
                <th align="center">姓名：</th>
                <th><input type="text"  name="username"  autocomplete="off" onblur="checkUserName(this.value.toLowerCase())"/>
                <span id="usernameErr"></span></th>               
              </tr>
              <tr>
                <th align="center">身份证：</th>
                <th><input type="text"  name="idnum" onblur="IdCardRegCheck(this.value)" autocomplete="off"/>
                <span id="idnumErr"></span></th>               
              </tr>
              <!-- <tr>
                <th align="center">身份证(复杂)：</th>
                <th><input type="test"  name="idcard" onblur="checkIdcard(this.value)" autocomplete="off"/>
                <span id="idcardErr"></span></th>               
              </tr> -->
              <tr>
                <th align="center">手机：</th>
                <th><input type="text"  name="moblie" onblur="checkPhone(this.value.toLowerCase())" autocomplete="off"/>
                <span id="mobileErr"></span></th>               
              </tr>
              <tr>
                <th align="center">年龄：</th>
                <th><input type="text" name="age" onblur="checkAge(this.value.toLowerCase())" autocomplete="off"/>
                <span id="ageErr"></span></th>               
              </tr>
            <tr>
                <th align="center">姓名(中文)：</th>
                <th><input type="text" name="name" onblur="checkName(this.value.toLowerCase())" autocomplete="off"/>
                <span id="nameErr"></span></th>               
              </tr>
              <tr>
                <th align="center">邮箱：</th>
                <th><input type="text" name="email" onblur="checkEmail(this.value.toLowerCase())" autocomplete="off"/>
                <span id="emailErr"></span></th>               
              </tr>
              <tr>
                <td align="center" colspan="2">
                <input type="submit" value="提交"/>&ensp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="reset" value="重置"/>
                </td>
               
            </table>
</form>
           
          
        </div>
        </body>
</html>
