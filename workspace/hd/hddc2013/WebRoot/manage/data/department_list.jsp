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
  
  <body><div style="{position:absolute;top:1%;right:11%;}">
  <a href="${ctx }/manage/data/department!inAdd.action"><img src="${ctx }/images/add.png"> </a>
  </div>
  <div class="R-CON" align="center">

  	 <p class="R-Tit" align="center">单位列表</p>
           
             <table  border="2" style="BORDER-COLLAPSE:collapse;width: 80%" cellspacing="0"   align="center">
              <tr>
              <th width="10%">ID</th>
                <th>单位类型</th>
                <th>名称</th>
                <th>地址</th>
                <th>电话</th>
                
                <th>操作</th>
              </tr>
              <c:forEach items="${pager.list }" var="department" varStatus="i"> 
              <tr>
              <td>${department.departmentid }</td>
                <td>
                <c:if test="${department.type==-1 }">默认单位</c:if>
                <c:if test="${department.type==0 }">督察单位</c:if>
                <c:if test="${department.type==1 }">涉及单位</c:if>
                </td>
                <td>${department.name }</td>
                <td>${department.address }</td>
                <td>${department.phone }</td>
                
                <td>

                <a href="${ctx }/manage/data/department!edit.action?departmentid=${department.departmentid }"><img src="${ctx}/images/edit.gif" title="编辑"></a>&nbsp;|
                <c:if test="${department.users.size()>0||department.complaints.size()>0||department.complaints_1.size()>0 }"><img src="${ctx}/images/not.png" title="不能删除"></c:if>
  					<c:if test="${department.users.size()==0&&department.complaints.size()==0&&department.complaints_1.size()==0 }">
  					<a href="${ctx }/manage/data/department!delete.action?departmentid=${department.departmentid }" onclick="return confirm('确定要删除吗？')"><img src="${ctx}/images/delete.gif" title="删除"></a></c:if>
                
                </td>
              </tr>
              </c:forEach>
            
            </table>
<br>
            <jsp:include page="/commons/multipages.jsp"/>
</div>
        </body>
</html>
