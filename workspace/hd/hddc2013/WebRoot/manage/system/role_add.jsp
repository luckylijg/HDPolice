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
   
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />

  </head>
  
  <body>
  <div class="R-CON" style="{position:absolute;top:5%;left:18%;}">
  	  
  	 <a href="${ctx }/manage/system/role!list.action"><img src="${ctx }/images/back.png"></a>
  	 <p class="R-Tit">角色>>添加角色</p>
           <form action="${ctx }/manage/system/role!add.action" method="post">
             <table width="0" border="0"  >
             <tr>
             <td>角色名</td>
             <td><input type="text" name="name" /></td>
             </tr>
             <tr>
             <td>描述</td>
             <td><textarea cols="30" rows="4" name="description"></textarea></td>
             </tr>
             <tr>
             
             <td colspan="2">
             <input type="submit" value="添加"/>
	  		 <input type="reset" value="重置"/>
             </td>
             </tr>
            </table>
            </form>
		</div>
        </body>
</html>
