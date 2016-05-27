<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/commons/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'MyJsp.jsp' starting page</title>
<link rel="stylesheet" type="text/css" href="${ctx }/css/Admin.css" />


</head>

<body>
	<div class="R-CON" align="center">
	<br><br>
		<form action="${ctx }/manage/complaint/feed!update.action"
			method="post">
			<input name="complaintid" value="${complaint.complaintid }"
				type="hidden"> <input type="hidden" name="id"
				value="${fd.feedbackid }" />
			<table>
				<tr>
					<td width="20%">案件编号：</td>
					<td>${complaint.sno }</td>
				</tr>
				<tr height="150px;">
					<td>信<br>息<br>反<br>馈</td>
				
					<td><textarea name="message" rows="10" cols="150%">${fd.message }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
