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
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${ctx }/css/Admin.css" />
	<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
	
	<title>欢迎光临</title>


</head>
<body onLoad="getTime()">
             
  <div class="B-body">
     <div id="Head">
        <div class="B-top">
           <p class="Lef"><img src="images/logo-2.jpg"/></p>
           <div class="Ifo">
             <p class="Hy-ic"><strong><font color="red">${sessionScope.currentUser.realname}</font></strong>您好,欢迎登陆交通警察支队警务督察预警信息系统！</p>
             <p class="Date">当前时间:<span id="myDiv"></span></p>
          </div>   
         
        </div>
         <p    style="{position:relative;bottom:40%;left:90%;color:yellaw;font-size:30}"> <a href="${ctx }/user!loginout.action" > <img  src="${ctx }/images/cute-ball-logoff.png" height="50px" width="50px" title="退出登陆" style="{cursor: pointer}"></a>
      </p>
     </div>
     <div id="B-cont">
  <table width="100%" height="100%" ><tr><td width="20%" valign="top">
        <div class="L-CON">
           <div class="padtb8">
           <!-- 一级菜单 -->
            <div class="f fblod" id="sgc"  style=" background:url(images/Fir-close.gif) no-repeat;">
                <!-- <a target="FrameRight" href="">菜单</a> -->菜单</div>
                
               <!-- 二级菜单 --> 
            <div class="ps-box" id="gc" style="display:block">
            <c:forEach items="${modules }" var="module">
            	<c:if test="${fn:length(module.moduleid)==3 }">
           		 <div  class="f D" onClick="k(this,'${module.moduleid}')"> ${module.name }
                 </div>
                 <!-- 三级菜单 -->
                 <div class="ps" id="${module.moduleid }">
                 <c:forEach items="${modules }" var="module2">
                 <c:if test="${fn:startsWith(module2.moduleid,module.moduleid)&&fn:length(module2.moduleid)==6}">
           		 
           		 
                    <div class="b">
                        <a href="${ctx }/${module2.link }" target="FrameRight">${module2.name }</a>
                    </div>
            	</c:if>
            	</c:forEach></div>
            	
            	
            	</c:if>
            </c:forEach>
            </div>
            
            
        </div></div></td><td height="80%">
    			<iframe id="FrameRight" name="FrameRight" width="100%" frameborder="0" height="100%"  src="${ctx }/manage/system/user!personal.action"></iframe>
        
        </td></table>
     </div>
     <div id="FOOT">
       <p>Copyright@2013 邯郸市公安局交通警察支队 All Rights Reserved</p>
     </div>
  </div>
  <script language="javascript" type="text/javascript">

var currentClose=0;
var node;

function k(thisNode,vd)
{
  $(".ps").css("display","none");
  // $(".f D").style.backgroundImage="url(images/Sec-close.gif)";
  $(".D").css("background","url(images/Sec-bg.jpg) no-repeat");
  var ob=document.getElementById(vd); 
  
  if(ob.style.display=="block"||(currentClose==1&&node==ob))
  {
  	 currentClose=0;
     ob.style.display="none";
     //var ob2=document.getElementById("s"+vd);
     thisNode.style.backgroundImage="url(images/Sec-bg.jpg)";
  }else{
  	currentClose=1;
  	node=ob;
    ob.style.display="block";
    //var ob2=document.getElementById("s"+vd);
    thisNode.style.backgroundImage="url(images/Sec-close.gif)";
    //$(".f d").style.backgroundImage="url(images/Sec-close.gif)";
  }
}
</script>

<script type="text/javascript"> 
var obj; 
function getTime() 
{ 
obj=document.getElementById("myDiv"); 
var myDate=new Date(); 
var x= myDate.toLocaleString();
var y= myDate.getFullYear();    //获取完整的年份(4位,1970-????)  
var m= myDate.getMonth()+1;     //获取当前月份(0-11,0代表1月)  
var d= myDate.getDate();        //获取当前日(1-31)  
var q= myDate.getDay();         //获取当前星期X(0-6,0代表星期天)  
var t= myDate.getTime();        //获取当前时间(从1970.1.1开始的毫秒数)  
var h= myDate.getHours();       //获取当前小时数(0-23)  
var f= myDate.getMinutes();     //获取当前分钟数(0-59)  
var s= myDate.getSeconds();     //获取当前秒数(0-59)
var w= ['日','一','二','三','四','五','六'];
var k=w[q];
if(d<10) d="0" + d;
if(h<10) h="0" + h;
if(m<10) m="0" + m;
if(f<10) f="0" + f;
if(s<10) s="0" + s;
obj.innerHTML=y+'年'+m+'月'+d+'日  '+"星期"+k+" "+h+':'+f+":"+s;
window.setTimeout("getTime()",1000); 
} </script>

</body>
</html>
