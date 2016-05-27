<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<script type="text/javascript">
	
		function check(){
			var departname=document.getElementById("name");
			if(departname.value.length==0){
				var out=document.getElementById("outname");
				out.innerHTML="<font color=red>不能为空！！！</font>";
				return false;
			}
		}
	</script>


  </head>
  
  <body>
  <div class="R-CON" style="{position:absolute;top:5%;left:18%;}">
  <a href="${ctx }/manage/data/department!list1.action"><img src="${ctx }/images/back.png"></a>
  
  	 
  	 <p class="R-Tit">单位>>添加单位</p>
           <form action="${ctx }/manage/data/department!add.action" method="post" onsubmit="return check()">
             <table width="0" border="0" style="width: 75%;">
            	<tr>
            	<td>单位类型</td>
            	<td><select name="type">
            	<option value="0">督察单位</option>
            	<option value="1">大队</option>
            	<option value="2">科室</option>
            	</select>
            	</td>
            	</tr>
            	<tr>
            	<td>单位名称</td>
            	<td><input type="text" name="name" id="name"/><span id="outname"></span></td>
            	</tr>
            	<tr>
            	<td>地址</td>
            	<td><input type="text" name="address"/></td>
            	</tr>
            	<tr>
            	<td>电话</td>
            	<td><input type="text" name="phone"/></td>
            	</tr>
            	
            	<tr>
            	
            	<td colspan="2">
            	<input type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<input type="reset" value="重置"/>
            	</td>
            	</tr>
            </table>
			</form>
    
        </div>
        </body>
</html>
