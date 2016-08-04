<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<%@ taglib uri="DataTypeTagLib" prefix="dataType" %>
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
function optSave() {
	var f = getTableForm();
	f.action="o_save_list.do";
	f.submit();
}
function optSaveOrder() {
	var f = getTableForm();
	f.action="o_priority.do";
	f.submit();
}
function backToList(o) {
	o.form.action='../model/v_list.do';
	$('#modelId').attr('disabled','disabled');
	$('#isChannel').attr('disabled','disabled');
}
function disInput(o) {
	if(o.checked) {
		$(o).parent().parent().find('.dis').each(function(){$(this).removeAttr('disabled');});
	} else {	
		$(o).parent().parent().find('.dis').each(function(){$(this).attr('disabled','disabled');});
	}
}
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="channel_model_item_list_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置:
	    <c:choose>
			<c:when test="${param['isChannel']}">栏目</c:when>
			<c:otherwise>内容</c:otherwise>
		</c:choose>模型 - 列表 - <span style="color:red">新闻</span></div>
	<form class="ropt">
		<input id="modelId" name="modelId" value="${param['modelId']}" type="hidden">
		<input id="isChannel" name="isChannel" value="${param['isChannel']}" type="hidden">
		<input value="添加" onclick="this.form.action='v_add.do';" type="submit">
&nbsp; <input value="返回列表" onclick="backToList(this);" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form id="tableForm" method="post">
<input name="modelId" value="${param['modelId']}" type="hidden">
<input name="isChannel" value="${param['isChannel']}" type="hidden">
<table class="pn-ltable" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead">
<tr>
	<th width="20"><input onclick='Pn.checkbox("ids",this.checked)' type="checkbox"></th>
	<th>字段</th>
	<th>数据类型</th>
	<th>名称</th>
	<th>排列顺序</th>
	<th>独占一行</th>
	<th>显示</th>
	<th>操作选项</th>
</tr>
</thead>
<tbody class="pn-ltbody">
<c:forEach items="${modelItemList}" var="modelItem" begin="0">
<tr>
	<td><input name="ids" value="${modelItem.modelitemId}" type="checkbox"></td>
	<td align="center">${modelItem.field }</td>
	<td align="center"><dataType:showLabel dataTypeValue="${modelItem.dataType }"/></td>
	<td align="center"><input name="itemLabel" value="${modelItem.itemLabel }" style="width: 100px;" type="text"></td>
	<td align="center">
		<input name="priority" value="${modelItem.priority }" style="width: 40px;" type="text">
		<input name="wids" value="${modelItem.modelitemId}" type="hidden">
	</td>
	<td align="center">
		<c:choose>
			<c:when test="${modelItem.isSingle}">
				<input onclick="$('#single${modelItem.modelitemId}').val(this.checked)" checked="checked"  type="checkbox">
				<input id="single${modelItem.modelitemId}" name="single" value="true" type="hidden">
			</c:when>
			<c:otherwise>
				<input onclick="$('#single${modelItem.modelitemId}').val(this.checked)"  type="checkbox">
				<input id="single${modelItem.modelitemId}" name="single" value="false" type="hidden">
			</c:otherwise>
		</c:choose>	
			

	</td>
	<td align="center">
		<c:choose>
			<c:when test="${modelItem.isDisplay}">
				<input onclick="$('#display${modelItem.modelitemId}').val(this.checked)" checked="checked"  type="checkbox">
				<input id="display${modelItem.modelitemId}" name="display" value="true" type="hidden">
			</c:when>
			<c:otherwise>
				<input onclick="$('#display${modelItem.modelitemId}').val(this.checked)"  type="checkbox">
				<input id="display${modelItem.modelitemId}" name="display" value="false" type="hidden">
			</c:otherwise>
		</c:choose>		
		
	</td>
	<td align="center">
		<a href="<%=basePath %>/admin/core/config/modelItem/v_edit.do?modelId=${param['modelId']}&isChannel=${param['isChannel']}&modelItemId=${modelItem.modelitemId }" class="pn-opt">修改</a> |
		<a href="<%=basePath %>/admin/core/config/modelItem/o_del.do?ids=${modelItem.modelitemId }&amp;modelId=${param['modelId']}&amp;isChannel=${param['isChannel']}" class="pn-opt" onclick="if(!confirm('您确定删除吗？')) {return false;}">删除</a>
 	</td>
</tr>
</c:forEach>

<tr id="sysDefModel" style=""><td colspan="8">系统默认字段:</td></tr>
<tr>
	<td><input onclick="disInput(this);" checked="checked" type="checkbox"></td>
	<td class="dis" align="center">contentImg</td>
	<td class="dis" align="center">字符串文本</td>
	<td align="center"><input class="dis" name="labels" value="内容图" style="width: 100px;" type="text"></td>
	<td align="center"><input class="dis" name="prioritys" value="10" style="width: 40px;" type="text"></td>
	<td align="center">
		<input class="dis" checked="checked" onclick="$('#singles1').val(this.checked)" type="checkbox">
		<input class="dis" id="singles1" name="singles" value="true" type="hidden">
	</td>
	<td align="center">
		<input class="dis" checked="checked" onclick="$('#displays1').val(this.checked)" type="checkbox">
		<input class="dis" id="displays1" name="displays" value="true" type="hidden">
	</td>
	<td align="center">
		<input class="dis" name="fields" value="contentImg" type="hidden">
		<input class="dis" name="dataTypes" value="1" type="hidden">
	</td>
</tr>
<tr>
	<td><input onclick="disInput(this);" checked="checked" type="checkbox"></td>
	<td class="dis" align="center">txt</td>
	<td class="dis" align="center">文本区</td>
	<td align="center"><input class="dis" name="labels" value="内容" style="width: 100px;" type="text"></td>
	<td align="center"><input class="dis" name="prioritys" value="10" style="width: 40px;" type="text"></td>
	<td align="center">
		<input class="dis" checked="checked" onclick="$('#singles2').val(this.checked)" type="checkbox">
		<input class="dis" id="singles2" name="singles" value="true" type="hidden">
	</td>
	<td align="center">
		<input class="dis" checked="checked" onclick="$('#displays2').val(this.checked)" type="checkbox">
		<input class="dis" id="displays2" name="displays" value="true" type="hidden">
	</td>
	<td align="center">
		<input class="dis" name="fields" value="txt" type="hidden">
		<input class="dis" name="dataTypes" value="4" type="hidden">
	</td>
</tr>
<tr>
	<td><input onclick="disInput(this);" checked="checked" type="checkbox"></td>
	<td class="dis" align="center">txt1</td>
	<td class="dis" align="center">文本区</td>
	<td align="center"><input class="dis" name="labels" value="内容1" style="width: 100px;" type="text"></td>
	<td align="center"><input class="dis" name="prioritys" value="10" style="width: 40px;" type="text"></td>
	<td align="center">
		<input class="dis" checked="checked" onclick="$('#singles3').val(this.checked)" type="checkbox">
		<input class="dis" id="singles3" name="singles" value="true" type="hidden">
	</td>
	<td align="center">
		<input class="dis" checked="checked" onclick="$('#displays3').val(this.checked)" type="checkbox">
		<input class="dis" id="displays3" name="displays" value="true" type="hidden">
	</td>
	<td align="center">
		<input class="dis" name="fields" value="txt1" type="hidden">
		<input class="dis" name="dataTypes" value="4" type="hidden">
	</td>
</tr>
<tr>
	<td><input onclick="disInput(this);" checked="checked" type="checkbox"></td>
	<td class="dis" align="center">txt2</td>
	<td class="dis" align="center">文本区</td>
	<td align="center"><input class="dis" name="labels" value="内容2" style="width: 100px;" type="text"></td>
	<td align="center"><input class="dis" name="prioritys" value="10" style="width: 40px;" type="text"></td>
	<td align="center">
		<input class="dis" checked="checked" onclick="$('#singles4').val(this.checked)" type="checkbox">
		<input class="dis" id="singles4" name="singles" value="true" type="hidden">
	</td>
	<td align="center">
		<input class="dis" checked="checked" onclick="$('#displays4').val(this.checked)" type="checkbox">
		<input class="dis" id="displays4" name="displays" value="true" type="hidden">
	</td>
	<td align="center">
		<input class="dis" name="fields" value="txt2" type="hidden">
		<input class="dis" name="dataTypes" value="4" type="hidden">
	</td>
</tr>
<tr>
	<td><input onclick="disInput(this);" checked="checked" type="checkbox"></td>
	<td class="dis" align="center">txt3</td>
	<td class="dis" align="center">文本区</td>
	<td align="center"><input class="dis" name="labels" value="内容3" style="width: 100px;" type="text"></td>
	<td align="center"><input class="dis" name="prioritys" value="10" style="width: 40px;" type="text"></td>
	<td align="center">
		<input class="dis" checked="checked" onclick="$('#singles5').val(this.checked)" type="checkbox">
		<input class="dis" id="singles5" name="singles" value="true" type="hidden">
	</td>
	<td align="center">
		<input class="dis" checked="checked" onclick="$('#displays5').val(this.checked)" type="checkbox">
		<input class="dis" id="displays5" name="displays" value="true" type="hidden">
	</td>
	<td align="center">
		<input class="dis" name="fields" value="txt3" type="hidden">
		<input class="dis" name="dataTypes" value="4" type="hidden">
	</td>
</tr>

</tbody>
</table>

<div>
	<input value="保存系统默认字段" onclick="optSave();" type="button">
&nbsp;<script type="text/javascript">$('#sysDefModel').show();</script>
<input value="删除" onclick="optDelete();" type="button">
&nbsp; <input value="保存内容" onclick="optSave();" type="button">
</div>

</form>
</div>

</body></html>