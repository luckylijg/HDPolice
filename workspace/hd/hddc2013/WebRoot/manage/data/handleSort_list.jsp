<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglibs.jsp" %>
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
  <div style="{position:absolute;top:1%;right:16%;}">
  <a href="${ctx }/manage/data/handleSort!inAdd.action"><img src="${ctx }/images/add.png"></a>
  </div>
  <div class="R-CON" align="center">
   <p class="R-Tit" align="center">处理分类</p> 
             <table width="100%" style="BORDER-COLLAPSE:collapse" border="1">
              <tr>
                <th>ID</th>
                <th>处理方式</th>
                <th>描述</th>
                <th>操作</th>
              </tr>
              <c:forEach items="${pager.list }" var="handleSort" varStatus="i">
              <tr>
                <td>${handleSort.handlesortid }</td>
                <td>${handleSort.name }</td>
                <td>${handleSort.description }</td>
                <td align="center">

                <a href="${ctx }/manage/data/handleSort!edit.action?handlesortid=${handleSort.handlesortid }"><img src="${ctx}/images/edit.gif" title="编辑"></a>&nbsp;|
                <c:if test="${handleSort.complaints.size()>0 }"><img src="${ctx}/images/not.png" title="不能删除"></c:if>
  					<c:if test="${handleSort.complaints.size()==0}">
  					<a href="${ctx }/manage/data/handleSort!delete.action?handlesortid=${handleSort.handlesortid }" onclick="return confirm('确定要删除吗？')"><img src="${ctx}/images/delete.gif" title="删除"></a></c:if>
                </td>
              </tr>
              </c:forEach>
            </table>
<br>
           <jsp:include page="/commons/multipages.jsp" ></jsp:include>
        </div>
        </body>
</html>
