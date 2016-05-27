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
    
    <title>My JSP 'user_edit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script language="javascript" type="text/javascript" src="${ctx }/My97DatePicker/WdatePicker.js"></script>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>

<script type="text/javascript">
	
		function check(){
			var usno=document.getElementById("sno");
			var rname=document.getElementById("realname");
			var ujob=document.getElementById("job");
			var uroles=document.getElementsByName("roleids");
			var depart=document.getElementById("departmentid");
			if(depart.value==-1){
				alert("单位不能为空");
				return false;
			}else if(usno.value.length==0){
				alert("编号不能为空！");
				return false;
			}else if(rname.value.length==0){
				alert("名字不能为空！");
				return false;
			}else{
				var s=0;
				for(var i=0;i<uroles.length;i++){
					if(uroles[i].checked){
						s=s+1;
					}
				}
				if(s==0){
					alert("角色不能为空");
					return false;
				}
			}
		}
	</script>

  </head>
  

 
  <body><div class="R-CON" style="{position:absolute;top:5%;left:18%;}">
  <a href="${ctx }/manage/system/user!list3.action"><img src="${ctx }/images/back.png"></a>

<form action="manage/system/user!update.action" method="post" onsubmit="return check()">
<input type="hidden" name="userid" value="${user.userid }">
<p class="R-Tit">用户>>编辑用户</p>
<table style="BORDER-COLLAPSE:collapse;width:80%" cellspacing="0" border="1" >
	  		<tr>
	  		<td  width="10%">用户名</td>
	  		<td><input name="username" value="${user.username }"/></td>
	  		<td>密码</td>
	  		<td><input name="password" value="${user.pwd }"/></td>
	  		</tr>
	  		
	  		<tr>
	  			<td  align="center">警员编号</td>
	  			<td><input type="text" id="sno" name="sno"  value="${user.sno }"/><span id="sno1"></span></td>
	  		
	  		<td>部门</td>
	  		<td widtd="20%">
	  		<select name="departmentid" id="departmentid">
	  		<c:forEach items="${list1 }" var= "department" varStatus="i">
	  		<option value="${department.departmentid }"	<c:if test="${department.departmentid == user.department.departmentid }">selected</c:if>>${department.name }</option>
	  		</c:forEach>
	  		</select>
	  		</td>
	  		</tr>
	  		<tr>
	  			<td>姓名</td>
	  			<td><input type="text" name="realname"  value="${user.realname }"/><span id="rname1"></span></td>
	  		
	  		<td>性别</td>
	  		<td>
	  		<input type="radio" name="sex" value="0" style="cursor:pointer;"<c:if test="${user.sex==0 }" >checked</c:if>/>男
	  		<input type="radio" name="sex" value="1" style="cursor:pointer;"<c:if test="${user.sex==1 }">checked</c:if>/>女
	  		</td>
	  		</tr>
	  		
	  		<tr>
	  		<td>出生日期</td>
	  		<td>
	  		<input type="text" id="birtdday" name="birthday" value="${user.birthday }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" style="widtd:150px"/>
	  		</td>
	  		
	  		
	  		<td>手机	</td>
	  		<td><input type="text" name="mobile"  value="${user.mobile }"/></td>
	  		</tr>
	  		
	  		<tr>
	  		<td>职务</td>
	  		<td><input type="text" name="job" value="${user.job }"/><span id="job1"></span></td>
	  		
	  		<td>入职时间</td>
	  			<td>
	  			<input type="text" id="entrytime" name="entrytime"  value="${user.entrytime }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" style="widtd:150px"/>
	  			</td>
	  		</tr>
	  		<tr>
	  		<td>用户角色</td>
	  			<td colspan="3">
	  			<c:forEach items="${list2}" var="role1" varStatus="i">
	  			<c:if test="${role1.roleid!=1 }">
    			<input name="roleids" id="${role1.roleid }" type="checkbox" value="${role1.roleid}"
    			<c:forEach items="${user.roles}" var="role" varStatus="i">
    			 <c:if test="${role1.roleid==role.roleid }">checked</c:if>
    			 </c:forEach>
    			>${role1.description}&nbsp;
    			
    			</c:if>
    		</c:forEach>
	  			</td>
	  		</tr>
	  		<tr>
	  			
	  			<td colspan="4"><input type="submit" value="修改"/>&ensp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&ensp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="reset" value="重置"/>
	  			</td>
	  		</tr>
	  	</table>
</form></div>
  </body>
</html>
