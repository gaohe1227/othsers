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
<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="member_group_save_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 会员组管理 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>名称:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="100" value="${group.groupName }" name="groupName" class="required" type="text"></td><td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>排列顺序:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="10" value="${group.priority }" name="priority" class="required digits" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>每日附件总尺寸:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="10" value="${group. allowPerDay}"  name="allowPerDay" class="required digits" style="width: 70px;" type="text"> <span class="pn-fhelp">0为不限制，单位(KB)</span></td><td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>最大附件尺寸:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="10" value="${group.allowMaxFile }" name="allowMaxFile" class="required digits" style="width: 70px;" type="text"> <span class="pn-fhelp">0为不限制，单位(KB)</span></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="15%">允许上传的后缀:</td><td colspan="3" class="pn-fcontent" width="85%"><input maxlength="255" value="${group.allowSuffix}" name="allowSuffix" style="width: 350px;" type="text"> <span class="pn-fhelp">留空则不限制，多个用","分开</span></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="15%">评论需要审核:</td>
<td colspan="1" class="pn-fcontent" width="35%">
<c:choose>
	<c:when test="${group.needCheck}">
	<label><input value="true" checked="checked" name="needCheck" type="radio">是</label>
	<label><input value="false" name="needCheck" type="radio">否</label>	
	</c:when>
	<c:otherwise>
	<label><input value="true"  name="needCheck"   type="radio">是</label>
	<label><input value="false" name="needCheck" checked="checked" type="radio">否</label>
	</c:otherwise>
</c:choose>
	</td>		

<td class="pn-flabel pn-flabel-h" width="15%">评论需要验证码:</td>
<td colspan="1" class="pn-fcontent" width="35%">
<c:choose>
	<c:when test="${group.needCaptcha}">
	<label><input value="true" checked="checked" name="needCaptcha" type="radio">是</label>
	<label><input value="false" name="needCaptcha" type="radio">否</label>	
	</c:when>
	<c:otherwise>
	<label><input value="true" name="needCaptcha" type="radio">是</label>
	<label><input value="false" checked="checked"  name="needCaptcha" type="radio">否</label>	
	</c:otherwise>
</c:choose>	
</td>		
	
</tr>
<tr><td colspan="4" class="pn-fbutton">
<input type="hidden" name="groupId" value="${group.groupId }"/>
<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset"></td>
</tr></tbody></table>
</form>
</div>

</body></html>