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
<style type="text/css">
.params{padding-top:5px;}
</style>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="ad_position_save_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 广告版位 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="20%"><span class="pn-frequired">*</span>名称:</td><td class="pn-fcontent" width="80%"><input maxlength="100" name="adName" value="${advertisingSpace.adName}" class="required" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="20%">描述:</td><td class="pn-fcontent" width="80%"><textarea cols="50" rows="3" name="description" maxlength="255">${advertisingSpace.adName}</textarea>
</td></tr><tr><td class="pn-flabel pn-flabel-h" width="20%"><span class="pn-frequired">*</span>启用:</td><td class="pn-fcontent" width="80%"><label><input value="true" <c:if test="${advertisingSpace.isEnabled==1}">checked="checked"</c:if>  name="isEnabled"  class="required" type="radio">是</label> <label><input value="false" <c:if test="${advertisingSpace.isEnabled==0}">checked="checked"</c:if> name="isEnabled" class="required" type="radio">否</label></td></tr><tr>
<td colspan="2" class="pn-fbutton">
	<input name="adspaceId"  value="${advertisingSpace.adspaceId}"  type="hidden">
	<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset">
</td></tr></tbody></table>
</form>
</div>

</body></html>