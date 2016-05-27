<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="${ctx}/js/jquery1.js"></script>
	<script type="text/javascript" src="${ctx}/js/search.js"></script>
	<script language="javascript" type="text/javascript" src="${ctx }/My97DatePicker/WdatePicker.js"></script>

  </head>
  
 <body><br>
  <div style="{position:absolute;top:4%;right:9%;}">
  <span id="search" style="cursor:pointer"><img src="${ctx }/images/serch1.jpg"></span>
<a href="${ctx }/manage/system/user!inAdd.action"><img src="${ctx }/images/add.png"></a></div>

  <div class="R-CON" align="center"> 
   <p class="R-Tit">人员管理</p>
  <form id="form119" action="${ctx }/manage/system/user!search.action" method="post" style="display:none;">
  <table  width="100%" id="condition" align="center" style="width: 85%">
  
  
  
  	<tr>
  		<th class="item" width="15%">单位</th>
  		<th class="item" width="12%">姓名</th>
  		
  		<th width="40%">入职时间</th>
  		<th class="item" width="15%">性别</th>
  		<td rowspan="2" width="8%"><input type="submit" value="搜索" class="btn"/>
	  			
  		</tr>
  		<tr>
  		<td>

  
<select name="departmentid" >
            	<option value="-2">--请选择--</option>
            	<c:forEach items="${list1}" var="department" varStatus="i">
            		
            		<option value="${department.departmentid }">${department.name }</option>
            	</c:forEach>
         	</select>
  		</td>
  	
  	
  		
  		<td><input type="text" name="realname"/></td>

	  			<td >从<input type="text" id="" name="date1" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" />
  		 到<input type="text" id="" name="date2" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" />
	  			</td>
  	
  		
  		<td>
  			<input type="radio" name="sex2" value="0" style="cursor:pointer"/>男
  			<input type="radio" name="sex2" value="1" style="cursor:pointer"/>女
  		    <input type="radio" name="sex2" value="2" style="cursor:pointer" checked />不限
  		</td>
  	</tr>
  </table></form>  
     <table width="100%" border="1" cellspacing="0" cellpadding="0" style="width: 85%" align="center">
   <tr>
   <th width="4%">序号</th>
   <th width="8%">警员编号</th>
   <th width="8%">用户名</th>
   <th width="12%">部门</th>
   <th width="10%">姓名</th>
   <th width="5%">性别</th>
   <th width="10%">生日</th>
   <th width="12%">手机</th>
   <th width="10%">职务</th>
   <th width="8%">入职时间</th>
   <th width="12%">操作</th>
   </tr>
   <c:forEach items="${pager.list }" var="user" varStatus="i">
   <tr>
   <td>${i.index + 1 + pager.offset }</td>
   <td>${user.sno }</td>
   <td>${user.username }</td>
   <td>${user.department.name }</td>
   <td>${user.realname }</td>
   <td>${user.sex==0?"男":"女" }</td>
   <td>${user.birthday }</td>
   <td>${user.mobile }</td>
   <td>${user.job }</td>	
   <td><fmt:formatDate value="${user.entrytime }" type="date"/></td>
   <td align="center">

   <a href="${ctx }/manage/system/user!edit.action?userid=${user.userid }"><img src="${ctx}/images/edit.gif" title="编辑"></a>&nbsp;|

    <c:if test="${user.complaints.size()>0 }"><font color="gray"><img src="${ctx}/images/not.png" title="不能删除"></font></c:if>
  					<c:if test="${user.complaints.size()==0 }">
  					<a href="${ctx }/manage/system/user!delete.action?userid=${user.userid }" onclick="return confirm('确定要删除吗？')"><img src="${ctx}/images/delete.gif" title="删除"></a></c:if>
					
   </td>
   </tr>
   </c:forEach>
   
   </table> 
   <br> 
   <br>
     <jsp:include page="/commons/multipages.jsp" ></jsp:include>
<br><br><br>
</div>
 </body>
</html>
