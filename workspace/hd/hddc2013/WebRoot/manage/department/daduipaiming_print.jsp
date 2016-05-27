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
    
    <title>各大队排名统计表_打印</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/Admin_print.css" />
	<script type="text/javascript" src="js/jquery1.js"></script>
    <script type="text/javascript" src="js/search.js"></script>
     <script type="text/javascript" src="js/paiming.js"></script>

 <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
	String time = sdf.format( new Date() );
	 String str1=time.substring(0,4);	 
	 int a=Integer.parseInt(str1);
	 %>
     
    <style media="print"> 
	.Noprint{display:none;}
	.pageNext{page-break-after: always;}
	</style>
<style type="text/css"> 
body {font-family:宋体;font-size:14px}
th {font-family:宋体;font-size:14px}
td {font-family:宋体;font-size:10px}
.tableborder {
	border: 1px solid #003063;
 
}
.style5 {font-size: 12}
.style8 {font-size: 10px}
</style>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
 
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
<br>
<div align="center"> 
  <span align="center"><font size="5"><c:if test="${year==0 }">各涉及单位千分制考核扣分排名统计表 </c:if >
  <c:if test="${year!=0 }">${year }年${month }月份各涉及单位千分制考核扣分排名统计表</c:if></font></span>  
   </div><br><br>
     
      <div class="R-CON">
       
   <table width="100%" height="279" border="1" cellpadding="0" cellspacing="0" align="center">
  <tr>
  <th>排名</th>
    <th>涉及单位</th>
    <th>扣分</th>
    <th>预警次数</th>
    <th>预警等级</th>
  </tr>
 
  <c:forEach var="department" items="${paimingList}" varStatus="i" > 
   <tr> 
   
         <td>${i.index+1}</td>
          <td> <c:out value="${department.dname}" /> 
          </td>
               
          <td> 
            <c:out value="${department.score}" /> 
          </td> 
          <td>
             <c:out value="${department.cishu}" /> 
          </td>
          
          
  
     <td>
             <c:if test="${department.warning == '0' }">不预警</c:if>
     		 <c:if test="${department.warning == '1' }">黄</c:if>
           	 <c:if test="${department.warning == '2' }">橙</c:if>
           	 <c:if test="${department.warning == 3 }">红</c:if>
     </td>   
   </tr>
</c:forEach> 

</table>
</div>
<div style="{position:absolute;right:6%;}"><br>
	<font size="5"><strong><font>邯郸市公安局交通警察支队警务督察处</font></strong></font>
	</div>
	<br><br>
 </body>
</html>
