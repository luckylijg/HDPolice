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
    
    <title>My JSP 'complaint_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/js/search.js"></script>
    <script language="javascript" type="text/javascript"	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx }/js/complaint.js"></script>
    
 

  </head>
  
  <body>
  <div class="R-CON" align="center"> 
  
    
  <p class="R-Tit" align="center">总查询</p>
   
   <%-- <div style="{position:absolute;top:4%;right:9%;}">
  <span id="search" style="cursor:pointer"><img src="${ctx }/images/serch1.jpg"></span></div> --%>
  <br/>
  <form  action="${ctx }/manage/complaint/complaint!serachAll.action" method="post" >
<!--  <input type="hidden" name="file" value="-1"> -->
  	<table  width="100%" id="condition" style="BORDER-COLLAPSE:collapse;width: 85%;" border="1" cellspacing="0">
  		<tr>
  			<th>表类型</th>
  			<th>开始时间</th><th>结束时间</th>
  			<th>案件编号</th><th>  			督察单位  			</th><th>督察民警</th>
  			<td rowspan="4" align="center" valign="middle">
  			<input type="submit" value="统计"/>
  			</td>
  		</tr>
  			<tr>
  			<td> <select name="type"><option value="-1">-请选择-</option>
  									<option value="0">举报投诉</option>
  									<option value="1">现场督察</option>
  									<option value="2">网上督察</option>
  									<option value="3">网络舆情</option>
  			</select></td>
  			
			<td nowrap><input type="text" id="time" name="date1"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" /></td>
  			<td nowrap><input type="text" id="time" name="date2"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" /></td>
						<td>
  				<input type="text" name="code" style="width:100%">
  			</td>
						<td>
			
  			<select name="departid" id="police_depart" onChange="insertOption()">
					<option value="-1">--请选择--</option>
					<c:forEach items="${listDep1 }" var="dep" varStatus="i">
						<option value= "${dep.departmentid }" >${dep.name }</option>
					</c:forEach>
			</select>
  			</td>
  			<td>
  			<select id="policemen" name = "userid">
			     	 <option value="-1" >--请选择--</option>
  				<c:forEach items="${policeUser }" var="user">
			     	 <option value="${user.userid }" >${user.realname }</option>
			      </c:forEach>
		        </select>
  			</td>
  			
  			
  			
  		</tr>
  		<tr>
  			<th>涉及单位</th>
  			<th>问题类型</th><th>处理分类</th>
  			<th>查实与否</th>
  			<th>执法视频资料</th>
  			<th>关键字</th>
  			
  		</tr>
  		<tr>
			<td>
  			<select name="departmentid">
  				<option value="-1">--请选择--</option>
  				<c:forEach items="${departList }" var="dep" varStatus="i">
  					<option value="${dep.departmentid }">${dep.name }</option>
  				</c:forEach>
  			</select>
  			</td>
  			<td><select name="questionsortid">
  			<option value="-1">--请选择--</option>
  			<c:forEach items="${questionList }" var="question"> <option value="${question.questionsortid }">${question.name }</option></c:forEach>
  			</select>
  			</td>
  			<td><select name="handlesortid">
  			<option value="-1">--请选择--</option>
  			<c:forEach items="${handleList }" var="handle"> <option value="${handle.handlesortid }">${handle.name }</option></c:forEach>
  			</select>
  			</td>
  			
  			<td> <select name="yesno"><option value="-1">-请选择-</option>
  									
  									<option value="1">查实</option>
  									<option value="2">查否</option>
  									
  			</select></td>
  			<td> <select name="file"><option value="-1">-请选择-</option>
  									<option value="1">有</option>
  									<option value="2">无</option>
  			</select></td>
  			
  			<td>
  				<input type="text" name="keyword" style="width:100%">
  			</td>
  		</tr>
  </table>
  
  </form>
   
</body>
</html>
