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
  <span align="center"><!-- <font size="5"></font> -->
  
  <font size="5"><c:if test="${year==0 }">单位预警信息统计表 </c:if >
  <c:if test="${year!=0 }">${year }年${month }月份预警信息</c:if></font>
  </span> 
 
   </div>
 
 
<%--     <div style="{position:absolute;top:4%;right:7%;}">
  <form id="fromId" action="${ctx }/manage/department/department!printqianfen.action" target="_new">
  <input type="hidden" name="year" value=${param.year }>
  <input type="hidden" name="month" value=${param.month }>
  <input type="hidden" name="departmentName" value=${departmentName }>
  <input type="image" onclick="javascript:docucument.getElementById('fromId').submit();" src="${ctx }/images/print.png"/>  
  </form></div> --%>
  
     <div class="R-CON">
     <form  id="from119" action="manage/department/department!dep_qianfen.action" method="post" >
     <input type="hidden" value="${sessionScope.currentUser.department.departmentid }" name="departmentName">
<table  style="width:89%;" align="center">
<!-- <td width="10%"></td> -->
 		<td width="20%">
 		当前预警：
 <c:if test="${department.description==0 }">
 <font color="green">不预警</font>
 </c:if>
  <c:if test="${department.description==1 }">
<font color="yellow"> 黄</font>
 </c:if>
  <c:if test="${department.description==2 }">
 <font color="orange">橙</font>
 </c:if>
  <c:if test="${department.description==3 }">
 <font color="red">红</font>
 </c:if>
 		
 		</td>		
  		<td width="50%"><select name="year">
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
    
  
 <form  id="fom119" action="manage/department/department!dep_qianfen.action" method="post" >
  <input type="hidden" name="year" value=${param.year }>
  <input type="hidden" name="month" value=${param.month }>
  <input type="hidden" name="departmentName" value=${departmentName }>
  <table style="width:89%;" border="1" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <th>举报投诉</th>
      <th>现场督察</th>
      <th>网上督察</th>
      <th>网络舆情</th>
       <th>总扣分</th>
       <th>总条数</th>
    </tr>
    <tr>
      <td>扣分&nbsp;|&nbsp;条数</td>
      <td>扣分&nbsp;|&nbsp;条数</td>
      <td>扣分&nbsp;|&nbsp;条数</td>
      <td>扣分&nbsp;|&nbsp;条数</td>
       <td rowspan="2">${score2+score3+score4+score5 }分</td>
       <td rowspan="2">${list2.size()+list3.size()+list4.size()+list5.size() }条</td>
    </tr>
    <tr>
    	<td><a href="manage/department/department!qianfen.action?temp=2&&year=${param.year }&&month=${param.month }&&departmentName=${departmentName }">${score2 }分</a>&nbsp;|
    	<a href="manage/department/department!qianfen.action?temp=2&&year=${param.year }&&month=${param.month }&&departmentName=${departmentName }">${list2.size()}条</a></td>
    	<td><a href="manage/department/department!qianfen.action?temp=3&&year=${param.year }&&month=${param.month }&&departmentName=${departmentName }">${score3 }分</a>&nbsp;|
    	<a href="manage/department/department!qianfen.action?temp=3&&year=${param.year }&&month=${param.month }&&departmentName=${departmentName }">${list3.size()}条</a></td>
    	<td><a href="manage/department/department!qianfen.action?temp=4&&year=${param.year }&&month=${param.month }&&departmentName=${departmentName }">${score4 }分</a>&nbsp;|
    	<a href="manage/department/department!qianfen.action?temp=4&&year=${param.year }&&month=${param.month }&&departmentName=${departmentName }">${list4.size()}条</a></td>
    	<td><a href="manage/department/department!qianfen.action?temp=5&&year=${param.year }&&month=${param.month }&&departmentName=${departmentName }">${score5 }分</a>&nbsp;|
    	<a href="manage/department/department!qianfen.action?temp=5&&year=${param.year }&&month=${param.month }&&departmentName=${departmentName }">${list5.size()}条</a></td> 
        	
     </tr>


  </table><br> <br> <br>
</form>
</div>
</body>
</html>
