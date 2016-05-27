<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.lang.Object" %>
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
    
	
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script language="javascript" type="text/javascript" src="${ctx }/My97DatePicker/WdatePicker.js"></script>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/personal.js" type="text/javascript"></script>
	<script type="text/javascript">
function check(){
var a=document.getElementById("username");
var b=document.getElementById("realname");
if(a.value.length==0){
alert("用户名不能为空");
return false;
}else if(b.value.length==0){
alert("姓名不能为空");
return false;
}
}
</script>
  </head>
  
  <body><div class="R-CON" style="{position:absolute;top:5%;left:18%;}">
  <a href="${ctx }/manage/system/user!personal.action"><img src="${ctx }/images/back.png" ></a>
  <p class="R-Tit">修改个人资料</p>
   <form action="${ctx }/manage/system/user!personalupdate.action" method="post" onsubmit="return check()">
 				  <input type="hidden" name="userid" value="${user.userid }">
	  	<table  class="default">
	  	
	  			
	  			
	  		
	  		<tr>
	  		<td>用户名</td>
	  		<td>
	  		<input type="text" id="username"  name="username" value="${user.username }" onblur="check(this,${user.userid})"/><span id="nameSpan"></span>
	  		<span>${error }</span>
	  		</td>
	  		</tr>
	  		
	  		
	  		<tr>
	  			<td >姓名</td>
	  			<td>
	  			<input type="text" id="realname"  name="realname" value="${user.realname }"/>
	  			</td>
	  			
	  		</tr>
	  		
	  		<tr>
	  		<td >性别</td>
	  		<td>
	  		<input type="radio" name="sex" value="0" style="cursor:pointer;"<c:if test="${user.sex==0 }" >checked</c:if>/>男
	  		<input type="radio" name="sex" value="1" style="cursor:pointer;"<c:if test="${user.sex==1 }">checked</c:if>/>女
	  		</td>
	  		</tr>
	  		
	  		<tr>
	  		<td >生日</td>
	  		<td>
	  		<input type="text" id="birthday"  value="${user.birthday }" name="birthday" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" style="width:150px"/>
	  		</td>
	  		
	  		
	  		
	  		
	  		</tr>
	  		<tr>
	  		<td >手机	</td>
	  		<td><input type="text" name="mobile" value="${user.mobile }"/></td>
	  		</tr>
	  		
	  		
	  		
	  		<tr>
	  			
	  			<td colspan="2"><input type="submit" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="reset" value="重置"/>
	  			</td>
	  		</tr>
	  	</table>
  	</form>
  	</div>
  </body>
</html>
