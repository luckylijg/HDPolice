<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

 <%@include file="/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
   
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/css/Admin.css" />
<script type="text/javascript">
	function check(){
		var a=document.getElementById("oldpwd");
		var b=document.getElementById("newpwd1");
		var c=document.getElementById("newpwd2");
		if(a.value.length==0){
			alert("旧密码不能为空");
			return false;
		}else if(b.value.length==0){
			alert("新密码不能为空");
			return false;
		}else if(c.value.length==0){
			alert("确认密码不能为空");
			return false;
		}
	}
</script>
  </head>
  
  <body>
  
  
<div class="R-CON"align="center">
  	 <p class="R-Tit" align="center" style="{width:70% }">修改用户登录密码</p>
          <form id="form1" action="${ctx }/manage/system/user!modifyPwd.action" method="post" onsubmit="return check()">
             <table style="width: 60%">
        
              <tr>
                <td align="center" width="40%">请输入旧密码：</td>
                <td><input type="password"  name="oldpwd" id="oldpwd" autocomplete="off"/></td>               
              </tr>
              <tr>
                <td align="center">请输入新密码：</td>
                <td><input type="password"  name="newPwd1" id="newpwd1"/></td>               
              </tr>
              <tr>
                <td align="center">请再次输入新密码：</td>
                <td><input type="password" name="newPwd2" id="newpwd2"/></td>               
              </tr>
             <div align="center"><strong><font size="3"><span><font color="red">${errorupdatepwd }</font></span></font></strong></div>
              <tr>
                <td align="center" colspan="2">
                <input type="submit" value="修改"/>&ensp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&ensp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="reset" value="重置"/>
                </td>
               
            </table>

           </form>
          
        </div>
        </body>
</html>
