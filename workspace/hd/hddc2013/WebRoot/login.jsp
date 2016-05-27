<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
  <head>
    <base href="<%=basePath%>">
    
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<%-- <link rel="shortcut icon" href="${ctx }/images/title.jpg">  --%>
	<link  rel="shortcut icon" href="${ctx }/images/title.ico" type="image/x-icon" />
		
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<title>管理系统-用户登录</title>
	<script type="text/javascript" language="javascript">
	
	var b = window.top!=window.self;
	//alert( "当前窗口是否在一个框架中："+b );
	if(b){
		alert("请重新登录！！！");
		window.open("login.jsp");
		//window.setTimeout(window.top.close(),100); 
		window.setTimeout(window.parent.close(),100); 
		
	}
	
	function submitYouFrom(){
	 //alert("path");
	 $('#form1').submit();
	}
	</script>
	<script type="text/javascript"> 
	function changeValidateCode(obj) { 
		//获取当前的时间作为参数，无具体意义 
		var timenow = new Date().getTime(); 
		//每次请求需要一个不同的参数，否则可能会返回同样的验证码 
		//这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。 
		obj.src="rand.action?d="+timenow; 
	}
	</script>
</head>
<body>
<form action="user!login.action" id="form1" method="post" target="_top">
  <div class="C-big" target="_top">
     <div id="Log-Hd">
        <div class="Logo"><p class="P-IMG"><img src="images/logo-B.jpg"/></p>
        <p class="P-Gy"><img src="images/gy.jpg"/></p>
        </div>    
     </div>
      <div id="Log-Con">
       
       <div class="User" target="_top">
            <dl class="Mar-T fix">
                <dt>用户名：</dt>
                <dd>
                    <input type="text" class="w254" name="username"/>
                </dd>
            </dl>
            <dl>
                <dt>密码：</dt>
                <dd>
                    <input type="password" class="w254" name="password"/>
                </dd>
            </dl>
            <dl>
                <dt>验证码：</dt>
                <dd >
                	<input type="text" name="rand" size="5" class="w114">
	
                    
                </dd>
                <dd class="code"><img src="${ctx }/rand.action" onclick="changeValidateCode(this)" title="点击刷新验证码"/> </dd>
                
            </dl> 
            <dl>
            	<dt></dt>
            	<dd>${error }</dd>
            </dl>
            <p><a  target="_self" name="提交"  onclick="submitYouFrom()"></a></p>
        </div>
       
     </div>
     <div id="Log-Ft">
        <p>Copyright@2013  邯郸市公安局交通警察支队  All Rights Reserved</p>
     </div>
  </div>
  </form>
</body>
</html>
