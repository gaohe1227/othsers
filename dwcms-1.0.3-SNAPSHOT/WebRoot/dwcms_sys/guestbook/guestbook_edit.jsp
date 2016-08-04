<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<%@ taglib uri="GuestbookCtgTagLib" prefix="guestbookctg" %>
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
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 留言管理 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>留言类别:</td><td colspan="3" class="pn-fcontent" width="88%">
<guestbookctg:showGustbookCtgSelect/>
		<script type="text/javascript">
			setOptSelected('guestbookctgId',${guestbookDto.guestbookctgId});
		</script>	
</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">标题:</td><td colspan="3" class="pn-fcontent" width="88%"><input maxlength="255" name="title" value="${guestbookDto.title}" size="70" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">留言内容:</td><td colspan="3" class="pn-fcontent" width="88%"><textarea cols="70" rows="5" name="content" maxlength="255">${guestbookDto.content}</textarea>
</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">回复内容:</td><td colspan="3" class="pn-fcontent" width="88%"><textarea cols="70" rows="5" name="reply" maxlength="255">${guestbookDto.reply}</textarea>
</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">邮箱:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="100" name="email" value="${guestbookDto.email}" type="text"></td><td class="pn-flabel pn-flabel-h" width="12%">电话:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="100" name="phone" value="${guestbookDto.phone}" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">QQ:</td><td colspan="3" class="pn-fcontent" width="88%"><input maxlength="50" name="qq" value="${guestbookDto.qq}" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">审核:</td><td colspan="1" class="pn-fcontent" width="38%"><label><input value="true" <c:if test="${guestbookDto.isChecked}"> checked="checked"</c:if> name="isChecked" type="radio">是</label> <label><input value="false" <c:if test="${guestbookDto.isChecked==false}"> checked="checked"</c:if> name="isChecked" type="radio">否</label></td>
<td class="pn-flabel pn-flabel-h" width="12%">推荐:</td><td colspan="1" class="pn-fcontent" width="38%"><label><input value="true" <c:if test="${guestbookDto.isRecommend}"> checked="checked"</c:if> name="isRecommend" type="radio">是</label> <label><input value="false" <c:if test="${guestbookDto.isRecommend==false}"> checked="checked"</c:if> name="isRecommend" type="radio">否</label></td>
</tr>
<tr><td colspan="4" class="pn-fbutton">
<input type="hidden" name="guestbookId" value="${guestbookDto.guestbookId}" />
	<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset">
</td></tr></tbody></table>
</form>
</div>

</body></html>