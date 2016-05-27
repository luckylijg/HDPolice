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
<link rel="stylesheet" type="text/css" href="css/Admin.css" />
<link rel="stylesheet" type="text/css" href="css/complaint.css" />
<script type="text/javascript" src="${ctx }/js/complaint.js"></script>
<script language="javascript" type="text/javascript"	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/checkfrom.js"></script>
<script type="text/javascript" src="js/complaint_check.js"></script>
<link href="css/Ind.css" type="text/css" rel="stylesheet" />
</head> 
  <body>   
 
<div class="myd" style="display:none;height:300%"; id="md" width="100%" ></div> 	 
<div class="Tab-D" align="center" >

<p class="R-Tit" align="center">受理举报投诉登记表</p> 
<form id="form1" action="${ctx }/manage/complaint/complaint!add.action" method="post" onsubmit="return checkform()">

	<input id="leader" name="leader" value="0" type="hidden"/>
	<input type="hidden" name="leaderapproved" value="2"/>
	
	<table style="BORDER-COLLAPSE:collapse;width:85%" cellspacing="0" border="1" >

	
		
		<tr align="center" >
			<th >编号</th>
			<td colspan="2" ><input name="sno" readonly="readonly" class="W180"  value="${nextcode }">
			</td>
			<td nowrap class="W90">受理时间</td>
			<td><input type="text" id="time" name="time"  class="W95" value="<%=time %>"
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" / ></td>
			<td class="W90">督察单位</td>
			<td><select name="departmentid" id="police_depart" onChange="insertOption()" class="W95" >
					<option value="-1">--请选择--</option>
					<c:forEach items="${listDep1 }" var="dep" varStatus="i">
						<option value= "${dep.departmentid }">${dep.name }</option>
					</c:forEach>

			</select></td>

			<td class="W90">督察民警</td>
			<td>
			  
			    <select id="policemen" name = "users" class="W95">
			      <option value='-1' >--请选择--</option>
			      
		        </select>
		     
		  </td>
			
		</tr>
		<tr align="center" >
			<th rowspan="3">投<br>诉<br>人</th>
			<td class="W90" >姓名</td>
			<td><input  class="W95" name="name" type="text"  size="10" onblur="checkUserName(this.value)"/><span id="usernameErr"></span>
			</td>
			<td class="W90">性别</td>
			<td><select class="" name="sex">
					<option value="1">男</option>
					<option value="0">女</option>
			</select>
			</td>
			<td class="W90">年龄</td>
			<td><input type="text" name="age" size="10" onblur="checkAge(this.value.toLowerCase())" autocomplete="off"/> <span id="ageErr"></span></td>
			<td class="W90">职业</td>
			<td><input type="text" class="W95"  name="profession" size="15"/>
			</td>
		</tr>

		<tr align="center">
			<td  class="W90">单位或地址</td>
			<td colspan="3"><textarea name="address" style="height: 40px; width: 100%" ></textarea>
			
			<td  class="W90">投诉方式</td>
			<td colspan="3"><select  name="mode" >
					<option value="0">来电</option>
					<option value="1">来访</option>
					<option value="2">批转</option>
			</select></td>
		</tr>

		<tr align="center" height="50px">
			<td class="W90">身份证号码</td>
			<td colspan="3"><input type="text" name="idnumber" size="40" onblur="IdCardRegCheck(this.value)" autocomplete="off" />
			<span id="idnumErr"></span></td>
			</td>
			<td  class="W90">联系电话</td>
			<td colspan="3"><input type="text" name="phone" size="30"onblur="checkPhone(this.value)"  autocomplete="off" />
			<span id="mobileErr"></span></td>
			</td>
		</tr>
		
		<tr align="center" >
			<th rowspan=2>被<br>投<br>诉<br>人</th>
			<td  class="W90">涉及人员</td>
			<td colspan="3">
			<textarea class="W300" name="people"></textarea>
			</td>
			<td class="W90">问题类别</td>
			<td colspan="3" align="left" valign="middle">		

				<textarea   name = "questionSorts" readonly="readonly" style="width: 70%;" ></textarea>


				<input  type="button" onClick="pop(this,'questionSort','1')"  style="border:none; height:23px;" class="Buttn"  value="选择">

			
			</td>
		</tr>

		<tr align="center" >
			<td class="W90">涉及单位</td>
			
			<td colspan="7"  align="left" valign="middle">

			<textarea class="W300 Mar-L"  name = "departments" readonly="readonly"></textarea>
			<input type="button" onClick="pop(this,'department','1')"  style="border:none; height:23px;" class="Buttn"  value="选择"><!--  sytle="position:relative;top:50%" -->

			</td>
		</tr>

		<tr align="center" >
			<th rowspan="2">反<br>映<br>问<br>题<br>及<br>要<br>求</th>


			<td colspan="8"  style="{border:0px}"><textarea style="height:200px;" class="W820" name="question" ></textarea>

			</td>
		</tr>
	<tr>

	<td colspan="4" style="{border:0px}">

	</td>
	
	
	

	<td colspan="4" style="{border:0px}">

	图片或视频资料名:
	<input name="filename" type="text" >
	</td>
	</tr>
		<tr align="center" >
			<td>&nbsp;</td>
        <td class="W90">领导批示</td>
			<td colspan="7"><textarea  class="W665 Mar-L"  name="leadercomment" ></textarea></td>
		</tr>

		<tr align="center" >
			<th rowspan="2">查<br>办<br>结<br>果</th>
			<td colspan="8"  align="center" style="{border: 0px}"><textarea style="height:200px;" class="W820"  name="investigateresult" rows="7" cols="160%"></textarea>
			</td>
		</tr>
		<tr>
		<td colspan="4" style="{border: 0px}">
		</td>
		
		
		<td colspan="4" style="{border: 0px}">
		执法视频资料名：<input type="text" name="filename2">&nbsp;&nbsp;
		<select name="yesno">
		<option value="1">查实</option>
		<option value="2">查否</option>
		</select>
		</td>
		</tr>

		<tr align="center" >
			<td>&nbsp;</td>
        <td class="W90">回访意见</td>
			<td colspan="3"><textarea rows="1" cols="50%" name="ip"></textarea>
			</td>
			<td class="W90">查结时间</td>
			<td colspan="3"><input type="text" id="time3" name="time3" class="W95"
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate"
				style="width:150px" /></td>
		</tr>

		<tr align="center" >
			<td>&nbsp;</td>
        <td class="W90">处理分类</td>
			<td colspan="7" align="left" valign="middle"><textarea name ="handleSorts" rows="2" cols="90%" readonly="readonly" ></textarea>

				<input type="button" onClick="pop(this,'handleSort','1')"  style="border:none; height:35px;" class="Buttn"  value="选择">
			</td>
		</tr>

		<tr align="center">
		<td>&nbsp;</td>
			<td colspan="3">扣分:&nbsp;
			<select name="score">
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
			<select name="earlywarning">
					<option value="1">是</option>
					<option value="2">否</option>
			</select></td>
			
			
		</tr>
		
		<tr align="center" >
			<th style="height:5%">备<br>注</th>
			<td colspan="8"><textarea  name="remark"  class="W820" ></textarea>
			</td>
		</tr>
		<tr>
		<td colspan="9" align="center">
			<input type="submit"  class="Buttn Mt-lr"  value="提交""/> &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; 
			<input type="submit" value="保存"  name="" class="Buttn-02 Mt-lr"  onclick="sub();"/>&nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;         
	        <input type="reset"  class="Buttn-03 Mt-lr"  value="重置"/> 
		</td>
		</tr>
	</table>
</form>
</div>

  <div class="pd" style="display:none" id="pd"> 
    <div style="height: 20px;background:gray ;width: 100%;text-align: right">  
        <button onClick="close_div()">X</button>  
    </div>
    <div id="dataDiv"></div>
  </div>
  <br> <br>
</body>
</html>
