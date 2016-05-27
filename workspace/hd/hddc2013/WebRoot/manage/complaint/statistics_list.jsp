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
  <script type="text/javascript">

	function change(){
		//alert(document.getElementById("temp").value);
		document.getElementById("temp").value=document.getElementById("temp").value+2;
		//alert(document.getElementById("temp").value);
		form119.target="_new";
		form119.submit();
	}
	
	function change_target(){
		form119.target="_self";
		document.getElementById("temp").value=1;
	}
</script>
  <body><br> <p class="R-Tit" align="center">${title }</p>
  <div style="{position:absolute;top:6%;right:16%;}">
  <span id="search" style="cursor:pointer"><img src="${ctx }/images/serch1.jpg"></span></div>
  
  <div style="{position:absolute;top:6%;right:9%;}">
 <input type="image" src="${ctx }/images/print.png" onclick="change()"/>
 
 </div>
  
  <div class="R-CON" align="center">
  <form id="form119" action="${ctx }/manage/complaint/statistics!statisticsSearch.action" method="post" >
  <input type="hidden" id="temp" name="temp" value="1">
  <input type="hidden" name="type" value="${type }"/>
  <c:if test="${r2 != 1 }">
  	<table  width="100%" id="condition" style="BORDER-COLLAPSE:collapse;width: 85%;" border="1" cellspacing="0">
  	</c:if>
  	 <c:if test="${r2 != 0 }">
  	<table  width="100%" id="condition" style="BORDER-COLLAPSE:collapse;width: 55%;" border="1" cellspacing="0">
  	</c:if>
  		<tr>
  			<th>开始时间</th>
  			
  			<th> 结束时间  </th>
  			<c:if test="${r2 != 1 }">
  			<th>督察单位</th>
  			<th>督察民警 </th>
  			<c:if test="${R == 1 }">
  				<th>涉及单位</th>
  			</c:if>  			
  			<th>问题类型</th>
  			<th>处理分类</th>
  			
  			<th>查实与否</th>
  			<c:if test="${type!=1 }">
  			<th>执法视频</th>
  			</c:if>
  			<c:if test="${type== 0 }">
  			<th>投诉方式</th>
  			</c:if>
  			</c:if>
  			<td rowspan="2" align="center" valign="middle">
  			<input type="submit" value="统计" onclick="change_target()"/>
  			</td>
  			
  		</tr>
  			<tr>
			<td nowrap><input type="text" id="time" name="time1"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" />
					</td>
  			<td nowrap><input type="text" id="time" name="time3"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" />
					</td>
  			<c:if test="${r2 != 1 }">
  			<td>
  			<select name="departmentid" id="police_depart" onChange="insertOption()">
					<option value="-1">--请选择--</option>
					<c:forEach items="${listDep1 }" var="dep" varStatus="i">
						<option value= "${dep.departmentid }" >${dep.name }</option>
					</c:forEach>
			</select>
  			</td>
  			<td>
  			<select id="policemen" name = "realname">
			      <option value="-1" >--请选择--</option>
		        </select>
  			</td>
  			<c:if test="${R == 1 }">
  			<td>
  			<select name="depname">
  				<option value="-1">--请选择--</option>
  				<c:forEach items="${listDep2 }" var="dep" varStatus="i">
  					<option value="${dep.departmentid }">${dep.name }</option>
  				</c:forEach>
  			</select>
  			</td>
  			</c:if>
  			<td><select name="que">
  			<option value="-1">--请选择--</option>
  			<c:forEach items="${listQue }" var="que"> <option value="${que.questionsortid }">${que.name }</option></c:forEach>
  			</select>
  			</td>
  			<td>
  			<select name="han">
  			<option value="-1">-请选择-</option>
  			<c:forEach items="${listHan }" var="han">
  			<option value="${han.handlesortid }">${han.name }</option>
  			</c:forEach>
  			</select>
  			</td>
  			
  			
  			<td> <select name="yesno"><option value="-1">-请选择-</option>
  									
  									<option value="1">查实</option>
  									<option value="2">查否</option>
  									
  			</select></td>
  			<c:if test="${type!=1 }">
  			<td>
  				<select name="yesno2">
  					<option value="0">-请选择-</option>
  					<option value="1">有</option>
  					<option value="2">无</option>
  					
  			</select>
  			</td>
  			</c:if>
  			<c:if test="${type==0 }">
  			<td><select name="mode">
  					<option value="3">-请选择-</option>
  					<option value="0">来电</option>
  					<option value="1">来访</option>
  					<option value="2">批转</option>
  			</select></td>
  			</c:if>
  			</c:if>
  		</tr>
  </table>
  
  </form>
 	
    <table width="100%" border="1" style="BORDER-COLLAPSE:collapse;width: 85%;" cellspacing="0" >
 
  <tr>
    <th align="center" nowrap width="5%">序号</th>
    <th align="center" nowrap width="23%">涉及单位</th>
    <th align="center" nowrap width="16%%">涉及人员</th>
    <th align="center" nowrap width="23%">问题分类</th>
     <th align="center" nowrap width="4%">扣分</th>
     <th align="center" nowrap width="5%">预警</th>
    <th align="center" nowrap width="13%">操作</th>
  </tr>
  <c:forEach items="${pager.list }" var="com" varStatus="i">
  
  <tr>
    <td align="center">${i.index + 1 + pager.offset }</td>
    <td align="center"><%--<fmt:formatDate value="${com.time }"/>
    --%><c:forEach items="${com.departments }" var="dep" varStatus="j">
    		${dep.name }&nbsp;&nbsp;
    	</c:forEach>
    </td>
    <td align="center">${com.people }</td>
    <td align="center">
	<c:forEach items="${com.questionSorts }" var="que" varStatus="j">${que.name }&nbsp;</c:forEach>
	</td>
    <td align="center">${com.score }</td>
    <td align="center"><c:if test="${com.earlywarning == 0}">未定</c:if>
    	<c:if test="${com.earlywarning == 1}">是</c:if>
    	<c:if test="${com.earlywarning == 2}">否</c:if>
    </td>
    
    <td nowrap><a href="${ctx }/manage/complaint/audit!auditShow.action?complaintid=${com.complaintid}"><img src="${ctx }/images/find.png" title="详情"></a>
    &nbsp;|&nbsp;
    <c:if test="${R!=1}">
    <a href="${ctx }/manage/complaint/feed!feedback.action?complaintid=${com.complaintid}"><img src="${ctx }/images/window_edit.png" title="反馈信息"></a>
    </c:if>
    <c:if test="${com.feedbacks.size() == 0&&R==1}"><img src="${ctx }/images/window_error.png" title="无反馈信息"></font></c:if>
    <c:if test="${com.feedbacks.size() != 0&&R==1}"> <a href="${ctx }/manage/complaint/feed!feedback.action?complaintid=${com.complaintid}"><img src="${ctx }/images/window_find.png" title="反馈信息"></a></c:if>
    </td>
  </tr>
 
  </c:forEach>
  
</table>
<br/>
    <jsp:include page="/commons/multipages.jsp"/>
    </div><br> <br>
</body>
</html>
