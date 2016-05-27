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
	
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />

  </head>
  
  <body><div style="{position:absolute;top:1%;right:16%;}">
  <a href="${ctx }/manage/system/role!inAdd.action"><img src="${ctx }/images/add.png"></a><br>
  </div>	  
  	  <div class="R-CON">
  	  <p class="R-Tit" align="center">角色列表</p>
  	 
           
             <table width="100%" border="1" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <th>角色id</th>
                <th>角色名</th>
                <th>描述</th>
                <th>操作</th>
              </tr>
              <c:forEach items="${list }" var="role" varStatus="i">
              <tr>
                <td>${role.roleid }</td>
                <td>${role.name }</td>
                <td>${role.description }</td>
                <td align="center">
                <a href="${ctx }/manage/system/role!edit.action?roleid=${role.roleid }"><img src="${ctx}/images/edit.gif" title="编辑"></a>&nbsp;|
                <a href="${ctx }/manage/system/role!delete.action?roleid=${role.roleid }" onclick="return confirm('确定要删除吗？')"><img src="${ctx}/images/delete.gif" title="删除"></a>
                </td>
              </tr>
              </c:forEach>
              
            </table>

        </div>
        </body>
</html>
