<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>

    <% Cookie[] cookies = request.getCookies();
    
    
    	
    String name = "cookiename1";
	String value = "cookievalue1";
    	
    for(Cookie c:cookies){
    	if(!name.equals(c.getName()))
    	{
    		
        	Cookie cookie = new Cookie(name,value);
        	cookie.setPath(request.getRequestURI());
        	cookie.setMaxAge(100);
        	response.addCookie(cookie);
    	}
    	out.print("CookieNmae : "+c.getName());
    	out.print("<br>CookieValue : "+c.getValue());
    	out.print("<br>CookiePath : "+c.getPath());
    	out.print("<br>CookieVersion : "+c.getVersion());
    	
    	out.print("<br>c.getComment(): "+c.getComment());
    	out.print("<br>c.getDomain():"+c.getDomain());
    	out.print("<br>c.getDomain():"+c.getDomain());
    	out.print("<br>c.getMaxAge():"+c.getMaxAge());
    	out.print("<br>c.getSecure():"+c.getSecure());
    	out.print("<br>");
    }
    %>
  </body>
</html>
