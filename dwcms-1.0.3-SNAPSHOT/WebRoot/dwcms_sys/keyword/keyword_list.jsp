<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
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
$(function() {
	$("#jvForm").validate();
	$(getTableForm()).validate();
});
function getTableForm() {
	return document.getElementById('tableForm');
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
function optSaveContent() {
	var f = getTableForm();
	f.action="o_update.do";
	f.submit();
}
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="keyword_list_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 关键词管理 - 列表</div>
	<form class="ropt">
	</form>
	<div class="clear"></div>
</div>
<form id="jvForm" action="o_save.do" method="post" style="padding:5px 0 0 5px">
关键词:<input name="keywordName" class="required" maxlength="255" style="width: 120px;" type="text">
替换内容:<input name="url" class="required" maxlength="255" style="width: 500px;" type="text">
<input value="添加" type="submit">
</form>
<form id="tableForm" method="post">
<input name="pageNo" value="" type="hidden">
<table class="pn-ltable" style="" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead"><tr>
	<th width="20"><input onclick='Pn.checkbox("ids",this.checked)' type="checkbox"></th>
	<th>ID</th>
	<th>关键词</th>
	<th>替换内容</th>
	<th>启用</th>
	<th>操作选项</th></tr></thead>
<tbody class="pn-ltbody">
<c:forEach items="${keywordList}" var="keyword" varStatus="status">
<tr>
	<td><input name="ids" value="${keyword.keywordId }" type="checkbox"></td>
	<td>${keyword.keywordId }<input name="id"  value=" ${keyword.keywordId }" type="hidden"></td>
	<td align="center"><input name="name" value="${keyword.keywordName }" class="required" maxlength="255" style="width: 120px;" type="text"></td>
	<td align="center"><input name="url" value="<c:out value="${keyword.url }" escapeXml="true"></c:out>" class="required" maxlength="255" style="width: 500px;" type="text"></td>
	<td align="center">
	<input <c:if test="${keyword.isDisabled==false}">checked="checked"</c:if> onclick="$('#disabled${status.index}').val(!this.checked)" type="checkbox"> <input id="disabled${status.index}" name="disabled" value="false" type="hidden"></td>
	<td align="center"><a  href="<%=basePath %>admin/maintain/keyword/o_del.do?ids=${keyword.keywordId }" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a></td>
</tr>
</c:forEach>
</tbody>
</table>
<div>
	<input value="删除" onclick="optDelete();" type="button">
&nbsp; <input value="保存内容" onclick="optSaveContent();" type="button">
</div>
</form>
</div>

</body></html>