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
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 后台操作日志 - 列表</div>
	<form class="ropt" action="o_delete_operating_batch.do" method="post">
		<span>批量删除: </span>
		<select name="days">
			<option selected="selected" value="365">一年前日志</option>
			<option value="90">一季前日志</option>
			<option value="30">一月前日志</option>
			<option value="7">一周前日志</option>
			<option value="0">所有日志</option>
		</select>
		<input value="提交" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form action="v_list.do" method="post" style="padding-top:5px;">
	用户: <input name="queryUsername" value="${queryUsername}"  style="width: 100px;" type="text">
	标题: <input name="queryTitle" value="${queryTitle}"  style="width: 150px;" type="text">
	IP: <input name="queryIp" value="${queryIp}" style="width: 150px;" type="text">
	<input value="查询" type="submit">
</form>
<form id="tableForm" method="post">
<input name="pageNo" value="${page.currentPage}" type="hidden">
<input name="queryUsername" value="${queryUsername}" type="hidden">
<input name="queryTitle" value="${queryTitle}" type="hidden">
<input name="queryIp" value="${queryIp}" type="hidden">
<table class="pn-ltable" style="" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead"><tr>
	<th width="20"><input onclick='Pn.checkbox("ids",this.checked)' type="checkbox"></th>
	<th>ID</th>
	<th>用户</th>
	<th>时间</th>
	<th>IP</th>
	<th>标题</th>
	<th>内容</th>
	<th>操作选项</th></tr></thead>
<tbody class="pn-ltbody">
<c:forEach items="${logList}" var="log">
<tr>
	<td><input name="ids" value="${log.logId }" type="checkbox"></td>
	<td>${log.logId }</td>
	<td align="center">${log.userName}</td>
	<td align="center"><fmt:formatDate value="${log.logTime }"  type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	<td align="center">${log.ip}</td>
	<td align="center">${log.title }</td>
	<td>${log.content }</td>
	<td align="center"><a href="<%=basePath %>admin/core/member/log/o_del.do?ids=${log.logId }&amp;pageNo=1&amp;queryUsername=&amp;queryTitle=&amp;queryIp=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a></td>
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
<div><input value="删除" onclick="optDelete();" type="button"></div>
</form>
</div>

</body></html>