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

<link rel="stylesheet" type="text/css" href="css/Admin.css" />
<link rel="stylesheet" type="text/css" href="css/complaint.css" />
<link href="css/Ind.css" type="text/css" rel="stylesheet" />
</head> 

  <body>  
  <br> 
  <form action="${ctx }/manage/complaint/print!print.action" method="post" target="_new">
 	<table width="50%" border="0" cellspacing="0" cellpadding="0" align="right">
        <tr align="center"> 
          <td width="20%"><input type="hidden" name="complaintid" value="${complaint.complaintid }"></td>
          <td width="20%"><input type="submit" value="  打印   "></td>
          
        </tr>
      </table>
      </form>
<div class="Tab-D" align="center" >
<p class="R-Tit" align="center">受理举报投诉登记表</p> 
	<table style="BORDER-COLLAPSE:collapse;width:85%" cellspacing="0" border="1" >
		
		<tr align="center" >
			<th >编号</th>
			<%-- <td colspan="2">${complaint.sno }
			</td> --%>
			<td colspan="2"  class="W180" >${complaint.sno }</td>
			<td nowrap width="5%"  class="W90">受理时间</td>
			<td><fmt:formatDate value="${complaint.time }"/>
				</td>
			<td class="W90">督察单位</td>
			<td>${complaint.department.name }</td>

			<td class="W90">督察民警</td>
			<td>
			  ${userRealName }		     
		    </td>
			
		</tr>
		
		<c:if test="${R != 1 }">
		<tr align="center" height="50px">
			<th rowspan="3">投<br>诉<br>人</th>
			<td class="W90" >姓名</td>
			<td>${complaint.name }
			</td>
			<td class="W90">性别</td>
			<td><c:if test="${complaint.sex == 0  }">女</c:if>
				<c:if test="${complaint.sex == 1  }">男</c:if>
			</td>
			<td class="W90">年龄</td>
			<td>${complaint.age }</td>
			<td class="W90">职业</td>
			<td>${complaint.profession }
			</td>
		</tr>

		<tr align="center" height="50px">
			<td  class="W90">单位或地址</td>
			<td colspan="3">${complaint.address }
			</td>
			<td  class="W90">投诉方式</td>
			<td colspan="3">
				<c:if test="${complaint.mode == 0 }">来电</c:if>
				<c:if test="${complaint.mode == 1 }">来访</c:if>
				<c:if test="${complaint.mode == 2 }">批转</c:if>
			</td>
		</tr>

		<tr align="center" height="50px">
			<td class="W90">身份证号码</td>
			<td colspan="3">${complaint.idnumber }
			</td>
			<td class="W90">联系电话</td>
			<td colspan="3">${complaint.phone }
			</td>
		</tr>
		</c:if>
		<tr align="center" height="50px">
			<th rowspan=2>被<br>投<br>诉<br>人</th>
			<td  class="W90">涉及人员</td>
			<td colspan="3">
			${complaint.people }
			</td>
			<td class="W90">问题类别</td>
			<td colspan="3">${questionSorts }
			</td>
		</tr>

		<tr align="center" height="50px">
			<td class="W90">涉及单位</td>
			
			<td colspan="7" align="left" valign="middle">
			${departments }
			</td>
		</tr>

		<tr height="300px">
			<th rowspan="2">反<br>映<br>问<br>题<br>及<br>要<br>求</th>

			<td colspan="8" style="{border: 0px;text-align:left;}" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.question }
			</td>
		</tr>
	<tr>
			<td colspan="4" style="{border:0px}">

	图片或视频资料名:
	<c:if test="${complaint.filename !='' }">${complaint.filename }</c:if>
	<c:if test="${complaint.filename =='' }">无</c:if>
	</td>
	</tr>
		<tr align="center" height="50px">
		<td></td>
			 <td class="W90">领导批示</td>
			<td colspan="7" style="{text-align:left;}" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.leadercomment }</td>
		</tr>

		<tr align="center" height="300px" style="overflow:scroll;">
			<th rowspan="2">查<br>办<br>结<br>果</th>
			<td colspan="8" style="{border: 0px;text-align:left;overflow:scroll;}" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;${complaint.investigateresult }
			</td>
		</tr>
		<tr>
	
		
		<td colspan="4" style="{border: 0px}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		执法视频资料名：&nbsp;&nbsp;<c:if test="${complaint.filename2 == '' }">无</c:if>
									<c:if test="${complaint.filename2 != '' }">${complaint.filename2  }</c:if>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:if test="${complaint.yesno == 1 }">查实</c:if>
		<c:if test="${complaint.yesno == 2 }">查否</c:if>
		</td>
		</tr>

		<tr align="center" height="50px">
			<td>&nbsp;</td>
        <td class="W90">回访意见</td>
			<td colspan="3">
				${complaint.ip }
			</td>
			<td class="W90">查结时间</td>
			<td colspan="3"><fmt:formatDate value="${complaint.time2 }"/></td>
		</tr>

		<tr align="center" height="50px">
			<td>&nbsp;</td>
        <td class="W90">处理分类</td>
			<td colspan="7">${handleSorts }
			</td>
		</tr>

		<tr align="center" height="50px">
		<td>&nbsp;</td>
			<td colspan="2">扣分:&nbsp;
					${complaint.score }
			</td>
			<td colspan="3">预警：&nbsp;
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
			<th style="height:5%">备<br>注</th>
			<td colspan="8">${complaint.remark }
			</td>
		</tr>

	</table>
</div><br> <br>
</body>
</html>
