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
    
    <title>My JSP 'module_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	

  </head>
  
  <body><div style="{position:absolute;top:1%;right:11%;}">
  <a href="${ctx }/manage/system/module!inAdd.action"><img src="${ctx }/images/add.png"></a>
  </div>
  <div class="R-CON" align="center">
  <p class="R-Tit">模块列表</p>
  
  <table border="1"  width="100%" style="width: 80%">

	<tr>
	<th width="12%">模板编号</th>
	<th width="25%">模板名</th>
	<th width="48%">模板链接</th>
	<th width="15%">操作</th>
	</tr>

  
  <c:forEach items="${list }" var="module" varStatus="i">
  <tr >
   <td>${module.moduleid }</td>
   <td >${module.name}</td>
   <td >${module.link }</td>
   <td >
   <a href="${ctx }/manage/system/module!edit.action?moduleid=${module.moduleid }"><img src="${ctx}/images/edit.gif" title="编辑"></a>&nbsp;|&nbsp;
   <a href="${ctx }/manage/system/module!delete.action?moduleid=${module.moduleid}" onclick="return confirm('确定要删除吗？')"><img src="${ctx}/images/delete.gif" title="删除"></a>

   </td>
  </tr>
  </c:forEach>
  </table>
  <br><br>
  </div>
  </body>
</html>
