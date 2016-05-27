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
    
    <title>My JSP 'role_module.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx }/css/role_module.css">
	<script type="text/javascript" src="${ctx }/js/role_module.js"></script>

  </head>
  
  <body>
   <p class="R-Tit">&nbsp;&nbsp;&nbsp;&nbsp;这是为角色分配模块的表</p><br>
    <div id="rolediv"><br><br>
    	<table>
    		<c:forEach items="${roles}" var="role" varStatus="i">
    			
    		<tr><td class="roletd" id="${role.roleid}">${role.description }</td></tr>
    		</c:forEach>
    	</table>
    </div>
    <div id="modulediv">
    <table><br><br><br><br>
    <!-- <tr><td>模块</td></tr> -->
    
    
    	
    	<c:forEach items="${modules }" var="module">
    	<c:if test="${module.moduleid<1000 }">
    	<tr>
    	<c:forEach items="${modules }" var="module2">
    	
    	<c:if test="${fn:startsWith(module2.moduleid,module.moduleid)}">
    	<td class="moduletd"><input name="modulecheckbox" id="${module2.moduleid }" type="checkbox" >${module2.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
    	</c:if>
    	
    	</c:forEach></tr></c:if></c:forEach>
    	
    </table>
    </div>
  </body>
</html>
