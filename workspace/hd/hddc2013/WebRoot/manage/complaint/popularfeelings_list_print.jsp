<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="/commons/taglibs.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网络舆情调查登记表_打印</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/Admin_print.css" />
   
  </head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
 
<style media="print"> 
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
<OBJECT id=WebBrowser  classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2  height=0  width=0></OBJECT>
<script language="JavaScript"> 
  function doSaveas(){
  try{
  document.all.WebBrowser.ExecWB(4,1);
   }catch(e){
   }
  }
  function doPrintSetup(){
  try{
  document.all.WebBrowser.ExecWB(8,1);
   }catch(e){
    alert("您的浏览器版本不支持网页打印设置");
   }
  }
  function doPrintPreview(){
  try{
  document.all.WebBrowser.ExecWB(7,1);
   }catch(e){
    alert("您的浏览器版本不支持网页打印预览");
   }
  }
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
  <div class="R-CON" align="center">   
  <p class="R-Tit" align="center">网络舆情调查登记表</p>
    <table border="1" style="BORDER-COLLAPSE:collapse;width: 90%;" cellspacing="0" >
  
  <tr>
    <th align="center" nowrap width="6%">序号</th>
    <th align="center" nowrap width="24%">涉及单位</th>
    <th align="center" nowrap width="22%">涉及人员</th>
    <th align="center" nowrap width="24%">问题分类</th>
    <th align="center" nowrap width="6%">扣分</th>
    <th align="center" nowrap width="7%">审核</th>
  </tr>

 <c:forEach items="${list }" var="com" varStatus="i">
 <c:if test="${(i.index)%25==0&&i.index!=0 }"></table>
 
 <div class="PageNext">&nbsp;</div>
 <table border="1" style="BORDER-COLLAPSE:collapse;" cellspacing="0" align="center">
  
  <tr>
    <th align="center" nowrap width="6%">序号</th>
    <th align="center" nowrap width="24%">涉及单位</th>
    <th align="center" nowrap width="22%">涉及人员</th>
    <th align="center" nowrap width="24%">问题分类</th>
    <th align="center" nowrap width="6%">扣分</th>
    <th align="center" nowrap width="7%">审核</th>
  </tr>
  </c:if>
  
  <tr>
    <td align="center">${i.index + 1  }</td>
    <td align="center"><c:forEach items="${com.departments }" var="dep" varStatus="j">
    		${dep.name }&nbsp;&nbsp;
    	</c:forEach>
    </td>
    <td align="center">${com.people }</td>
    <td align="center">
	<c:forEach items="${com.questionSorts }" var="que" varStatus="j">${que.name }&nbsp;</c:forEach>
	</td>
    <td align="center">${com.score }</td>
    <td align="center">
    	<c:if test="${com.leaderapproved >5}">
	    	草稿
    	</c:if>
    	<c:if test="${com.leaderapproved <5}">
    		<c:if test="${com.leaderapproved == 2}">未通过</c:if>
	    	<c:if test="${com.leaderapproved == 1}">通过</c:if>
    	</c:if>
    </td>
  </tr>
  </c:forEach>
  
</table>
    </div>
      <div style="{position:absolute;right:6%;}"><br>
	<font size="5"><strong><font>邯郸市公安局交通警察支队警务督察处</font></strong></font>
	</div> <br> <br>
</body>
</html>
