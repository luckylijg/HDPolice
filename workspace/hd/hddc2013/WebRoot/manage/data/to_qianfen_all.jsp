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
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="js/jquery1.js"></script>
    <script type="text/javascript" src="js/search.js"></script>
      <script type="text/javascript">
	function change_target(){
		form119.target="_self";
		document.getElementById("temp").value=1;
	}
</script>
  </head>
 <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
	String time = sdf.format( new Date() );
	 String str1=time.substring(0,4);	 
	 int a=Integer.parseInt(str1);
	 %>
  <body>
  <br>
   <div align="center"> 
  <span align="center"><font size="5"><c:if test="${year==0 }">查询各单位千分制考核明细表 </c:if >
  <c:if test="${year!=0 }">${year }年${month }月份${dename }千分制考核明细表</c:if></font></span> 
   </div>


     <div class="R-CON">
     <form  id="from119" action="manage/data/department!qianfenall.action" method="post" >
<table  style="width:89%;" align="center">
 				
  		<td width="70%"><select name="year">
  					
						 <c:forEach var="i" begin="2009" end="${newYear }">
						<option value="${i}" <c:if test="${i==param.year}">selected</c:if>>${i }</option>
						</c:forEach>
  					
  				</select>年		
  		<select name="month">
  						<c:forEach var="i" begin="1" end="12">
						<option value="${i}" <c:if test="${i==param.month}">selected</c:if>>${i }</option>
						</c:forEach>
  					</select>月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		</td>
		
  		<td width="30%"><input type="submit" value="统计" class="btn"/>

	  			</td>
     </table>  
     </form> 
    
</div>
</body>
</html>
