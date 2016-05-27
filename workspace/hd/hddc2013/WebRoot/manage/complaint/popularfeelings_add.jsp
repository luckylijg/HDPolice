<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@include file="/commons/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ page import="java.text.SimpleDateFormat" %>
<% 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String time = sdf.format(new Date());
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MyJsp.jsp' starting page</title>


<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx }/css/complaint.css">
<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="js/checkfrom.js"></script>
<script language="javascript" type="text/javascript"	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx }/js/complaint.js"></script>
<script type="text/javascript" src="js/complaint_check.js"></script>
<link href="css/Ind.css" type="text/css" rel="stylesheet" />
  </head> 
  <body>   
 <div class="myd" style="display:none" id="md"></div>  
  <div class="pd" style="display:none" id="pd"> 
    <div style="height: 20px;background:gray ;width: 100%;text-align: right">  
        <button onclick="close_div()">X</button>  
    </div>
    <div id="dataDiv"></div>
  </div>
  <div class="Tab-D" align="center">
<form action="${ctx }/manage/complaint/popularFeelings!add.action" method="post"  onsubmit="return checkform()">
	<input id="leader" name="leader" value="0" type="hidden"/>
	<input type="hidden" name="leaderapproved" value="2"/>
<p class="R-Tit" align="center">网络舆情调查登记表</p>
	<table width="100%" style="BORDER-COLLAPSE:collapse;width: 85%;" cellspacing="0" border="1">

		
		<tr>
			<th>编号</th>
			<td colspan="2" ><input class="W180" name="sno" readonly="readonly" value="${nextcode }" size="10">
			</td>
			<td class="W90">受理时间</td>
			<td ><input class="W95" type="text" id="time" name="time " value="<%=time %>"
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate"
				style="width:150px" /></td>
			<td class="W90">督察单位</td>
			<td><select class="W95" name="departmentid" id="police_depart" onchange="insertOption()">
					<option value="-1">--请选择--</option>
					<c:forEach items="${listDep1 }" var="dep" varStatus="i">
						<option value= "${dep.departmentid }">${dep.name }</option>
					</c:forEach>

			</select></td>
			
			<td class="W90">督察民警</td>
			<td ><select class="W95" name="users" id="policemen" >
					<option value='-1' >--请选择--</option>
				
				</select>
			
			</td>
		</tr>

		<tr>
			<th rowspan="2">发<br>贴<br>人</th>
			<td class="W90">姓名/网名</td>
			<td><input class="W95" type="text" name="name "  size="10" />
			</td>
			<td class="W90">性别</td>
			<td><select class="W40" class="" name="sex">
					<option value="1">男</option>
					<option value="0">女</option>
			</select>
			</td>
			<td class="W90">年龄</td>
			<td><input class="W95" type="text" name="age" size="10" onblur="checkAge(this.value.toLowerCase())" autocomplete="off"/> <span id="ageErr"></span></td>
			<td class="W90">联系电话</td>
			<td><input class="W95" type="text" name="phone"  size="11" onblur="checkPhone(this.value)"  autocomplete="off" />
			<span id="mobileErr"></span></td>
			</td>
		</tr>

		<tr>
			<td class="W90">发布网址</td>
			<td colspan="7" align="left" valign="middle"><input type="text" name="address" size="100" />
			</td>
			
		</tr>

		
		<tr>
			<th rowspan=2 >反<br>应<br>问<br>题</th>
			<td class="W90">涉及人员</td>
			<td colspan="3">
				<textarea rows="2" cols="50%" name="people"></textarea>
			</td>
			<td class="W90">问题类别</td>
			<td colspan="3">		
				<textarea style="width: 80%;" name="questionSorts" readonly="readonly"></textarea>
				<input style="border:none; height:23px;" class="Buttn" type="button" onClick="pop(this,'questionSort','1')" value="选择">

			</td>
		</tr>

		<tr >
			<td class="W90">涉及单位</td>
			
			<td colspan="7" >
			<textarea class="W820"  style="width: 85%;" name = "departments" readonly="readonly"></textarea>
			<input style="border:none; height:23px;" class="Buttn" type="button" onClick="pop(this,'department','1')" value="选择"><!--  sytle="position:relative;top:50%" -->

			</td>
		</tr>

		<tr>
			<th rowspan="2">反<br>映<br>问<br>题<br>及<br>要<br>求</th>

			<td colspan="8" style="{border: 0px}"><textarea style="height:200px;" class="W820" name="question" ></textarea>
			</td>
		</tr>
	<tr>
	
	
	
	
	<td colspan="8" style="{border: 0px};text-align:right; padding-right:114px;">
	图片或视频资料名:
	<input class="W180" name="filename" type="text">
	</td>
	</tr>
		<tr style="5%">
			<th style="height: 3%;">领<br>导<br>批<br>示</th>
			<td colspan="8"><textarea style="height:100px;" class="W820" name="leadercomment" cols="150%"></textarea></td>
		</tr>

		<tr>
			<th rowspan="2">查<br>办<br>结<br>果</th>
			<td colspan="8" style="{border: 0px}"><textarea style="height:100px;" class="W820" name="investigateresult" ></textarea>
			</td>
		</tr>
		<tr>
		
		
		
		<td colspan="8" style="{border: 0px};text-align:right; padding-right:114px;">
		执法视频资料名：<input type="text" class="W180" name="filename2">&nbsp;&nbsp;
		<select class="W95" name="yesno">
		<option value="1">查实</option>
		<option value="2">查否</option>
		</select>
		</td>
		</tr>


		<tr>
		<td>&nbsp;</td>
			<td class="W90">回访意见</td>
			<td colspan="3"><textarea rows="1" cols="50%" name="ip"></textarea></td>

		

			<td class="W90">查结时间</td>
			<td colspan="3"><input class="W95" type="text" id="time2" name="time2"
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate"
				style="width:150px" /></td>
		</tr>

		<tr>
			<th style="height: 3%">处<br>理<br>类<br>别</th>
			<td colspan="8" >		
				<textarea class="W300 Mar-L" name ="handleSorts"  readonly="readonly" ></textarea>

				<input style="border:none; height:23px;" class="Buttn" type="button" onClick="pop(this,'handleSort','1')" value="选择">
			</td>
		</tr>

		<tr >

			<td colspan="4">扣分:&nbsp;
			<select class="W95" name="score">

					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="8">8</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>


			</select></td>

			<td colspan="5">预警：&nbsp;
			<select  class="W95" name="earlywarning">

					<option value="1">是</option>
					<option value="2">否</option>
			</select></td>
			
			
		</tr>

		<tr>
			<th style="height:90px;">备<br>注</th>
			<td colspan="8"><textarea style="height:80px;" class="W820" rows="2" cols="165%" name="remark"></textarea>
			</td>
		</tr>
		<tr>
		
			<td colspan="9">
			<input style="border:none; height:23px;" class="Buttn Mt-lr" type="submit" value="提交"/> &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;             
	        <input style="border:none; height:23px;" class="Buttn-02 Mt-lr" type="submit" value="保存" onclick="sub();"/>&nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;         
	        <input style="border:none; height:23px;" class="Buttn-03 Mt-lr" type="reset" value="重置"/> 
		</td>
		</tr>
	</table>
</form>
</div><br><br>
</body>
</html>
