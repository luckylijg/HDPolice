<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="/commons/taglibs.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'complaint_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/js/search.js"></script>
    <script language="javascript" type="text/javascript"	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx }/js/complaint.js"></script>
    
 

  </head>
  
  <body>
  <div class="R-CON" align="center"> 
  
    
  <p class="R-Tit" align="center">总查询</p>
   
  <%--  <div style="{position:absolute;top:4%;right:9%;}">
  <span id="search" style="cursor:pointer"><img src="${ctx }/images/serch1.jpg"></span></div>
  <br/>
  <form id="form119" action="${ctx }/manage/complaint/complaint!serachAll.action" method="post" style="display:none;">
 
  	<table  width="100%" id="condition" style="BORDER-COLLAPSE:collapse;width: 85%;" border="1" cellspacing="0">
  		<tr>
  			<th>开始时间</th><th>结束时间</th><th>督查民警</th><th>涉及单位</th><th>问题类型</th><th>处理分类</th><th>案件编号</th>
  			<th>关键字</th>
  			<td rowspan="2" align="center" valign="middle">
  			<input type="submit" value="统计"/>
  			</td>
  		</tr>
  			<tr>
			<td nowrap><input type="text" id="time" name="date1"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" /></td>
  			<td nowrap><input type="text" id="time" name="date2"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" /></td>
  			<td>
  			<select id="policemen" name = "userid">
			     	 <option value="-1" >--请选择--</option>
  				<c:forEach items="${policeUser }" var="user">
			     	 <option value="${user.userid }" >${user.realname }</option>
			      </c:forEach>
		        </select>
  			</td>
  			<td>
  			<select name="departmentid">
  				<option value="-1">--请选择--</option>
  				<c:forEach items="${departList }" var="dep" varStatus="i">
  					<option value="${dep.departmentid }">${dep.name }</option>
  				</c:forEach>
  			</select>
  			</td>
  			<td><select name="questionsortid">
  			<option value="-1">--请选择--</option>
  			<c:forEach items="${questionList }" var="question"> <option value="${question.questionsortid }">${question.name }</option></c:forEach>
  			</select>
  			</td>
  			<td><select name="handlesortid">
  			<option value="-1">--请选择--</option>
  			<c:forEach items="${handleList }" var="handle"> <option value="${handle.handlesortid }">${handle.name }</option></c:forEach>
  			</select>
  			</td>
  			<td>
  				<input type="text" name="code" style="width:100%">
  			</td>
  			<td>
  				<input type="text" name="keyword" style="width:100%">
  			</td>
  		</tr>
  </table>
  
  </form> --%>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    <table width="100%" border="1" style="BORDER-COLLAPSE:collapse;width: 85%;" cellspacing="0" >
   
 
  <tr>
    <th align="center" nowrap width="7%">案件编号</th>
    <th align="center" nowrap width="13%">时间</th>
    <th align="center" nowrap width="15%">督察民警</th>
    <th align="center" nowrap width="20%">涉及单位</th>
    <th align="center" nowrap width="18%">问题类别</th>
    <th align="center" nowrap width="18%">处理分类</th>
    <th align="center" nowrap width="9%">操作</th>
  </tr>
  
  <c:forEach items="${pager.list }" var="com" varStatus="i">
  <tr>
    <%-- <td align="center">${i.index + 1 + pager.offset }</td> --%>
    <td align="center">${com.sno }</td> 
    <td align="center"><fmt:formatDate value="${com.time }" pattern="yyyy-MM-dd "/></td>
    <td align="center"><c:forEach items="${com.users }" var="user" >
    		${user.realname }&nbsp;&nbsp;
    	</c:forEach>
    </td>
    <td align="center"><c:forEach items="${com.departments }" var="dep" varStatus="j">
    		${dep.name }&nbsp;&nbsp;
    	</c:forEach>
    </td>
    <td align="center">
	<c:forEach items="${com.questionSorts }" var="que" varStatus="j">${que.name }&nbsp;</c:forEach>
	</td>
  <td align="center">
	<c:forEach items="${com.handleSorts }" var="hand" varStatus="j">${hand.name }&nbsp;</c:forEach>
	</td>
    <td nowrap>
    			<a href="${ctx }/manage/complaint/audit!auditShow.action?complaintid=${com.complaintid}">
    			<img src="${ctx }/images/find.png" title="详情"></a>|
  
    <c:if test="${com.feedbacks.size() == 0}"><img src="${ctx }/images/window_error.png" title="无反馈信息"></font></c:if>
    <c:if test="${com.feedbacks.size() != 0}"> <a href="${ctx }/manage/complaint/feed!feedback.action?complaintid=${com.complaintid}"><img src="${ctx }/images/window_find.png" title="反馈信息"></a></c:if>
  </td>
  </tr>
  </c:forEach>
  
</table>
<br/>
    <jsp:include page="/commons/multipages.jsp"/><br> <br>
</body>
</html>
