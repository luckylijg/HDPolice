<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
      
    <title>弹出层</title>  
    <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="description" content="This is my page">  
    <style>  
         body{margin:0 0;}   
        .myd{  
            background: #77887E ;  
            height: 100%;  
           left: 0%;  
            right: 0%;  
            width: 100%;  
            position: absolute;  
            z-index: 10000;  
       }   
          
        .pd{  
            background:white;   
            height: 400px;  
            width: 550px;  
            position: absolute;  
            z-index: 10002;  
        }  
    </style>   
      
  </head>  
    
  <script type="text/javascript">  
      function pop(){  
        document.getElementById("md").style.display="block";  
          
        //实现透明遮盖，如果不需要透明，不需要设置此属性  
        document.getElementById("md").style.filter="alpha(opacity=80)";  
          
        //clientWidth取的是实际窗口文档域的大小  
        var _x = document.body.clientWidth;  
        var _y = document.body.clientHeight;  
        var a_w = 450;  
        var a_h = 300;  
        //alert(_x+" == " + _y);  
        //计算弹出层的位置，目的是要显示在正中间  
        var dleft = _x/2 - a_w/2;  
        var dtop = _y/2 - a_h/2;  
        //alert(dleft+" == "+dtop);  
        var cd = document.getElementById("pd").style;  
        //cd.setAttribute("left",dleft+"px");  
        //cd.setAttribute("top",dtop+"px");  
        cd.left=dleft+"px";  
        cd.top = dtop+"px";  
        cd.display="block"; }        
   function close_div(){  
       document.getElementById("md").style.display="none";  
        document.getElementById("pd").style.display="none";  
    }  
    
</script>  
  
  <body>   
  <!-- 遮盖层 -->  
  <div class="myd" style="display: none" id="md"></div>  
    
  <!-- 弹出层 -->  
  <div class="pd" style="display: none" id="pd"> 
    <div style="height: 20px;background:gray ;width: 100%;text-align: right">  
        <button onclick="close_div()">X</button>  
    </div>  
    显示内容<br/>
  </div>  
  <input type="button" onclick="pop()" value="弹出层">  <br>  
      This is my JSP page. <br>  
  </body>  
</html>  
