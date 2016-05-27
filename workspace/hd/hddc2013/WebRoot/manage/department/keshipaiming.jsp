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
    
    <title>各科室排名统计表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="js/jquery1.js"></script>
    <script type="text/javascript" src="js/search.js"></script>
    <script type="text/javascript" src="js/paiming.js"></script>
  </head>
 <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
	String time = sdf.format( new Date() );
	 String str1=time.substring(0,4);	 
	 int a=Integer.parseInt(str1);
	 %>
  <body>
<br>
<div align="center"> 
  <span align="center"><font size="5"><c:if test="${year==0 }">各科室排名统计表 </c:if >
  <c:if test="${year!=0 }">${year }年${month }月份各涉及单位千分制考核扣分排名统计表</c:if></font></span>  
   </div><br><br>
   <div style="{position:absolute;top:8%;right:22%;}">
  <span id="search" style="cursor:pointer"><img src="${ctx }/images/serch1.jpg"></span></div>
  
    <div style="{position:absolute;top:8%;right:15%;}">
  <form id="fromId" action="${ctx }/manage/department/department!printpaimingkeshi.action" target="_new">
  <input type="hidden" name="year" value=${param.year }>
  <input type="hidden" name="month" value=${param.month }>
   <input type="image" onclick="javascript:document.getElementById('fromId').submit();" src="${ctx }/images/print.png"/>  
  </form></div>
     
      <div class="R-CON">
       <form id="form119" action="manage/department/department!paimingkeshi.action" method="post" style="display:none;">
     <table  width="1000px" align="center">
 				
  		<td width="70%"><select name="year">
 						<% for(int i=0;i<a-2008;i++){%>
 						<option value="<%=a-i %>"><%=a-i %></option>
									 <% } %>
  					</select>年		
  		<select name="month">
  						<% for(int i=1;i<13;i++){%>
 						<option value="<%=i %>"><%=i %></option>
									 <% } %>
  						
  					</select>月
  		 		</td>
  		<td width="30%"><input type="submit" value="统计" class="btn"/>
	  			
	  			</td>
  
  <br/>
     </table>  
     </form> 
  
   
   <table width="100%" height="279" border="1" cellpadding="0" cellspacing="0" align="center">
  <tr><th>排名</th>
    <th>涉及单位</th>
    <th>扣分</th>
    <th>预警次数</th>
    <th>预警等级</th>
  </tr>
 
<c:forEach var="department" items="${paimingList}" varStatus="i" > 
          <tr> 
          <td>${i.index+1 }</td>
          <td> <c:out value="${department.dname}" /> 
          </td>
               
          <td> 
           <c:out value="${department.score}" /> 
          </td> 
          <td>
             <c:out value="${department.cishu}" /> 
          </td>
          
          <td> 
           <select onchange="changewarning(this.value,'${department.departmentid }','${department.type }')">
           	<option value="0" style="background-color:   green;" <c:if test="${department.warning == '0' }">selected</c:if>>不预警</option>
           	<option value="1" style="background-color:   yellow;" <c:if test="${department.warning == '1' }">selected</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;黄</option>
           	<option value="2" style="background-color:   orange;" <c:if test="${department.warning == '2' }">selected</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;橙</option>
           	<option value="3" style="background-color:   red;" <c:if test="${department.warning == 3 }">selected</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;红</option>
           </select>
          </td> 
          </tr>
    	</c:forEach>    	


</table>
</div><br><br>
 </body>
</html>
