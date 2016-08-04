<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<%@ taglib uri="ModelTagLib" prefix="model" %>
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
<script type="text/javascript">
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
function optPriority() {
	var f = getTableForm();
	f.action="o_priority.do";
	f.submit();
}
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 栏目管理 - 列表</div>
	<form class="ropt">
		<input name="channelId" value="${channelId}" type="hidden">
		<select name="modelId" onchange="if(this.options[this.selectedIndex].value!=''){this.form.action='v_add.do';this.form.submit();}">
			<option selected="selected" value="">--添加子栏目--</option>
			<option value="1">新闻</option>
			<option value="2">单页</option>
			<option value="3">作品</option>
			<option value="4">下载</option>
		</select>
	</form>
	<div class="clear"></div>
</div>
<form id="tableForm" method="post">
<input name="channelId" value="${channelId}" type="hidden">
<input name="pageNo" value="" type="hidden">
<table class="pn-ltable" style="" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead"><tr>
	<th width="20"><input onclick='Pn.checkbox("ids",this.checked)' type="checkbox"></th>
	<th>ID</th>
	<th>栏目名称</th>
	<th>访问路径</th>
	<th>排列顺序</th>
	<th>显示</th>
	<th>操作选项</th></tr></thead>
<tbody class="pn-ltbody">
<c:forEach var="channel" items="${channelList}" begin="0">
<tr>
	<td><input name="ids" value="${channel.channelId }" type="checkbox"></td>
	<td>${channel.channelId }<input name="wids" value="${channel.channelId }" type="hidden"></td>
	<td>${channel.channelName} [<span style="color:red"><model:showModelName modelId="${channel.modelId}"/></span>]</td>
	<td>${channel.channelPath}</td>
	<td align="center"><input name="priority" value="${channel.priority}" style="width: 40px;" type="text"></td>
	<td align="center">
		<c:choose>
			<c:when test="${channel.isDisplay}">是</c:when>
			<c:otherwise>否</c:otherwise>
		</c:choose>
	</td>
	<td align="center">		<a href="<%=basePath %>admin/core/channel/v_edit.do?channelId=${channel.channelId}&modelId=${channel.modelId}" class="pn-opt">修改</a> | <a href="<%=basePath %>admin/core/channel/o_del.do?ids=${channel.channelId}&amp;root=" class="pn-opt" onclick="if(!confirm('您确定删除吗？')) {return false;}">删除</a></td>
</tr>
</c:forEach>
</tbody>
</table>
<div>
	<input value="删除" onclick="optDelete();" type="button">
&nbsp; <input value="保存排列顺序" onclick="optPriority();" type="button">
</div>
</form>
</div>

</body></html>