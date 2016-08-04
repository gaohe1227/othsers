<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
		<link href="<%=basePath%>res/dwcms/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>res/dwcms/css/theme.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/thirdparty/jquery-easyui/themes/icon.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/thirdparty/jquery-easyui/themes/dark-hive/easyui.css" id="swicth-style">
		<script type="text/javascript" src="<%=basePath%>/thirdparty/jquery-easyui/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/thirdparty/jquery-easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctx}/thirdparty/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/pony.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.ext.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.colorpicker.js"></script>		
		<script type="text/javascript" src="<%=basePath%>res/common/js/ajaxfileupload.js"></script>	
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
<body>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 采集管理 - 列表</div>
	<form class="ropt">
		<input type="submit" value="添加" onclick="this.form.action='v_add.do';"/>
	</form>
	<div class="clear"></div>
</div>
<form id="tableForm" method="post">
<input type="hidden" name="pageNo" value=""/>
<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0">
<thead class="pn-lthead"><tr>
	<th width="20"><input type='checkbox' onclick='Pn.checkbox("ids",this.checked)'/></th>
	<th>ID</th>
	<th>采集名称</th>
	<th>状态</th>
	<th>当前/总 页数</th>
	<th>开始时间</th>
	<th>结束时间</th>
	<th>操作选项</th></tr></thead>
<tbody  class="pn-ltbody">
<c:forEach items="${acqList }" var="acq" begin="0" >
<tr>
	<td><input type='checkbox' name='ids' value='${acq.acquisitionId }'/></td>
	<td>${acq.acquisitionId }</td>
	<td>${acq.acqName }</td>
	<td align="center">${acq.statusName }</td>
	<td align="center">${acq.currNum}/${acq.dynamicEnd }</td>
	<td align="center"><fmt:formatDate value="${acq.startTime}"  type="date" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	<td align="center"><fmt:formatDate value="${acq.endTime}"  type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	<td align="center">	
	<c:choose>
		<c:when test="${acq.status==1 }">
			开始 | 
			<a href="o_pause.do?id=${acq.acquisitionId }" class="pn-opt">暂停</a> |  
			<a href="o_end.do?id=${acq.acquisitionId }" class="pn-opt">停止</a>  |  
		</c:when>
		<c:otherwise>
			<a href="o_start.do?id=${acq.acquisitionId }" class="pn-opt">开始</a> | 暂停 | 停止 | 		
		</c:otherwise>
	</c:choose>	
	<a href="v_edit.do?id=${acq.acquisitionId }" class="pn-opt">修改</a> | <a href="o_del.do?ids=${acq.acquisitionId }" class="pn-opt" onclick="if(!confirm('您确定删除吗？')) {return false;}">删除</a></td>
</tr>
</c:forEach>
</tbody>
</table>
<div><input type="button" value="删除" onclick="optDelete();"/></div>
</form>
</div>
</body>
</html>