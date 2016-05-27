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
  <span align="center"><font size="5"><c:if test="${year==0 }">千分制考核扣分总表  </c:if >
  <c:if test="${year!=0 }">${year }年${month }月份${dename }千分制考核总表</c:if></font></span> 
   </div>

<%--     <div style="{position:absolute;top:4%;right:7%;}">
  <form id="fromId" action="${ctx }/manage/department/department!printqianfen.action" target="_new">
  <input type="hidden" name="year" value=${param.year }>
  <input type="hidden" name="month" value=${param.month }>
  <input type="hidden" name="departmentName" value=${departmentName }>
  <input type="image" onclick="javascript:docucument.getElementById('fromId').submit();" src="${ctx }/images/print.png"/>  
  </form></div> --%>
  
     <div class="R-CON">
     <form  id="from119" action="manage/data/department!qianfenall.action" method="post" >
     <input type="hidden" 　name="x" value="1" />
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
    
  
 <form  id="fom119" action="manage/data/department!qianfenall.action" method="post" >
  <input type="hidden" name="year" value=${param.year }>
  <input type="hidden" name="month" value=${param.month }>
 
  <table style="width:89%;" border="1" cellspacing="0" cellpadding="0" align="center">
  
  <c:if test="${x==1 }">
   <tr>
      <th>部门名称</th>
   
      
       <th>总扣分</th>
       
    </tr>
    
    <c:forEach items="${outlist}" var="dep">
    <tr><c:forEach items="${dep}" var="s" varStatus="i" ><c:if test="${i.index==0 }"><td>
    <a href="${ctx }/manage/department/department!departmentnamelist.action?year1=${param.year }&&month=${param.month }&&departmentid=${ dep.get(1)}">${s }</a>  </td></c:if>
    <c:if test="${i.index==2 }"><td>${s }  </td></c:if>
    
    </c:forEach>
  
    </tr>
    </c:forEach>
   </c:if>
  </table><br> <br> <br>
</form>
</div>
</body>
</html>
