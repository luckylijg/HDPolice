<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.goldsoft.model.Department" %>
<%@include file="/commons/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上督察_打印</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/Admin_print.css" />

  </head>

  <body>

<style media="print"> 
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
<OBJECT id=WebBrowser  classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2  height=0  width=0></OBJECT>
<script language="JavaScript"> 
  
  function doPrint(){
  window.print();
  }
  
</script>
<table id="PrintControl" width="100%" border="0" cellspacing="0" cellpadding="0" class="Noprint">
  <tr>
    <td align="right"><table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr align="center"> 
          <td width="20%">&nbsp;</td>
          
          <td width="20%"><input name="bt_Print" type="button" id="bt_Print" onClick="doPrint()" value=" 打 印 "></td>
        </tr>
      </table></td>
  </tr>
  </table>
   <div align="center" class="R-CON"> 
  <span align="center"><font size="5">网上督察</font></span> 
<div style="{position:absolute;right:6%;}"><font size="3">总数：${sessionScope.wangshang_list.size() }</font></div>

  <table style="width:91%;" border="1" cellspacing="0" cellpadding="0" align="center">   
    <tr>
      <th style="width:7%">编号</th>
      <th style="width:12%">时间</th>
      <th style="width:35%">涉及人员</th>
      <th style="width:40%">问题类别</th>
      <th style="width:6%">扣分</th>
    </tr>
    <c:forEach items="${sessionScope.wangshang_list}" var="complaint" varStatus="i" >
    <c:if test="${(i.index)%25==0&&i.index!=0 }"></table>
    <div class="PageNext">&nbsp;</div>
    <table style="width:91%;" border="1" cellspacing="0" cellpadding="0" align="center">   
    <tr>
      <th style="width:7%">编号</th>
      <th style="width:12%">时间</th>
      <th style="width:35%">涉及人员</th>
      <th style="width:40%">问题类别</th>
      <th style="width:6%">扣分</th>
    </tr> </c:if>
    
      
       	<tr>
       	<td>${complaint.sno }</td>
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
  <div style="{position:absolute;right:6%;}"><br>
	<font size="5"><strong><font>邯郸市公安局交通警察支队警务督察处</font></strong></font>
	</div> <br> <br>
</body>
</html>
