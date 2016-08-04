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
function optPriority() {
	var f = getTableForm();
	f.action="o_priority.do";
	f.submit();
}
</script>
<script type="text/javascript">
	function showMessage(){
		$.messager.show({title:'提示:',msg:'模型信息更改成功!',timeout:4000,showType:'slide'});
	}
	function showErrorMessage(){
		$.messager.show({title:'提示:',msg:'操作失败!请检查是否还有相关数据!',timeout:4000,showType:'slide'});
	}	
</script>
<style type="text/css">
.disabled{background-color:#ccc}
</style>
</head>
<body>
	<c:if test="${status==true}">
		<script type="text/javascript">
			showMessage();
		</script>
	</c:if>	
	<c:if test="${param['dstatus']}">
		<script type="text/javascript">
			showErrorMessage();
		</script>
	</c:if>		
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 模型管理 - 列表</div>
	<form class="ropt">
		<input value="添加" onclick="this.form.action='v_add.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form id="tableForm" method="post">
<table class="pn-ltable" style="" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead"><tr>
	<th width="20"><input onclick='Pn.checkbox("ids",this.checked)' type="checkbox"></th>
	<th>ID</th>
	<th>模型名称</th>
	<th>栏目模板前缀</th>
	<th>内容模板前缀</th>
	<th>排列顺序</th>
	<th>默认</th>
	<th>启用</th>
	<th>操作选项</th></tr></thead>
	
<tbody class="pn-ltbody">
<c:forEach items="${modelList}" var="model" begin="0">
<tr>
	<td><input name="ids" value="${model.modelId }" type="checkbox"></td>
	<td>${model.modelId }</td>
	<td>${model.modelName }(${model.priority})</td>
	<td>${model.tplChannelPrefix}</td>
	<td>${model.tplContentPrefix }</td>
	<td align="center">		
	    <input name="priority" value="${model.priority}" style="width: 40px;" type="text">
		<input name="wids" value="${model.modelId}" type="hidden">
	</td>
	
	<td align="center">
		<c:choose>
			<c:when test="${model.isDef}">
				<input name="defId" value="${model.modelId}" checked="checked" type="radio">
			</c:when>
			<c:otherwise>
				<input name="defId" value="${model.modelId}"  type="radio">
			</c:otherwise>
		</c:choose>
	</td>
	
	<td align="center">		
		<c:choose>
			<c:when test="${model.isDisabled}">
				<input onclick="$('#disabled${model.modelId}').val(!this.checked)"  type="checkbox">
				<input id="disabled${model.modelId}" name="disabled" value="true" type="hidden">
			</c:when>
			<c:otherwise>
				<input onclick="$('#disabled${model.modelId}').val(!this.checked)" checked="checked" type="checkbox">
				<input id="disabled${model.modelId}" name="disabled" value="false" type="hidden">
			</c:otherwise>
		</c:choose>	

	</td>
	<td align="center">		
	    <a href="<%=basePath%>/admin/core/config/model/v_edit.do?modelId=${model.modelId }" class="pn-opt">修改</a> | 		<a href="<%=basePath%>/admin/core/config/modelItem/v_list.do?modelId=${model.modelId }&amp;isChannel=true" class="pn-opt">栏目模型</a> | 		<a href="<%=basePath%>/admin/core/config/modelItem/v_list.do?modelId=${model.modelId }&amp;isChannel=false" class="pn-opt">内容模型</a> | <a href="<%=basePath%>/admin/core/config/model/o_del.do?ids=${model.modelId }" class="pn-opt" onclick="if(!confirm('您确定删除吗？')) {return false;}">删除</a></td>
</tr>
</c:forEach>

</tbody>
</table>
<div>
	<input value="删除" onclick="optDelete();" type="button">
&nbsp;<input value="保存排列顺序" onclick="optPriority();" type="button">
</div>
</form>
</div>

</body></html>