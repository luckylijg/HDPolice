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


<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/Admin.css" />
<link rel="stylesheet" type="text/css" href="css/complaint.css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx }/js/complaint.js"></script>
<script type="text/javascript" src="js/complaint_check.js"></script>
<link href="css/Ind.css" type="text/css" rel="stylesheet" />
</head>
<body>

	<div class="myd" style="display:none" id="md"></div>
	<div class="pd" style="display:none" id="pd">
		<div
			style="height: 20px;background:gray ;width: 100%;text-align: right">
			<button onClick="close_div()">X</button>
		</div>
		<div id="dataDiv"></div>
	</div>
	<div class="Tab-D" align="center">
	<p class="R-Tit" align="center">现场督察登记表</p>
		<form action="${ctx }/manage/complaint/fieldInspect!update.action"
			method="post"  onsubmit="return checkfield()">
			<input name="complaintid" type="hidden" value="${complaint.complaintid }"> 
			<input type="hidden" id="police_men" value="${users }"> 
			<input type="hidden" name="type" value="${complaint.type }">
				<input id="leader" name="leader" value="0" type="hidden"/>
			<input type="hidden" name="leaderapproved" value="2"/>
			<table cellspacing="0" border="1"
				style="BORDER-COLLAPSE:collapse;width: 85%;">


				<tr align="center" height="30px">
					<th>编号</th>
					<td width="10%"><input name="sno" class="W180" readonly="readonly"
						value="${complaint.sno }" size="8"></td>
					<td class="W90">受理时间</td>
					<td><input class="W95" type="text" id="time" name="time " value="${time }"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" />
					</td>
					<td class="W90">督察单位</td>
					<td><select class="W95" name="departmentid" id="depart">
							<option value="-1">--请选择--</option>
							<c:forEach items="${listDep1 }" var="dep" varStatus="i">

								<option value="${dep.departmentid }"
									<c:if test="${complaint.department.departmentid==dep.departmentid }">selected</c:if>>${dep.name
									}</option>
							</c:forEach>

					</select>
					</td>

					<td class="W90">督察民警</td>
					<td colspan="2" align="center"><textarea  style="height:90%;width:70%"
							 name="users"  id="policemen"> ${userName }</textarea><input  type="button" class="Buttn"
						onClick="pop(this,'fieldinspectUser',-1)" value="选择" />
					</td>
				</tr>
				<tr >
					<td class="W90">涉及单位</td>

					<td colspan="8" style="text-align:left;"><textarea 
					class="W300 Mar-L" rows="2" cols="85%" name="departments" readonly="readonly">${departments }</textarea>
						<input style="border:none; height:23px;" class="Buttn" type="button" onClick="pop(this,'department','1')"
						value="选择"></td>
				</tr>



				<tr >
					<td class="W90">涉及人员</td>
					<td colspan="8" style="text-align:left;"><textarea class="W300 Mar-L" 
							 name="people">${complaint.people }</textarea></td>
				</tr>
				<tr >
					<td class="W90">问题类别</td>
					<td colspan="8" style="text-align:left;"><textarea class="W300 Mar-L" 
							name="questionSorts" readonly="readonly">${questionSorts }</textarea> <input style="border:none; height:23px;" class="Buttn" 
						type="button" onClick="pop(this,'questionSort','1')" value="选择">
					<!--  sytle="position:relative;top:50%" --></td>
				</tr>


				<tr>
					<th rowspan="2">发<br>现<br>的<br>问<br>题</th>

					<td colspan="8" style="{border: 0px}"><textarea style="height:200px;" class="W820" name="question">${complaint.question}</textarea></td>
				</tr>
				<tr>
					
					<td colspan="8" style="{border: 0px};text-align:right; padding-right:114px;" >图片或视频资料名: <input class="W180" value="${complaint.filename }" name="filename" type="text">
					</td>
				</tr>
				<tr>
					<th style="height: 8%">领<br>导<br>批<br>示</th>
					<td colspan="8"><textarea class="W665 Mar-L" name="leadercomment" cols="150%">${complaint.leadercomment }</textarea>
					</td>
				</tr>

				<tr>
					<th rowspan="2" >查<br>办<br>结<br>果</th>
					<td colspan="8" style="{border: 0px}"><textarea style="height:200px;" class="W820" name="investigateresult" rows="7"
							>${complaint.investigateresult }</textarea></td>
				</tr>
				<tr>
					


					<td colspan="8" style="{border: 0px}">
						<select class="W95" name="yesno">
							<option value="1"
								<c:if test="${complaint.yesno == 1 }">selected</c:if>>查实</option>
							<option value="2"
								<c:if test="${complaint.yesno == 2 }">selected</c:if>>查否</option>
					</select></td>
				</tr>

				<tr>
				<td>&nbsp;</td>
					<td class="W90">处理分类</td>
					<td colspan="3"><textarea  rows="2" cols="40%" 
							name="handleSorts" readonly="readonly">${handleSorts }</textarea> <input
						type="button" style="border:none; height:23px;" class="Buttn" onClick="pop(this,'handleSort','1')" value="选择">
					</td>
					<td class="W90">查结时间</td>
					<td colspan="3"><input type="text" value="${time2 }" id="time2" name="time2"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate"
						style="" />
					</td>
				</tr>




					<tr>
			<td colspan="4">扣分:&nbsp;
			<select class="W95" name="score">


							<option value="0"
								<c:if test="${complaint.score == 0 }">selected</c:if>>0</option>
							<option value="1"
								<c:if test="${complaint.score == 1 }">selected</c:if>>1</option>
							<option value="2"
								<c:if test="${complaint.score == 2 }">selected</c:if>>2</option>
							<option value="3"
								<c:if test="${complaint.score == 3 }">selected</c:if>>3</option>
							<option value="4"
								<c:if test="${complaint.score == 4 }">selected</c:if>>4</option>
							<option value="5"
								<c:if test="${complaint.score == 5 }">selected</c:if>>5</option>
							<option value="6"
								<c:if test="${complaint.score == 6 }">selected</c:if>>6</option>
							<option value="8"
								<c:if test="${complaint.score == 8 }">selected</c:if>>8</option>
							<option value="10"
								<c:if test="${complaint.score == 10 }">selected</c:if>>10</option>
							<option value="20"
								<c:if test="${complaint.score == 20 }">selected</c:if>>20</option>
							<option value="30"
								<c:if test="${complaint.score == 30 }">selected</c:if>>30</option>
							<option value="40"
								<c:if test="${complaint.score == 40 }">selected</c:if>>40</option>
							<option value="50"
								<c:if test="${complaint.score == 50 }">selected</c:if>>50</option>


			</select></td>
			<td colspan="5">预警：&nbsp;
			<select class="W95" name="earlywarning">
					<option value="1"
						<c:if test="${complaint.earlywarning == 1 }">selected</c:if>>是</option>
					<option value="2"
						<c:if test="${complaint.earlywarning == 2 }">selected</c:if>>否</option>
			</select></td>
			
			
		</tr>


				<tr height="90px;" >
					<th >备<br>注</th>
					<td colspan="8"><textarea style="height:80px;" class="W820" rows="2" cols="160%" name="remark">${complaint.remark }</textarea>
					</td>
				</tr>
				<tr>

					<td colspan="8" align="center">
					<input style="border:none; height:23px;" class="Buttn Mt-lr" type="submit" value="提交" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
					<input style="border:none; height:23px;" class="Buttn-03 Mt-lr" type="reset" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>
<br> <br>
</body>
</html>
