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
  <a href="${ctx }/manage/system/module!list.action"><img src="${ctx }/images/back.png"></a>

  	 
  	 <p class="R-Tit">模块>>模块添加</p><br>
           <form id="form1" action="${ctx }/manage/system/module!add.action" method="post">
             <table width="0" border="0" style="width: 75%">
              <tr>
              <td>模块ID</td>
              <td><input type="text" id="moduleid" name="moduleid"/ ></td>
              </tr>
              <tr>
              <td>模块名字</td>
              <td><input type="text" id="name" name="name"/size="30"></td>
              </tr>
              <tr>
              <td>模块链接</td>
              <td><input type="text" id="link" name="link"size="50"/></td>
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
