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
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="v_list.do_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 敏感词管理 - 列表</div>
	<form class="ropt">
	</form>
	<div class="clear"></div>
</div>
<form id="jvForm" action="o_save.do" method="post" style="padding:5px 0 0 5px">
敏感词:<input name="search" class="required" maxlength="255" type="text">
替换为:<input name="replacement" class="required" maxlength="255" type="text">
<input value="添加" type="submit">
</form>
<form id="tableForm" method="post">
<table class="pn-ltable" style="" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead"><tr>
	<th width="20"><input onclick='Pn.checkbox("ids",this.checked)' type="checkbox"></th>
	<th>ID</th>
	<th>敏感词</th>
	<th>替换为</th>
	<th>操作选项</th></tr></thead>
<tbody class="pn-ltbody">
<c:forEach items="${sensitivityList}" var="sensitivity" varStatus="status">
<tr>
	<td><input name="ids" value="${sensitivity.sensitivityId}" type="checkbox"></td>
	<td>${sensitivity.sensitivityId}<input name="id" value="${sensitivity.sensitivityId}" type="hidden"></td>
	<td align="center"><input name="search" value="${sensitivity.search}" type="text"></td>
	<td align="center"><input name="replacement" value="${sensitivity.replacement}" type="text"></td>
	<td align="center"><a href="<%=basePath %>/admin/maintain/sensitivity/o_del.do?ids=${sensitivity.sensitivityId}" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a></td>
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