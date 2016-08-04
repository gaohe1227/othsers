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
<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="model_item_save_update_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置:
		<c:choose>
			<c:when test="${param['isChannel']}">栏目</c:when>
			<c:otherwise>内容</c:otherwise>
		</c:choose>
	模型 - 添加</div>
	<form class="ropt">
		<input id="modelId" name="modelId" value="${param['modelId']}" type="hidden">
		<input id="isChannel" name="isChannel" value="${param['isChannel']}" type="hidden">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody>
<tr>
	<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>字段:</td>
	<td colspan="1" class="pn-fcontent" width="38%"><input maxlength="50" value="${modelItemInfo.field }" name="field" class="required" type="text"></td>
	<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>名称:</td>
	<td colspan="1" class="pn-fcontent" width="38%"><input maxlength="100" value="${modelItemInfo.itemLabel}" name="itemLabel" class="required" type="text"></td>
</tr>
<tr>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>数据类型:</td>
	<td colspan="1" class="pn-fcontent" width="38%">
		<select name="dataType">
			<option selected="selected" value="1">字符串文本</option>
			<option value="2">整型文本</option>
			<option value="3">浮点型文本</option>
			<option value="4">文本区</option>
			<option value="5">日期</option>
			<option value="6">下拉列表</option>
			<option value="7">复选框</option>
			<option value="8">单选框</option>
		</select>
	</td>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>排列顺序:</td>
<td colspan="1" class="pn-fcontent" width="38%"><input maxlength="10" value="${modelItemInfo.priority}"  name="priority" class="required digits" type="text"></td>
</tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">帮助信息:</td>
	<td colspan="1" class="pn-fcontent" width="38%">
	<input maxlength="255" value="${modelItemInfo.help}" name="help" type="text"></td>
	<td class="pn-flabel pn-flabel-h" width="12%">帮助位置:</td>
	<td colspan="1" class="pn-fcontent" width="38%">
	<input maxlength="10" value="${modelItemInfo.helpPosition}" name="helpPosition" class="digits" type="text"> <span class="pn-fhelp">上1，右2，下3，左4</span></td>
</tr>
<tr>
	<td class="pn-flabel pn-flabel-h" width="12%">默认值:</td>
	<td colspan="1" class="pn-fcontent" width="38%">
	<input maxlength="255" value="${modelItemInfo.defValue}" name="defValue" type="text"></td>
	<td class="pn-flabel pn-flabel-h" width="12%">宽度:</td>
	<td colspan="1" class="pn-fcontent" width="38%">
	<input maxlength="10" value="${modelItemInfo.textSize}" name="textSize" class="digits" type="text"></td>
</tr>
<tr>
	<td class="pn-flabel pn-flabel-h" width="12%">可选项:</td>
	<td colspan="3" class="pn-fcontent" width="88%">
	<input maxlength="255" value="${modelItemInfo.optValue}" name="optValue" size="70" type="text"> 
	<span class="pn-fhelp">多个值用","分开</span></td>
</tr>
<tr>
	<td class="pn-flabel pn-flabel-h" width="12%">行数:</td>
	<td colspan="1" class="pn-fcontent" width="38%">
	<input maxlength="3" value="${modelItemInfo.areaRows}" name="areaRows" class="digits" type="text">
	</td>
	<td class="pn-flabel pn-flabel-h" width="12%">列数:</td>
	<td colspan="1" class="pn-fcontent" width="38%">
	<input maxlength="3" value="${modelItemInfo.areaCols}" name="areaCols" class="digits" type="text"></td>
</tr>
<tr><td colspan="4" class="pn-fbutton">
	<input name="modelitemId" value="${modelItemInfo.modelitemId}" type="hidden">
	<input name="modelId" value="${param['modelId']}" type="hidden">
	<input name="isChannel" value="${param['isChannel']}" type="hidden">
	<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset">
</td>
</tr>
</tbody>
</table>
</form>
</div>

</body></html>