<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<%@ taglib uri="FriendlinkCtgTagLib" prefix="friendlinkctg" %>
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
	getTableForm().action="o_priority.do";
}
function setOptSelected(elementId,eValue){
	if(eValue==null){return;}
	var statusSelect = document.getElementById(elementId);
	var statusOptions= statusSelect.options;
	for(var i=0 ;i< statusOptions.length;i++){
		if(statusOptions[i].value==eValue ){
			statusOptions[i].selected='selected';
		}	
	}
}
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="friendly_link_list_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 友情链接管理 - 列表</div>
	<form class="ropt">
		<input value="添加" onclick="this.form.action='v_add.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form action="v_list.do" method="post" style="padding-top:5px;">
网站类别:
<friendlinkctg:showFriendlinkCtgSelect/>
		<script type="text/javascript">
			setOptSelected('queryCtgId',${queryCtgId});
		</script>	
<input value="查询" type="submit">
</form>
<form id="tableForm" method="post">
<table class="pn-ltable" style="" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead"><tr>
	<th width="20"><input onclick='Pn.checkbox("ids",this.checked)' type="checkbox"></th>
	<th>ID</th>
	<th>网站名称</th>
	<th>网站LOGO</th>
	<th>点击次数</th>
	<th>排列顺序</th>
	<th>显示</th>
	<th>操作选项</th></tr></thead>
<tbody class="pn-ltbody">
<c:forEach items="${friendlinkList}" var="friendlink">
<tr>
	<td><input name="ids" value="${friendlink.friendlinkId}" type="checkbox"></td>
	<td>${friendlink.friendlinkId}<input name="wids" value="${friendlink.friendlinkId}" type="hidden"></td>
	<td>${friendlink.siteName}</td>
	<td align="center"><%--${friendlink.logo}--%>无图标</td>
	<td align="right">${friendlink.views}</td>
	<td align="center"><input name="priority" value="${friendlink.priority}" style="width: 70px;" type="text"></td>
	<td align="center"><c:choose><c:when test="${friendlink.isEnabled}">是</c:when><c:otherwise>否</c:otherwise></c:choose></td>
	<td align="center">		<input name="queryCtgId" value="${friendlink.friendlinkctgId}" type="hidden">
		<a href="<%=basePath %>admin/assistant/friendlink/v_edit.do?id=${friendlink.friendlinkId}&amp;pageNo=" class="pn-opt">修改</a> | <a href="<%=basePath %>admin/assistant/friendlink/o_del.do?ids=${friendlink.friendlinkId}&amp;pageNo=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a></td>
</tr>
</c:forEach>
</tbody>
</table>
<div>
	<input value="删除" onclick="optDelete();" type="button">
&nbsp; <input value="保存排列顺序" onclick="optPriority();" type="submit">
</div>
</form>
</div>

</body></html>