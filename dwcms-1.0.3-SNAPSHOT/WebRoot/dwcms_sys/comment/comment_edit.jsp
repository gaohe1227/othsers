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
		<script type="text/javascript" src="<%=basePath%>res/common/js/pony.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.ext.js"></script>
<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});
</script>
</head>
<body>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置:  评论管理 - 修改</div>
	<form class="ropt">
		<input type="submit" value="返回列表" onclick="this.form.action='v_list.do';"/>
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
<tr>
<td width="12%" class="pn-flabel pn-flabel-h">文档:</td><td colspan="3" width="88%" class="pn-fcontent">
${commentDto.contentTitle }</td></tr>
<tr>
<td width="12%" class="pn-flabel pn-flabel-h">会员:</td><td colspan="1" width="38%" class="pn-fcontent">
${commentDto.commentUsername }</td>
<td width="12%" class="pn-flabel pn-flabel-h">评论时间:</td><td colspan="1" width="38%" class="pn-fcontent">
<fmt:formatDate value="${commentDto.createTime}"  type="date" pattern="yyyy-MM-dd HH:mm:ss"/> <br/>${commentDto.ip }</td></tr>
<tr>
<td width="12%" class="pn-flabel pn-flabel-h">审核:</td><td colspan="1" width="38%" class="pn-fcontent"><label><input type="radio" value="true" <c:if test="${commentDto.isChecked==true }">checked="checked"</c:if>  name="isChecked"/>是</label> <label><input type="radio" <c:if test="${commentDto.isChecked==false }">checked="checked"</c:if> value="false" name="isChecked"/>否</label></td>
<td width="12%" class="pn-flabel pn-flabel-h">推荐:</td><td colspan="1" width="38%" class="pn-fcontent"><label><input type="radio" value="true" <c:if test="${commentDto.isRecommend==true }">checked="checked"</c:if> name="isRecommend"/>是</label> <label><input type="radio"  <c:if test="${commentDto.isRecommend==false }">checked="checked"</c:if> value="false" name="isRecommend"/>否</label></td>
</tr>
<tr><td width="12%" class="pn-flabel pn-flabel-h">评论:</td><td colspan="3" width="88%" class="pn-fcontent"><textarea cols="70" rows="5" name="text">${commentDto.text }</textarea>
</td></tr>
<tr><td width="12%" class="pn-flabel pn-flabel-h">回复:</td><td colspan="3" width="88%" class="pn-fcontent"><textarea cols="70" rows="5" name="reply">${commentDto.reply }</textarea>
</td></tr>
<tr><td colspan="4" class="pn-fbutton">
<input type="hidden" name="commentId" value="${commentDto.commentId}"/>
	<input type="submit" value="提交"/> &nbsp; <input type="reset" value="重置"/>
</td></tr></table>
</form>
</div>
</body>
</html>