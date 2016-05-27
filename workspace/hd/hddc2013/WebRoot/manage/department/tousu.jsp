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
<script type="text/javascript">
function back()  
{  
history.go(-1); //后退1页  
}  
 
</script>
  </head>

  <body><br><br>
<%-- <form action="${ctx }/manage/complaint/popularFeelings!listprint.action" method="post" target="_new"> --%>
<form action="${ctx }/manage/department/tousu_print.jsp" method="post" target="_new">
 	<table width="1%" border="0" cellspacing="0" cellpadding="0" align="right">
        <tr align="center"> 
          <td style="{position:absolute;top:3%;right:3%;}"><input type="submit" value="  打印   "></td>          
        </tr>
      </table>
      </form>
      
       <div style="{position:absolute;top:7%;left:4%;}">
  <input type="image" onclick="back()" src="${ctx }/images/back.png"/>  
</div>

   <div align="center" class="R-CON"> 
  <span align="center"><font size="5">举报投诉</font></span> 
	<span style="{position:absolute;top:8%;right:6%;}"><font size="3">总数：${list2.size() }</font></span>
  <table style="width:92%;" border="1" cellspacing="0" cellpadding="0" align="center">   
    <tr>
      <th style="width:7%">编号</th>
      <th style="width:7%">时间</th>
      <th style="width:40%">涉及人员</th>
      <th style="width:40%">问题类别</th>
      <th style="width:6%">扣分</th>
    </tr>
    <tr>
      <c:forEach items="${list2}" var="complaint" varStatus="i" >
       	<tr>
       	<td><a href="${ctx }/manage/complaint/audit!auditShow.action?complaintid=${complaint.complaintid}">${complaint.sno }</a></td>
       	<td><fmt:formatDate value="${complaint.time }" type="date"/></td>
		<td>${complaint.people }</td>
       	<td><c:forEach items="${complaint.questionSorts }" var="question">
       			${question.name }
       		</c:forEach></td>
       		<td>${complaint.score }</td>
       	
       	</tr>
       </c:forEach>
    </tr>
  </table>
  </div>
</body>
</html>
