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
var a=document.getElementById("name");
if(a.value.length==0){
alert("处理方式不能为空");
return false;
}
}
</script>
  </head>
  
  <body>
  
     <div class="R-CON" style="{position:absolute;top:5%;left:18%;}">
     <a href="${ctx }/manage/data/handleSort!list.action"><img src="${ctx }/images/back.png"></a>
 
  	
  	 <p class="R-Tit">处理分类>>添加处理分类</p>
           <form action="${ctx }/manage/data/handleSort!add.action" method="post" onsubmit="return check()">
             <table width="0" border="0" style="width: 70%">
            	<tr>
            	<td width="30%">处理方式</td>
            	<td><input type="text" id="name" name="name" size="35"/></td>
            	</tr>
            	<tr>
            	<td>问题描述</td>
            	<td><textarea row="2" cols="65%" id="description" name="description" ></textarea></td>
            	</tr>
            	<tr>

            	<td colspan="2">
            	<input type="submit" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<input type="reset" value="重置"/>
            	</td>
            	</tr>
            </table>
			</form>
          
        </div>
        </body>
</html>
