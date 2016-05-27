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
    
    <title>审核_打印</title>
    
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
    
    <style media="print"> 
	.Noprint{display:none;}
	.pageNext{page-break-after: always;}
	</style>


  </head>
  
  <body><br>
  <OBJECT id="WebBrowser" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" width="0" VIEWASTEXT></OBJECT>

  <div style="{position:absolute;top:5%;right:9%;}" class="Noprint">
  <span id="search" style="cursor:pointer"><img src="${ctx }/images/serch1.jpg"></span>
  <a href="javascript:window.print()" target="_self">打印</a></div>

  <div class="R-CON" align="center"> 

    
  <p class="R-Tit" align="center">审核表</p>

  <form id="form119" action="${ctx }/manage/complaint/audit!auditSearch.action" method="post" style="display:none;">
 
  	<table  width="100%" id="condition" style="BORDER-COLLAPSE:collapse;width: 85%;" border="1" cellspacing="0">
  		<tr>
  		
  			<th>
  			开始时间
  			</th>
  			
  			<th>
  			结束时间
  			</th>
  			<th>
  			督查单位
  			</th>
  			<th>
  			督查民警
  			</th>
  			<th>
  			涉及单位
  			</th>
  			<th>
  			问题类型
  			</th>
  			<th>
  			预警与否
  			</th>
  			<th>
  			审核
  			</th>
  			<td rowspan="2" align="center" valign="middle">
  			<input type="submit" value="查询" />
  			</td>
  			
  		</tr>
  			<tr>
			<td nowrap><input type="text" id="time" name="time1"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" />
					</td>
  			<td nowrap><input type="text" id="time" name="time3"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" />
					</td>
  			<td>
  			<select name="departmentid" id="police_depart" onChange="insertOption()">
					<option value="-1">--请选择--</option>
					<c:forEach items="${listDep1 }" var="dep" varStatus="i">
						<option value= "${dep.departmentid }" >${dep.name }</option>
					</c:forEach>
			</select>
  			</td>
  			<td>
  			<select id="policemen" name = "users">
			      <option value="-1" >--请选择--</option>
		        </select>
  			</td>
  			<td>
  			<select name="depname">
  				<option value="-1">--请选择--</option>
  				<c:forEach items="${listDep2 }" var="dep" varStatus="i">
  					<option value="${dep.departmentid }">${dep.name }</option>
  				</c:forEach>
  			</select>
  			</td>
  			<td><select name="que">
  			<option value="-1">--请选择--</option>
  			<c:forEach items="${listQue }" var="que"> <option value="${que.questionsortid }">${que.name }</option></c:forEach>
  			</select>
  			</td>
  			<td>
  			<select name="earlywarning">
  				<option value="3">--请选择--</option>
  				<option value="1">是</option>
  				<option value="2">否</option>
  				<option value="0">未定</option>
  			</select>
  			</td>
  			<td>
  			<select name="leaderapproved">
  				<option value="3">--请选择--</option>
  				<option value="1">通过</option>
  				<option value="2">未通过</option>
  				<option value="0">未审核</option>
  			</select>
  			</td>
  			
  		</tr>
  </table>
  
  </form>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    <table width="100%" border="1" style="BORDER-COLLAPSE:collapse;width: 85%;" cellspacing="0" >
   
 
  <tr>
    <th align="center" nowrap width="5%">序号</th>
    <th align="center" nowrap width="24%">涉及单位</th>
    <th align="center" nowrap width="17%">涉及人员</th>
    <th align="center" nowrap width="24%">问题分类</th>
     <th align="center" nowrap width="5%">预警</th>
    <th align="center" nowrap width="5%">扣分</th>
    <th align="center" nowrap width="5%">审核</th>
   <p class="Noprint"><th align="center" nowrap width="15%">操作</th></p>
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
   <td align="center"><c:if test="${com.earlywarning == 0}">未定</c:if>
    	<c:if test="${com.earlywarning == 1}">是</c:if>
    	<c:if test="${com.earlywarning == 2}">否</c:if>
    	
    </td>
    
    
     <td align="center">${com.score }</td>
    
    <td align="center"><c:if test="${com.leaderapproved == 2}">未通过</c:if>
    	<c:if test="${com.leaderapproved == 1}">通过</c:if>
    	
    </td><p class="Noprint">
   <td nowrap><a href="${ctx }/manage/complaint/audit!auditEdit.action?complaintid=${com.complaintid}"><img src="${ctx}/images/edit.gif" title="审计"></a>&nbsp;|
    			<a href="${ctx }/manage/complaint/audit!delete.action?complaintid=${com.complaintid}" onclick="return confirm('确实要删除吗?')"><img src="${ctx}/images/delete.gif" title="删除"></a>&nbsp;|
    			<a href="${ctx }/manage/complaint/audit!auditShow.action?complaintid=${com.complaintid}"><img src="${ctx }/images/find.png" title="详情"></a>
    			</td></p>
  </tr>
  </c:forEach>
  
</table>
</div>
  <div style="{position:absolute;right:6%;}"><br>
	<font size="5"><strong><font>邯郸市公安局交通警察支队警务督察处</font></strong></font>
	</div> <br> <br>
</body>
</html>
