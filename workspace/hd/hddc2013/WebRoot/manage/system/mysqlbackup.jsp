<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.goldsoft.model.Department" %>
<%@include file="/commons/taglibs.jsp"%>
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
  </head>
 
  <body>
   <div class="R-CON" align="center">
  	 <p class="R-Tit" align="center" style="{width:70% }">数据库备份</p>
          <form id="form1" action="manage/system/mysql!sqlDump.action" method="post">
             <table width="1000px" border="0" style="top: 51px; height: 149px;">
              <tr>
                <td align="center">请输入数据库用户名：</td>
                <td><input type="text"  name="name" autocomplete="off"/></td>               
              </tr>
              <tr>
                <td align="center">请输入数据库密码：</td>
                <td width="40%"><input type="password"  name="pwd" autocomplete="off"/></td>               
              </tr>
              <tr>
                <td align="center">请输入数据库名：</td>
                <td><input type="text"  name="dbname" autocomplete="off"/></td>               
              </tr>
             <div align="center"><strong><font size="3"><span><font color="red">${error }</font></span></font></strong></div>
              <tr>
                <td align="center" valign="middle" colspan="2">
                <input type="submit" value="提交"/>&ensp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="reset" value="重置"/>
                </td>               
            </table>
           </form>
      </div>
 </body>
</html>
