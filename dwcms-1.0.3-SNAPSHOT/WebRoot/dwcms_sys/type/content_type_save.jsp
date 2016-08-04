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
});
</script>		
<script type="text/javascript">
function showMessage(){
	$.messager.show({title:'提示:',msg:'信息已保存',timeout:4000,showType:'slide'});
}
</script>
</head>
<body>
	<c:if test="${status==true}">
		<script type="text/javascript">
			showMessage();
		</script>
	</c:if>
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="content_type_save_update_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 内容类型 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>ID:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="5" value="${contentTypeInfo.typeId}" name="typeId" class="required digits" type="text"></td><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>名称:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="150" value="${contentTypeInfo.typeName}" name="typeName" class="required" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>有图片:</td><td colspan="1" class="pn-fcontent" width="38%">
<c:choose>
<c:when test="${contentTypeInfo.hasImage}">
<label><input value="true"  checked="checked" name="hasImage" type="radio">是</label> 
<label><input value="false" name="hasImage" type="radio">否</label>
</c:when>
<c:otherwise>
<label><input value="true" name="hasImage" type="radio">是</label> 
<label><input value="false" checked="checked" name="hasImage" type="radio">否</label>
</c:otherwise>
</c:choose>

</td>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>禁用:</td><td colspan="1" class="pn-fcontent" width="38%">
<c:choose>
	<c:when test="${contentTypeInfo.isDisabled}">
<label><input value="true"  checked="checked" name="isDisabled" type="radio">是</label> 
<label><input value="false"  name="isDisabled" type="radio">否</label>	
	</c:when>
	<c:otherwise>
<label><input value="true" name="isDisabled" type="radio">是</label> 
<label><input value="false" checked="checked" name="isDisabled" type="radio">否</label>	
	</c:otherwise>
</c:choose>

</td>
</tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>图片宽度:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="5" value="${contentTypeInfo.imgWidth}" name="imgWidth" class="required digits" type="text"></td><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>图片高度:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="150" value="${contentTypeInfo.imgHeight}" name="imgHeight" class="required" type="text"></td></tr>
<tr><td colspan="4" class="pn-fbutton">
<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset"></td>
</tr></tbody></table>
</form>
</div>

</body></html>