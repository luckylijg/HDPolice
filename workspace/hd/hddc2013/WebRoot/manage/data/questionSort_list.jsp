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
  
  <body><div style="{position:absolute;top:1%;right:16%;}">
   <a href="${ctx }/manage/data/questionSort!inAdd.action"><img src="${ctx }/images/add.png"></a></div>
  <div class="R-CON" align="center">
  	
  	 <p class="R-Tit" align="center">问题列表</p>
           
             <table width="100%" border="1" align="center">
              <tr>
                <th>问题ID</th>
                <th>问题名称</th>
                <th>描述</th>
                <th>操作</th>
              </tr>
              <c:forEach items="${pager.list }" var="questionSort" varStatus="i">
              <tr>
                <td>${questionSort.questionsortid }</td>
                <td>${questionSort.name }</td>
                <td>${questionSort.description }</td>
                <td align="center">

                <a href="${ctx }/manage/data/questionSort!edit.action?questionsortid=${questionSort.questionsortid }"><img src="${ctx}/images/edit.gif" title="编辑"></a>&nbsp;|
                <c:if test="${questionSort.complaints.size()>0 }"><img src="${ctx}/images/not.png" title="不能删除"></c:if>
  					<c:if test="${questionSort.complaints.size()==0 }">
  					<a href="${ctx }/manage/data/questionSort!delete.action?questionsortid=${questionSort.questionsortid }" onclick="return confirm('确定要删除吗？')"><img src="${ctx}/images/delete.gif" title="删除"></a></c:if>
  					</td>
              </tr>
              </c:forEach>
            </table>
<br>
           <jsp:include page="/commons/multipages.jsp"></jsp:include>
        </div>
        </body>
</html>
