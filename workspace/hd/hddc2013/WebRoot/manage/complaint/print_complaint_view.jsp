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

<title>受理举报投诉登记表_打印</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

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
  
</table>
 	 

 
 	 <div class="R-CON" align="center" >
 	 <p class="R-Tit" align="center">受理举报投诉登记表</p>
	<table  width="100%"  height="90%" cellspacing="0" style="BORDER-COLLAPSE:collapse" border="1" align="center">		
		<tr height="4%">
			<td width="5%" height="4%">编号</td>
			<td width="25%" colspan="2">${complaint.sno }</td>	
			<td width="5%">受理时间</td><td width="10%"><fmt:formatDate value="${complaint.time }"/>	</td>			
			<td width="10%">督察单位</td><td width="15%">${complaint.department.name }</td>
			<td width="10%">督察民警</td><td width="10%">${userRealName }</td>		     
		    			
		</tr>
		
		<c:if test="${R != 1 }">
		<tr align="center" height="5%">
			<td rowspan="3" width="1%">投<br>诉<br>人</td>
			<td  width="20%">姓名</td>
			<td width="10%">${complaint.name }</td>
			<td width="10%">性别</td>
			<td width="5%"><c:if test="${complaint.sex == 0  }">女</c:if>
				<c:if test="${complaint.sex == 1  }">男</c:if>
			</td>
			<td width="20%">年龄</td>
			<td width="5%">${complaint.age }</td>
			<td width="10%">职业</td>
			<td width="15%">${complaint.profession }
			</td>
		</tr>

		<tr align="center" height="5%">
			<td  width="20%">单位或地址</td>
			<td colspan="3" width="40%">${complaint.address }
			</td>
			<td  width="20%">投诉方式</td>
			<td colspan="3" width="20%">
				<c:if test="${complaint.mode == 0 }">来电</c:if>
				<c:if test="${complaint.mode == 1 }">来访</c:if>
				<c:if test="${complaint.mode == 2 }">批转</c:if>
			</td>
		</tr>

		<tr align="center" height="5%">
			<td>身份证号码</td>
			<td colspan="3">${complaint.idnumber }
			</td>
			<td >联系电话</td>
			<td colspan="3">${complaint.phone }
			</td>
		</tr>
		</c:if>
		<tr align="center" height="5%">
			<td rowspan=2>被<br>投<br>诉<br>人</td>
			<td >涉及人员</td>
			<td colspan="3">${complaint.people }</td>
			<td>问题类别</td>
			<td colspan="3">${questionSorts }</td>
		</tr>

		<tr align="center" height="5%">
			<td>涉及单位</td>			
			<td colspan="7" align="left" valign="middle">${departments }</td>
		</tr>

		<tr align="center" height="150px">
			<td rowspan="2">反<br>映<br>问<br>题<br>及<br>要<br>求</td>
			<td colspan="8" style="{border: 0px;text-align:left;}" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.question }</td>
		</tr>
		<tr height="3%">
			
			<td colspan="8" style="{border: 0px}">图片或视频资料名:	
<c:if test="${complaint.filename !='' }">${complaint.filename }</c:if>
	<c:if test="${complaint.filename =='' }">无</c:if>
	</td>
		</tr>
		<tr align="center" height="5%">
			<td colspan="2">领导批示</td>
			<td colspan="7" style="{text-align:left;}">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.leadercomment }</td>
		</tr>

		<tr align="center" height="100px">
			<td rowspan="2">查<br>办<br>结<br>果</td>
			<td colspan="8" align="center" style="{border: 0px;text-align:left;}" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.investigateresult }</td>
		</tr>
		<tr height="3%">
		
		<td colspan="8" style="{border: 0px}">&nbsp;&nbsp;&nbsp;&nbsp;
		执法视频资料名：&nbsp;&nbsp;<c:if test="${complaint.filename2 == '' }">无</c:if>
									<c:if test="${complaint.filename2 != '' }">${complaint.filename2  }</c:if>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:if test="${complaint.yesno == 1 }">查实</c:if>
		<c:if test="${complaint.yesno == 2 }">查否</c:if>
		</td>
		</tr>

		<tr align="center" height="4%">
			<td colspan="2">回访意见</td>
			<td colspan="3">
			${complaint.ip }
			</td>
			<td>查结时间</td>
			<td colspan="3"><fmt:formatDate value="${complaint.time2 }"/></td>
		</tr>

		<tr align="center" height="5%">
			<td colspan="2">处理分类</td>
			<td colspan="7">${handleSorts }</td>
		</tr>

		<tr align="center" height="5%">
			<td colspan="3">扣分：&nbsp;${complaint.score }</td>
			<td colspan="3">是否预警：&nbsp;
					<c:if test="${complaint.earlywarning == 1}">是</c:if>
					<c:if test="${complaint.earlywarning == 2}">否</c:if>			
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
		<tr align="center" height="4%">
			<td>备<br>注</td>
			<td colspan="8">${complaint.remark }</td>
		</tr>
		
		
	</table>
	</div>
	<div style="{position:absolute;right:6%;}"><br>
	<font size="5"><strong><font>邯郸市公安局交通警察支队警务督察处</font></strong></font>
	</div>
<br> <br>
</body>
</html>
