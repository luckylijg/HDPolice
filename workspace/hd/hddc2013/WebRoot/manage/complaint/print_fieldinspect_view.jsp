<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@include file="/commons/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>现场督察登记表_打印</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx }/css/complaint.css">
	

<link rel="stylesheet" type="text/css" href="css/Admin_print.css" />
<style type="text/css"> 
body {font-family:宋体;font-size:14px}
th {font-family:宋体;font-size:14px}
td {font-family:宋体;font-size:10px}
.tableborder {
	border: 1px solid #003063;
 
}
.style5 {font-size: 12}
.style8 {font-size: 10px}
</style>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
 
<style media="print"> 
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
<OBJECT id=WebBrowser  classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2  height=0  width=0></OBJECT>
<script language="JavaScript"> 
  function doSaveas(){
  try{
  document.all.WebBrowser.ExecWB(4,1);
   }catch(e){
   }
  }
  function doPrintSetup(){
  try{
  document.all.WebBrowser.ExecWB(8,1);
   }catch(e){
    alert("您的浏览器版本不支持网页打印设置");
   }
  }
  function doPrintPreview(){
  try{
  document.all.WebBrowser.ExecWB(7,1);
   }catch(e){
    alert("您的浏览器版本不支持网页打印预览");
   }
  }
  function doPrint(){
  window.print();
  }
  
</script>
<table id="PrintControl" width="100%" border="0" cellspacing="0" cellpadding="0" class="Noprint">
  <tr>
    <td align="right"><table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr align="center"> 
          <td width="20%">&nbsp;</td>
   
          <td width="20%"><input name="bt_Print" type="button" id="bt_Print" onClick="doPrint()" value=" 打 印 "></td>
        </tr>
      </table></td>
  </tr>
  
</table><br><br> <br> <br>  
<div class="R-CON" align="center">
<p class="R-Tit" align="center">现场督察登记表</p>
<form action="${ctx }/manage/complaint/complaint!add.action" method="post">
	<table width="100%" height="80%" cellspacing="0" style="BORDER-COLLAPSE:collapse" border="1">
		<tr align="center" height="50px"  style="border: 0" valign="middle">
			<td nowrap width="5%">编号</td>
			<td>${complaint.sno }
			</td>
			<td nowrap>受理时间</td>
			<td><fmt:formatDate value="${complaint.time }"/> 
				</td>
			<td nowrap>督察单位</td>
			<td>${complaint.department.name }</td>

			<td nowrap>督察民警</td>
			<td colspan="2">
			  ${usersName }		     
		    </td>
			
		</tr>
        <tr align="center" height="50px">
        	<td colspan="2">涉及单位
            </td>
            <td colspan="7">${departments } 
            </td>
            
        
        </tr>
         <tr align="center" height="50px">
        	<td colspan="2">涉及人员</td>
            <td colspan="7">${complaint.people } </td>
            
        
        </tr>
         <tr align="center" height="50px">
        	<td colspan="2">问题类型</td>
            <td colspan="7">${questionSorts } </td>
            
        
        </tr>
		

		<tr align="center" height="180px">
			<td rowspan="2">发<br>现<br>的<br>问<br>题</td>

			<td colspan="8" style="{border: 0px;text-align:left;}" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.question }
			</td>
		</tr>
	<tr>

	
	
	
	<td colspan="8" style="{border: 0px}">
	图片或视频资料名:
	<c:if test="${complaint.filename !='' }">${complaint.filename }</c:if>
	<c:if test="${complaint.filename =='' }">无</c:if>
	</td>
	</tr>
		<tr align="center" height="50px">
			<td colspan="2">领导批示</td>
			<td colspan="7" style="{text-align:left;}">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.leadercomment }</td>
		</tr>

		<tr align="center" height="150px">
			<td rowspan="2">查<br>办<br>结<br>果</td>
			<td colspan="8" align="center" style="{border: 0px;text-align:left;}" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.investigateresult }
			</td>
		</tr>
		<tr>		
		<td colspan="8" style="{border: 0px}">
		<%-- 执法视频资料名：${complaint.filename2 }&nbsp;&nbsp; --%>
	&nbsp;&nbsp;&nbsp;&nbsp;
		<c:if test="${complaint.yesno == 1 }">查实</c:if>
		<c:if test="${complaint.yesno == 2 }">查否</c:if>
		</td>
		</tr>

		<tr align="center" height="50px">
			<td colspan="2">处理分类</td>
			<td colspan="3">
				${handleSorts }
			</td>
			<td>查结时间</td>
			<td colspan="3"><fmt:formatDate value="${complaint.time2 }"/></td>
		</tr>

		<tr align="center" height="50px">
			<td colspan="3">扣分：&nbsp;
					${complaint.score }
			</td>
			<td colspan="3">是否预警：&nbsp;
					<c:if test="${complaint.earlywarning == 1 }">是</c:if>
					<c:if test="${complaint.earlywarning == 2 }">否</c:if>
			</td>
			<td colspan="3">审核：&nbsp;
					<c:if test="${complaint.leaderapproved >5}">
	    	<c:if test="${complaint.leaderapproved-10==2 }">未通过</c:if>
	    	<c:if test="${complaint.leaderapproved-10==1 }">通过</c:if>
    	</c:if>
    	<c:if test="${complaint.leaderapproved <5}">
    		<c:if test="${complaint.leaderapproved == 2}">未通过</c:if>
	    	<c:if test="${complaint.leaderapproved == 1}">通过</c:if>
    	</c:if>
						
					</td>
		</tr>

		<tr align="center" height="50px">
			<td>备<br>注</td>
			<td colspan="8">${complaint.remark }
			</td>
		</tr>
		
	</table>
</form>
</div>


	<div style="{position:absolute;right:6%;}"><br>
	<font size="5"><strong><font>邯郸市公安局交通警察支队警务督察处</font></strong></font>
	</div>
<br> <br> 
</body>
</html>
