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
	<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx }/js/qianfen.js"></script>
<script type="text/javascript">
function back()  
{  
history.go(-1); //后退1页  
}  
 
</script>
  </head>

  <body><br>
 &nbsp; &nbsp; &nbsp; &nbsp;<input type="image" onclick="back()" src="${ctx }/images/back.png"/>  <br><br>
       <div style="{position:absolute;top:7%;left:4%;}" >
  <span align="center" sytle="{position:relative;left:50%}"><font size="5"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp; &nbsp;千分制考核扣分总表 </font></span> 


   <div align="center" class="R-CON">
  <%-- <span align="center"><font size="5">举报投诉</font></span> 
	<span style="{position:absolute;top:8%;right:6%;}"><font size="3">总数：${list2.size() }</font></span> --%>
  <table style="width:92%;" border="1" cellspacing="0" cellpadding="0" align="center">   
    <tr>
      <th style="width:4%">序号</th>
      <th style="width:8%">时间</th>
      <th style="width:40%">反映的问题</th>
      <th style="width:40%">查办结果</th>
      <th style="width:4%">扣分</th>
      <th style="width:4%">详情</th>
    </tr>
    <tr>
      <c:forEach items="${departmentnameList}" var="complaint" varStatus="i" >
       	<tr>
       	<input type="hidden" id="${complaint.complaintid }_question_hidden" value="${complaint.question }"/>	
       	<input type="hidden" id="${complaint.complaintid }_investigateresult_hidden" value="${complaint.investigateresult }"/>
       	
       	<td>${i.index+1+offset }</td>
       	<td><fmt:formatDate value="${complaint.time }" type="date"/></td>
		<td><div id="${complaint.complaintid}_question_div">&nbsp;</div></td>
       	<td><div id="${complaint.complaintid }_investigateresult_div">&nbsp;</div></td>
       	<td>${complaint.score }</td>
       	<td><a href="${ctx }/manage/complaint/audit!auditShow.action?complaintid=${complaint.complaintid}"><img alt="详情" src="${ctx }/images/find.png" title="详情"></a></td>
       	</tr>
       </c:forEach>
    </tr>
  </table>
  </div>
  <div id="msg" style="{width:300px;font-size:15;}"></div>
</body>
</html>
