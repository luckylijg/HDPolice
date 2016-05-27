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
   <script language="javascript" type="text/javascript"	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
    
  </head>
  
  <body>
    <form action="${ctx }/manage/complaint/popularFeelings!listprint.action" method="post" target="_new">
 	<table width="1%" border="0" cellspacing="0" cellpadding="0" align="right">
        <tr align="center"> 
          <td><input type="submit" value="  打印   "></td>          
        </tr>
      </table>
      </form>
    
  <div class="R-CON" align="center">   
  <p class="R-Tit" align="center">网络舆情调查登记表</p>
  
 <form id="form119"
		action="${ctx }/manage/complaint/statistics!Search.action"
		method="post">
		<input	type="hidden" name="type" value="${type }" />
		
			<table width="100%" id="condition"
				style="BORDER-COLLAPSE:collapse;width: 85%;" border="1"
				cellspacing="0">
				
										<tr>
							<td>开始时间</td>

							<td nowrap><input type="text" id="time" name="time1"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" />
							</td>

							<td>结束时间</td>
							<td nowrap><input type="text" id="time" name="time3"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" />
							</td>
							<td rowspan="2" align="center" valign="middle"><input
								type="submit" value="统计" onclick="change_target()" /></td>
						</tr>
					</table>
					</form>
					
					
					
	<br><br>
  
    <table width="100%" border="1" style="BORDER-COLLAPSE:collapse;width: 85%;" cellspacing="0" >
  
  <tr>
    <th align="center" nowrap width="5%">序号</th>
    <th align="center" nowrap width="24%">涉及单位</th>
    <th align="center" nowrap width="22%">涉及人员</th>
    <th align="center" nowrap width="24%">问题分类</th>
    <th align="center" nowrap width="4%">扣分</th>
    <th align="center" nowrap width="6%">审核</th>
    <th align="center" nowrap width="15%">操作</th>
  </tr>
  <c:forEach items="${pager.list }" var="com" varStatus="i">
  <tr>
    <td align="center">${i.index + 1 + pager.offset }</td>
    <td align="center"><c:forEach items="${com.departments }" var="dep" varStatus="j">
    		${dep.name }&nbsp;&nbsp;
    	</c:forEach>
    </td>
    <td align="center">${com.people }</td>
    <td align="center">
	<c:forEach items="${com.questionSorts }" var="que" varStatus="j">${que.name }&nbsp;</c:forEach>
	</td>
    <td align="center">${com.score }</td>
    <td align="center">
    	<c:if test="${com.leaderapproved >5}">
	    	草稿
    	</c:if>
    	<c:if test="${com.leaderapproved <5}">
    		<c:if test="${com.leaderapproved == 2}">未通过</c:if>
	    	<c:if test="${com.leaderapproved == 1}">通过</c:if>
    	</c:if>
    </td>
    <td nowrap><c:if test="${com.leaderapproved==1 }"><img src="${ctx}/images/not1.png" title="无法修改"></c:if>
    			<c:if test="${com.leaderapproved!=1 }">
    			<a href="${ctx }/manage/complaint/popularFeelings!edit.action?complaintid=${com.complaintid}"><img src="${ctx}/images/edit.gif" title="编辑"></a></c:if>&nbsp;|
    			
    			<c:if test="${com.leaderapproved==1 }"><img src="${ctx}/images/not.png" title="无法删除"></c:if>
    			<c:if test="${com.leaderapproved!=1}">
    			<a href="${ctx }/manage/complaint/popularFeelings!delete.action?complaintid=${com.complaintid}" onclick="return confirm('确实要删除吗?')">
    			<img src="${ctx}/images/delete.gif" title="删除"></a></c:if>&nbsp;|
    			
    			<a href="${ctx }/manage/complaint/popularFeelings!show.action?complaintid=${com.complaintid}"><img src="${ctx }/images/find.png" title="详情"></a></td>
  </tr>
  </c:forEach>
  
</table>
<br/>
    <jsp:include page="/commons/multipages.jsp"/>
    </div><br> <br>
</body>
</html>
