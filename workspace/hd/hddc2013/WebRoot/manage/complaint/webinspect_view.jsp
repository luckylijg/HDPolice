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

<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx }/css/complaint.css">
	
<link rel="stylesheet" type="text/css" href="css/Admin.css" />
<link href="css/Ind.css" type="text/css" rel="stylesheet" /> 
</head> 
  <body>   
 
 	 <br> 
  <form action="${ctx }/manage/complaint/print!print.action" method="post" target="_new">
 	<table width="50%" border="0" cellspacing="0" cellpadding="0" align="right">
        <tr align="center"> 
          <td width="20%"><input type="hidden" name="complaintid" value="${complaint.complaintid }"></td>
          <td width="20%"><input type="submit" value="  打印  "></td>
          
        </tr>
      </table>

<div class="Tab-D" align="center">
<p class="R-Tit" align="center">网上督察登记表</p>
<form action="${ctx }/manage/complaint/complaint!add.action" method="post">
	<table width="100%" cellspacing="0" border="1" style="BORDER-COLLAPSE:collapse;width: 85%;">	
		<tr height="50px">
			<th>编号</th>
			<td colspan="2">${complaint.sno }
			</td>
			<td class="W90">受理时间</td>
			<td><fmt:formatDate value="${complaint.time }"/> 
				</td>
			<td class="W90">督察单位</td>
			<td>${complaint.department.name }</td>

			<td class="W90">督察民警</td>
			<td colspan="2">
			  ${userRealName }		     
	      </td>
			
		</tr>
		
		
		

		<tr height="50px">
			<th>涉及单位</th>
			
			<td colspan="9" align="left" valign="middle">
			${departments }
			</td>
		</tr>
        <tr height="50px">
        <th>涉及人员</th>
			<td colspan="9">
			${complaint.people }
			</td>
			
        </tr>
        <tr height="50px">
        <th>问题类别</th>
			<td colspan="9">${questionSorts }</td>
        </tr>

		<tr height="300px">
			<th rowspan="2">发<br>现<br>的<br>问<br>题</th>
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
		<tr align="center" height="150px">
			<th>领<br>导<br>批<br>示</th>
			<td colspan="9" style="{text-align:left;}" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.leadercomment }</td>
		</tr>

		<tr align="center" height="300px">
			<th rowspan="2">查<br>办<br>结<br>果</th>
			<td colspan="8" style="{border: 0px;text-align:left;}" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.investigateresult }
			</td>
		</tr>
		<tr>
		 
	<td colspan="8" style="{border: 0px}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		执法视频资料名：&nbsp;&nbsp;<c:if test="${complaint.filename2 == '' }">无</c:if>
									<c:if test="${complaint.filename2 != '' }">${complaint.filename2  }</c:if>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:if test="${complaint.yesno == 1 }">查实</c:if>
		<c:if test="${complaint.yesno == 2 }">查否</c:if>
		</td>
		</tr>

		<tr>
			<th>处理类别</th>
			<td colspan="5">${handleSorts }
			</td>
			<td class="W90">查结时间</td>
			<td colspan="3"><fmt:formatDate value="${complaint.time2 }"/></td>
		</tr>

		
		<tr align="center" height="50px">
		<td></td>
			<td colspan="3">扣分：&nbsp;
					${complaint.score }
			</td>
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

		<tr align="center" height="50px">
			<th>备注</th>
			<td colspan="9">${complaint.remark }
			</td>
		</tr>
		
	</table>

</div></form>

 <br> <br>
</body>
</html>
