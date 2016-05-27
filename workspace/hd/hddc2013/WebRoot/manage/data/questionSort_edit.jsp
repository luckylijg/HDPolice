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
alert("问题名称不能为空");
return false;
}
}
</script>
  </head>
  
  <body>
  
  <div class="R-CON" style="{position:absolute;top:5%;left:18%;}">
   <a href="${ctx }/manage/data/questionSort!list1.action"><img src="${ctx }/images/back.png"></a>
  

  	
  	 <p class="R-Tit">问题>>编辑问题</p>
           <form action="${ctx }/manage/data/questionSort!update.action" method="post" onsubmit="return check()">
           <input type="hidden" name="questionsortid"  value="${questionsort.questionsortid }"">
             <table width="0" border="0">
            	<tr>
            	<td width="30%">问题名称</td>
            	<td><input type="text" id="name" name="name" value="${questionsort.name }" width="65%"/></td>
            	</tr>
            	<tr>
            	<td>问题描述</td>
            	<td><textarea row="3" cols="65%" name="description" >${questionsort.description }</textarea></td>
            	</tr>
            	<tr>
            	
            	<td colspan="2">
            	<input type="submit" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<input type="reset" value="重置"/>
            	</td>
            	</tr>
            </table>
			</form>
          
        </div>
        </body>
</html>
