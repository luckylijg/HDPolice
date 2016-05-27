<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="taglibs.jsp"%> <%--<%@include file="/commons/taglibs.jsp"%> --%>
<!-- {initParam.pageSize} -->
<c:set var="total" value="${requestScope['pager'].maxElements}" />
<pg:pager url="${ctx}/manager/${strPath}"
	export="currentPageNumber=pageNumber" items="${total}"
	maxPageItems="${initParam.pageSize}" maxIndexPages="10" isOffset="true">
	<pg:index>
		<pg:first unless="current">
			<a href="${pageUrl}&p=${pageNumber}&action=list">首页</a>
		</pg:first>
		<pg:prev>
			<a href="${pageUrl}&p=${pageNumber}&action=list">上一页(${pageNumber})</a>
		</pg:prev>
		<pg:pages>
			<a href="${pageUrl}&p=${pageNumber}&action=list">${pageNumber}</a>
		</pg:pages>

		<pg:next>
			<a href="${pageUrl}&p=${pageNumber}&action=list">下一页(${pageNumber})</a>
		</pg:next>
		<pg:last unless="current">
			<a href="${pageUrl}&p=${pageNumber}&action=list">尾页</a>
		</pg:last>

		<pg:page>
			<input type='text' name='gotoSomePage' size='2' height='16'
				onKeydown='if (event.keyCode==13) {submitGotoPage(this.value); return false;}'>&nbsp;<a
				href="javascript:submitGotoPage(gotoSomePage.value)" class=button>GO</a> &nbsp;&nbsp;&nbsp;&nbsp;当前是：第${currentPageNumber}页 共${requestScope['pager'].maxPages}页/${total}条 ${initParam.pageSize}条/页
        </pg:page>
		<script type="text/javascript">
	    function submitGotoPage(page){
              var offset = eval(Number('${initParam.pageSize}')*(page-1));
 		      var url = "${pageUrl}?pager.offset="+offset+"&p="+page+"&action=list";
        	  window.location.href=url;
		}

	</script>
	</pg:index>
</pg:pager>

