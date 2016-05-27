<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
    
	<link rel="stylesheet" type="text/css" href="${ctx }/css/Admin.css" />

  </head>
  
  <body>
    <div class="R-CON" align="center">
    <br><br>
   <table width="100%" border="1" style="BORDER-COLLAPSE:collapse;width: 65%;" cellspacing="0" >
    <tr>
    <th width="20%">案件编号：</th><td>${complaint.sno }</td>
    </tr>
    <tr>
    <th>反馈人：</th><td>${user.realname }</td>
    </tr>
	<tr>
	   

<th>所属部门：</th><td>${department.name }</td>


</tr> 
     <tr height="200px;">
     <th>信<br>息<br>反<br>馈</th>
  
   <td >
   ${fd.message }
   </td>
   </tr>
    
    
    </table>
    </div>
  </body>
</html>
