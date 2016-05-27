<%@ page language="java"  import="java.util.*"  pageEncoding="UTF-8" %>
<%@include file="/commons/taglibs.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>My JSP 'user_add.jsp' starting page</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx }/css/Admin.css" />
	<script language="javascript" type="text/javascript" src="${ctx }/My97DatePicker/WdatePicker.js"></script>
	<script src="${ctx}/js/jquery.js" type="${ctx }text/javascript"></script>
	
<script type="text/javascript">
	
		function check(){
			var usno=document.getElementById("sno");
			var rname=document.getElementById("realname");
			var ujob=document.getElementById("job");
			var uroles=document.getElementsByName("roleids");
			//alert(uroles.length);
			if(usno.value.length==0){
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
  
   <body>
   
   <div class="R-CON"  style="{position:absolute;top:10%;left:18%;}">   
   <a  href="${ctx }/manage/system/user!list3.action"><img src="${ctx }/images/back.png"></a>
   <form id="form1" action="${ctx }/manage/system/user!add.action" method="post" onsubmit="return check()">
 <p class="R-Tit" align="left">用户>>添加用户</p>
   	  	<table style="BORDER-COLLAPSE:collapse;width:80%" cellspacing="0" border="1" >	  		  
	  		<tr>
	  			<td  align="center"  width="10%">警员编号</td>
	  			<td><input type="text" id="sno" name="sno" /><span id="sno1"></span></td>
	  		
	  		<td>部门</td>
	  		<td widtd="20%">
	  		<select name="departmentid">
	  		<c:forEach items="${list1 }" var= "department" varStatus="i">
	  		<option value="${department.departmentid }">${department.name }</option>
	  		</c:forEach>
	  		</select>
	  		</td>
	  		</tr>
	  		<tr>
	  			<td>姓名</td>
	  			<td><input type="text" name="realname" id="realname" /><span id="rname1"></span></td>
	  		
	  		<td>性别</td>
	  		<td>
	  		<input type="radio" name="sex" value="0" style="cursor:pointer;"checked/>男
	  		<input type="radio" name="sex" value="1" style="cursor:pointer;"/>女
	  		</td>
	  		</tr>
	  		
	  		<tr>
	  		<td>出生日期</td>
	  		<td>
	  		<input type="text" id="birtdday" name="birthday" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" style="widtd:150px"/>
	  		</td>
	  		
	  		
	  		<td>手机	</td>
	  		<td><input type="text" name="mobile"  /></td>
	  		</tr>
	  		
	  		<tr>
	  		<td>职务</td>
	  		<td><input type="text" name="job" id="job"/><span id="job1"></span></td>
	  		
	  		<td>入职时间</td>
	  			<td>
	  			<input type="text" id="entrytime" name="entrytime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" style="widtd:150px"/>
	  			</td>
	  		</tr>
	  		<tr>
	  		<td>用户角色</td>
	  			<td colspan="3">
	  			<c:forEach items="${list2}" var="role" varStatus="i">
	  			<c:if test="${role.roleid!=1 }">
    			<input name="roleids" id="${role.roleid }" type="checkbox" value="${role.roleid }">${role.description}&nbsp;
    			</c:if>
    			
    		</c:forEach>
	  			</td>
	  		</tr>
	  		<tr>
	  			
	  			<td colspan="4"><input type="submit" value="添加"/>&ensp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&ensp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="reset" value="重置"/>
	  			</td>
	  		</tr>
	  	</table>
  	</form>
  	</div>
  </body>
</html>
