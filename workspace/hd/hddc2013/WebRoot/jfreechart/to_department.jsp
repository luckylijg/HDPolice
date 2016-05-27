<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ page import="java.text.SimpleDateFormat"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'to_department.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="js/jquery1.js"></script>
    <script type="text/javascript" src="js/search.js"></script>
    <script type="text/javascript" src="js/time.js"></script>
    <script type="text/javascript" src="js/depart.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  
  </head>
  
  <body>
    <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
	String time = sdf.format( new Date() );
	 String str1=time.substring(0,4);	 
	 int a=Integer.parseInt(str1);
	 %>
  <p class="R-Tit" align="center">各单位预警信息柱状统计图</p>

  <div class="R-CON" align="center" >
  
  <form  action="jfreechart/department!searchList.action" method="post" style="display:block;">
  <table  width="100%">
  		<tr><td colspan="3">
 		<input type="radio" name="condition" value="0" checked onclick="check(this)"/>年&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="radio" name="condition" value="1" onclick="check(this)"/>半年&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="radio" name="condition" value="2" onclick="check(this)"/>季度&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="radio" name="condition" value="3" onclick="check(this)"/>月</td></tr>		
  		<tr>
  			<td>
  				<select id="0" name="year1">
  					<option value="<%=a %>"><%=a %></option>
  					<% for(int i=1;i<a-2008;i++){%>
 						<option value="<%=a-i %>"><%=a-i %></option>
									 <% } %>
  				</select>&nbsp;年
  				<span id="1" style="{display:none}" >
  				<select name="bannian">
  					
  					<option value="0">上</option>
  					<option value="1">下</option>
  				</select>&nbsp;半年
  				</span>
  				<span id="2" style="{display:none}" >&nbsp;&nbsp;&nbsp;
  				第<select name="jidu">
  					
  					<option value="0">一</option>
  					<option value="1">二</option>
  					<option value="2">三</option>
  					<option value="3">四</option>
  				</select>&nbsp;
  				</span>
  				<span id="3" style="{display:none}" >
  				<select name="month">
  					
  					<% for(int i=1;i<13;i++){%>
 						<option value="<%=i %>"><%=i %></option>
									 <% } %>
  				</select>&nbsp;月
  				</span>
  			</td>
  			<td>单位类型
  			<select name="deptype">
  			<option value="1">大队</option>
  			<option value="2">科室</option>
  			<option value="3">全部</option>
  			</select>
  			</td>

  		<td width="30%"><input type="submit" value="统计" class="btn" onclick="changeState(1)"/>

	  			</td>
  
  </table></form><br/>
  </body>
</html>
