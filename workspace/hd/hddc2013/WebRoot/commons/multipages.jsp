<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/taglibs.jsp"%>
<!-- {initParam.pageSize} -->
<c:set var="total" value="${pager.maxElements}" />
<pg:pager url="${ctx}${actionPath }"
	export="currentPageNumber=pageNumber" items="${total}"
	maxPageItems="${pager.pageSize}" maxIndexPages="10" isOffset="true">
	<pg:first>
   <a href="${pageUrl }" onclick="return post(this)">首页</a>
  </pg:first>
  <pg:prev>
   <a href="${pageUrl }" onclick="return post(this)">上一页</a>
  </pg:prev>
  <pg:pages>
   <c:choose>
    <c:when test="${currentPageNumber eq pageNumber}">
     <font color="red">${pageNumber }</font>
    </c:when>
    <c:otherwise>
     <a href="${pageUrl }" onclick="return post(this)" style="border :1px solid #999;">${pageNumber }</a>
    </c:otherwise>
   </c:choose>
  </pg:pages>
  <pg:next>
   <a href="${pageUrl }" onclick="return post(this)">下一页</a>
  </pg:next>
  <pg:last>
   <a href="${pageUrl }" onclick="return post(this)">尾页</a>
  </pg:last>
  
</pg:pager>
<form id="form110" method="post"><!-- 注:form1.action中 ?pager.offset=x 仍为get方式(所以不能将中文参数追加在form1.action后面),
                                         form中的input域为post方式 -->
                                         
                                         
                                         
	<c:forEach items="${paramMap}" var="entry">
		<input type="hidden" name="${entry.key }" value="${entry.value }"/>
	</c:forEach>
</form>
<script type="text/javascript">
<!--
	function post(a){
		form110.action=a.href;
		//a.href='#';
		form110.submit();
		return false;//很重要,使超链接请求不发送
	}
//-->
</script>

