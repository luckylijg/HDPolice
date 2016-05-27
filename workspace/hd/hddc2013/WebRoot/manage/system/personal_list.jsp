<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	
<link rel="stylesheet" type="text/css" href="${ctx }/css/Admin.css" />

  </head>
  
  <body  style="{background-color:#F0F0F0}">
<div class="R-CON" style="{position:absolute;top:5%;left:18%}"> 
       <table width="100%" border="2" style="BORDER-COLLAPSE:collapse" cellspacing="0">
          <tr align="center">
            <td height="40" colspan="4"><span class="style1">个人信息</span></td>			
          </tr>
          <tr>
    
            <td width="15%" align="center" nowrap><span class="style3">用户名</span></td>
            <td align="center">${user.username }</td>
           <td width="15%" align="center" ><span class="style3">警员编号</span></td>
			<td width="35%" align="center">${user.sno }</td>
          </tr>
          <tr>
           <td width="15%" align="center" nowrap><span class="style3">姓名</span></td>
            <td width="35%" align="center">${user.realname }</td>
            
			<td width="15%" align="center" nowrap><span class="style3">性别</span></td>
            <td width="35%" align="center">${user.sex==0?"男":"女" }</td>
          </tr>
        <tr>
            
            <td width="15%" align="center" ><span class="style3">生日</span></td>
			<td width="35%" align="center">  <fmt:formatDate value="${user.birthday }" type="date"/></td>
			<td width="15%" align="center" nowrap><span class="style3">手机</span></td>
            <td width="35%" align="center">${user.mobile }</td>
          </tr>
         
          <tr>
            
            
			<td width="15%" align="center" nowrap><span class="style3">职务</span></td>
            <td width="35%" align="center">${user.job }</td>
			<td width="15%" align="center" nowrap><span class="style3">单位</span></td>
            <td width="35%" align="center">
            ${depart.name}
            </td>
          </tr>
          <tr>
          
          <td colspan="4" class="td_a" align="center">
			<input name="save" type="button" class="button"  style="cursor:hand" value="修&nbsp;改" 
			onClick="window.location.href='${ctx }/manage/system/user!personaledit.action'"></td>
          </tr>          
     </table>	
</div>
</body>
</html>
