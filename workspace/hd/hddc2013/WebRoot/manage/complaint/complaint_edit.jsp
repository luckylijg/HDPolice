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
<link rel="stylesheet" type="text/css" href="${ctx }/css/complaint.css">
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
<script language="javascript" type="text/javascript"	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx }/js/complaint.js"></script>
<script type="text/javascript" src="js/checkfrom.js"></script>
<script type="text/javascript" src="js/complaint_check.js"></script>
<link href="css/Ind.css" type="text/css" rel="stylesheet" />
</head> 
  <body>   
 
 	 <div class="myd" style="display:none; height:320%" id="md" width="150%"  ></div>  
<div class="Tab-D" align="center">    
<p class="R-Tit" align="center">受理举报投诉登记表</p>
<form action="${ctx }/manage/complaint/complaint!update.action" method="post"  onsubmit="return checkform()">
	<input name ="complaintid" type="hidden" value="${complaint.complaintid }">
	<input type="hidden" id="police_men" value="${users }">
	<input type="hidden" name="type" value="${complaint.type }">
	<input id="leader" name="leader" value="0" type="hidden"/>
	<input type="hidden" name="leaderapproved" value="2"/>
	<table style="BORDER-COLLAPSE:collapse;width: 85%;" cellspacing="0" border="1">
		
		<tr>
			<th nowrap >编号</th>
			<td colspan="2"><input class="W180" name="sno" readonly="readonly" value="${complaint.sno }">
			</td>
			<td class="W90">受理时间</td>
			<td><input type="text" class="W95" id="time" name="time" value="${time }"
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate" /></td>
			<td class="W90">督察单位</td>
			<td><select name="departmentid" id="police_depart" onChange="insertOption()">
					<option value="-1">--请选择--</option>
					<c:forEach items="${listDep1 }" var="dep" varStatus="i">
					
						<option value= "${dep.departmentid }" <c:if test="${complaint.department.departmentid==dep.departmentid }">selected</c:if>>${dep.name }</option>
						
						
					</c:forEach>

			</select></td>

			<td class="W90">督察民警</td>
			<td>
			  
			    <select id="policemen" class="W95" name = "users">
			      <option value='-1' >--请选择--</option>
			      
		        </select>
		     
		  </td>
			
		</tr>
		<tr>
			<th rowspan="3" >投<br>诉<br>人</th>
			<td class="W90">姓名</td>
			<td><input name="name" class="W95" type="text"  value="${complaint.name }" size="10"/>
			</td>
			<td>性别</td>
			<td><select class="W40" class="" name="sex">
					<option value="1" <c:if test="${complaint.sex == 1 }">selected</c:if> >男</option>
					<option value="0" <c:if test="${complaint.sex == 0 }">selected</c:if> >女</option>
			</select>
			</td>
			<td class="W90">年龄</td>
			<td><input class="W95" type="text" name="age" size="10" value="${complaint.age }"onblur="checkAge(this.value.toLowerCase())" autocomplete="off"/> <span id="ageErr"></span></td>
			<td class="W90">职业</td>
			<td><input class="W95" type="text" name="profession" size="15" value="${complaint.profession }"/>
			</td>
		</tr>

		<tr >
			<td class="W90">单位或地址</td>
			<td colspan="3"><textarea style="height: 40px;" class="W300" name="address">${complaint.address }</textarea>
			
			</td>
			<td class="W90">投诉方式</td>
			<td colspan="3"><select class="W95" name="mode" >
					<option value="0" <c:if test="${complaint.mode == 0 }">selected</c:if> >来电</option>
					<option value="1" <c:if test="${complaint.mode == 1 }">selected</c:if> >来访</option>
					<option value="2" <c:if test="${complaint.mode == 2 }">selected</c:if> >批转</option>
			</select></td>
		</tr>

		<tr>
			<td class="W90">身份证号码</td>
			<td colspan="3"><input type="text" class="W300" name="idnumber" size="40" value="${complaint.idnumber }" onblur="IdCardRegCheck(this.value)" autocomplete="off" value="${complaint.idnumber }"/>
			<span id="idnumErr"></span></td>
			
			<td class="W90">联系电话</td>
			<td colspan="3"><input type="text" class="W144" name="phone" size="30" value="${complaint.phone }"onblur="checkPhone(this.value)"  autocomplete="off" value="${complaint.phone }"/>
			<span id="mobileErr"></span></td>
			</td>
		</tr>
		
		<tr >
			<th rowspan=2>被<br>投<br>诉<br>人</th>
			<td class="W90">涉及人员</td>
			<td colspan="3">
			<textarea class="W300" name="people">${complaint.people }</textarea>
			</td>
			<td>问题类别</td>
			<td colspan="3">		
				<textarea class="W300" style="width: 70%;"  name="questionSorts" readonly="readonly">${questionSorts }</textarea>

				<input style="border:none; height:23px;" class="Buttn" type="button" onClick="pop(this,'questionSort','1')" value="选择">

			
			</td>
		</tr>

		<tr>
			<td class="W90">涉及单位</td>
			
			<td colspan="7" style="text-align:left;">
			<textarea class="W300 Mar-L"  name="departments"  readonly="readonly" >${departments }</textarea>
			<input style="border:none; height:23px;" class="Buttn" type="button" onClick="pop(this,'department','1')" value="选择"><!--  sytle="position:relative;top:50%" -->
			</td>
		</tr>

		<tr>
			<th rowspan="2">反<br>映<br>问<br>题<br>及<br>要<br>求</th>

			<td colspan="8" ><textarea  name="question"  style="height:200px;" class="W820">${complaint.question}</textarea>
			</td>
		</tr>
	<tr>
	
	
	
	
	<td colspan="8" style="text-align:right; padding-right:114px;">
	图片或视频资料名:
	<input name="filename" type="text" class="W180" value="${complaint.filename }">
	</td>
	</tr>
		<tr>
		<td>&nbsp;</td>
			<td class="W90">领导批示</td>
			<td colspan="7"><textarea class="W665 Mar-L" name="leadercomment" >${complaint.leadercomment }</textarea></td>
		</tr>

		<tr>
			<th rowspan="2">查<br>办<br>结<br>果</th>
			<td colspan="8" ><textarea  name="investigateresult" style="height:200px;" class="W820">${complaint.investigateresult }</textarea>
			</td>
		</tr>
		<tr>
		
		
		<td colspan="8">
		执法视频资料名：<input type="text" class="W180" name="filename2" value="${complaint.filename2 }">&nbsp;&nbsp;
		<select name="yesno" class="W95">
	
		<option value="1" <c:if test="${complaint.yesno == 1 }">selected</c:if>>查实</option>
		<option value="2" <c:if test="${complaint.yesno == 2 }">selected</c:if>>查否</option>
		</select>
		</td>
		</tr>


		<tr>
		 <td rowspan="3">&nbsp;</td>
			<td class="W90">回访意见</td>
			<td colspan="3"><textarea rows="1" cols="50%" name="ip">${complaint.ip }</textarea></td>


			<td class="W90">查结时间</td>
			<td colspan="3"><input class="W95" type="text" id="time3" name="time3" value="${time3 }"
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate"
				style="width:150px" /></td>
		</tr>

		<tr>
			<td class="W90">处理分类</td>
			<td colspan="7"><textarea class="W300 Mar-L" name="handleSorts" rows="2" cols="90%" readonly="readonly">${handleSorts }</textarea>
				<input style="border:none; height:23px;" type="button" class="Buttn" onClick="pop(this,'handleSort','1')" value="选择">
			</td>
		</tr>

		<tr >
			<td colspan="4">扣分：&nbsp;<select class="W95" name="score">
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
			<td colspan="4">预警：&nbsp;<select class="W95" name="earlywarning">
					<option value="1" <c:if test="${complaint.earlywarning == 1 }">selected</c:if> >是</option>
					<option value="2" <c:if test="${complaint.earlywarning == 2 }">selected</c:if> >否</option>
			</select></td>
			
			
		</tr>

		<tr  height="90px;">
			<th>备<br>注</th>
			<td colspan="8"><textarea style="height:80px;" class="W820" name="remark">${complaint.remark }</textarea>
			</td>
		</tr>
		<tr>
		<td colspan="9" align="center">
			<input  style="border:none; height:23px;" class="Buttn Mt-lr" type="submit" value="提交""/> &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; 
			<input type="submit" style="border:none; height:23px;" class="Buttn-02 Mt-lr" value="保存" onclick="sub();"/>&nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;         
	        <input type="reset" style="border:none; height:23px;" class="Buttn-03 Mt-lr" value="重置"/> 
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
