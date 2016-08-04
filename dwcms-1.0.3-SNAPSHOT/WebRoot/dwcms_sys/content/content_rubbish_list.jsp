<%@ include file="/res/common/jsp/jsp_defined.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
		<link href="<%=basePath%>res/dwcms/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>res/dwcms/css/theme.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/thirdparty/jquery-easyui/themes/icon.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/thirdparty/jquery-easyui/themes/dark-hive/easyui.css" id="swicth-style">
		<script type="text/javascript" src="<%=basePath%>/thirdparty/jquery-easyui/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/thirdparty/jquery-easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/pony.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.ext.js"></script>
<script type="text/javascript">
function getTableForm() {
	return document.getElementById('tableForm');
}
function optRecycle() {
	if(Pn.checkedCount('ids')<=0) {
		alert("请选择您要操作的数据");
		return;
	}
	var f = getTableForm();
	f.action="o_recycle.do";
	f.submit();
}
function optDelete() {
	if(Pn.checkedCount('ids')<=0) {
		alert("请选择您要操作的数据");
		return;
	}
	if(!confirm("您确定删除吗？")) {
		return;
	}
	var f = getTableForm();
	f.action="o_del.do";
	f.submit();
}
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 内容回收站 - 列表</div>
	<form class="ropt">
	</form>
	<div class="clear"></div>
</div>
<form action="v_list.do" method="post" style="padding-top:5px;">
<div>
标题: <input name="queryTitle" style="width: 100px;" value="${queryTitle}" type="text">
发布者: <input name="queryInputUsername" value="${queryInputUsername}" style="width: 70px;" type="text">
<input name="queryStatus" value="${queryStatus}" type="hidden">
<input value="查询" type="submit">
</div>
</form>
<form id="tableForm" method="post">
<input name="pageNo" value="${page.currentPage }" type="hidden">
<input name="cid" value="" type="hidden">
<input name="queryStatus" value="recycle" type="hidden">
<input name="queryTitle" style="width: 100px;" value="${queryTitle}" type="hidden">
<input name="queryInputUsername" value="${queryInputUsername}" style="width: 70px;" type="hidden">
<table class="pn-ltable" style="" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead"><tr>
	<th width="20"><input onclick='Pn.checkbox("ids",this.checked)' type="checkbox"></th>
	<th>ID</th>
	<th>标题</th>
	<th>类型</th>
	<th>发布者</th>
	<th>点击</th>
	<th>发布时间</th>
	<th>状态</th>
	<th>操作选项</th></tr></thead>
<tbody class="pn-ltbody">
<c:forEach items="${contentDtoList}" var="contentDto" begin="0">
<tr>
	<td><input name="ids" value="${contentDto.contentId}" type="checkbox"></td>
	<td>${contentDto.contentId}</td>
	<td>		
		<c:if test="${contentDto.isRecommend}">
		<span style="color:red">[推]</span>
		</c:if>
		<strong>[${contentDto.channelName}]</strong>
		<a href="${ctx}/v_article.vm?contentId=${contentDto.contentId}" target="_blank">${contentDto.title }</a>
</td>
	<td align="center">${contentDto.typeName}</td>
	<td align="center">${contentDto.author}</td>
	<td align="right">${contentDto.views}</td>
	<td align="center"><fmt:formatDate value="${contentDto.releaseDate}" type="both"/> </td>
	<td align="center">${contentDto.statusName}		
</td>
	<td align="center">		 		<a href="<%=basePath%>/admin/core/content/o_recycle.do?ids=${contentDto.contentId}&amp;pageNo=${page.currentPage }&amp;queryTitle=${queryTitle}&amp;queryInputUsername=${queryInputUsername}&amp;queryStatus=${queryStatus}" class="pn-opt">还原</a> | 		<a href="<%=basePath%>/admin/core/content/o_del.do?ids=${contentDto.contentId}&amp;pageNo=${page.currentPage }&amp;queryTitle=${queryTitle}&amp;queryInputUsername=${queryInputUsername}&amp;queryStatus=${queryStatus}&amp;" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
		</td>
</tr>
</c:forEach>
</tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr><td class="pn-sp" align="center">
${page.pageStr }
</td></tr></tbody></table>
<script type="text/javascript">
function _gotoPage(pageNo) {
	try{
		var tableForm = getTableForm();
		$("input[name=pageNo]").val(pageNo);
		tableForm.action="v_list.do";
		tableForm.onsubmit=null;
		tableForm.submit();
	} catch(e) {
		alert('_gotoPage(pageNo)方法出错');
	}
}
</script>
<div>
	<input value="删除" onclick="optDelete();" type="button">
	<input value="还原" onclick="optRecycle();" type="button">
</div>
</form>
</div>

</body></html>