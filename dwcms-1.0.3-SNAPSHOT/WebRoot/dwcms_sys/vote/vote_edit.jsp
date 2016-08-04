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
		<script type="text/javascript" src="${ctx}/thirdparty/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/pony.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.ext.js"></script>
<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});
</script>
<style type="text/css">
.items{padding-top:1px;}
</style>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 投票管理 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody>
<tr><td class="pn-flabel pn-flabel-h" width="20%"><span class="pn-frequired">*</span>标题:</td><td class="pn-fcontent" width="80%"><input maxlength="255" name="title" value="${voteDto.title}" class="required" style="width: 400px;" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="20%">描述:</td><td class="pn-fcontent" width="80%"><textarea rows="3" name="description" style="width: 400px;" maxlength="255">${voteDto.description }</textarea>
</td></tr><tr><td class="pn-flabel pn-flabel-h" width="20%">投票时间限制:</td><td class="pn-fcontent" width="80%">
<table>
	<tbody><tr>
		<td>开始时间</td>
		<td><input id="startTime" name="startTime"  value="<fmt:formatDate value="${voteDto.startTime}" type="both"/>" style="width: 140px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"   type="text"></td>
		<td rowspan="2" valign="middle"><span class="pn-fhelp">留空不限制</span></td>
	</tr>
	<tr>
		<td>结束时间</td>
		<td><input id="endTime" name="endTime"   value="<fmt:formatDate value="${voteDto.startTime}" type="both"/>"  style="width: 140px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  type="text"></td>
	</tr><tr>
</tr></tbody></table>
</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="20%">重复投票时间:</td><td class="pn-fcontent" width="80%"><input maxlength="10" name="repeateHour" value="${voteDto.repeateHour}" class="digits" type="text"> <span class="pn-fhelp">单位：小时。为空禁止重复投票；0为不限制重复投票。</span></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="20%">限制用户:</td><td class="pn-fcontent" width="80%"><label><input value="true" <c:if test="${voteDto.isRestrictMember}">checked="checked"</c:if> name="isRestrictMember" type="radio">是</label> <label><input value="false" <c:if test="${voteDto.isRestrictMember==false}">checked="checked"</c:if> name="isRestrictMember" type="radio">否</label> <span class="pn-fhelp">（是：必须登录才能投票；否：允许游客投票）</span></td></tr><tr>
<td class="pn-flabel pn-flabel-h" width="20%">限制IP:</td><td class="pn-fcontent" width="80%"><label><input value="true" <c:if test="${voteDto.isRestrictIp}">checked="checked"</c:if>  name="isRestrictIp" type="radio">是</label> <label><input value="false" checked="checked" name="isRestrictIp" <c:if test="${voteDto.isRestrictIp==false}">checked="checked"</c:if> type="radio">否</label></td></tr><tr>
<td class="pn-flabel pn-flabel-h" width="20%">限制COOKIE:</td><td class="pn-fcontent" width="80%"><label><input value="true" checked="checked" <c:if test="${voteDto.isRestrictCookie}">checked="checked"</c:if> name="isRestrictCookie" type="radio">是</label> <label><input value="false" <c:if test="${voteDto.isRestrictCookie==false}">checked="checked"</c:if> name="isRestrictCookie" type="radio">否</label> <span class="pn-fhelp">（可以识别同一IP的不同电脑）</span></td></tr><tr>
<td class="pn-flabel pn-flabel-h" width="20%"><span class="pn-frequired">*</span>最多能选几项:</td><td class="pn-fcontent" width="80%">
<input name="multiSelect" value="${voteDto.multiSelect}" class="required digits" style="width: 100px;" type="text">
<label style="padding-left:20px"><input onclick="$('#def').val(this.checked);" <c:if test="${voteDto.isDef}">checked="checked"</c:if> type="checkbox">默认<input id="def" name="isDef" <c:choose><c:when test="${voteDto.isDef}">value="true"</c:when><c:otherwise>value="false"</c:otherwise></c:choose>    type="hidden"></label>
<label style="padding-left:10px"><input onclick="$('#disabled').val(this.checked);" <c:if test="${voteDto.isDisabled}">checked="checked"</c:if>  type="checkbox">暂停<input id="disabled" name="isDisabled" <c:choose><c:when test="${voteDto.isDisabled}">value="true"</c:when><c:otherwise>value="false"</c:otherwise></c:choose> type="hidden"></label>
</td></tr>
<tr><td colspan="2" class="pn-fbutton">
<div class="items">
投票项&nbsp; <input value="新增几行" onclick="addLines();" type="button">
</div>
<div id="itemsContainer">
<c:choose>
	<c:when test="${voteDto.voteItemList!=null}">
		<c:forEach  items="${voteDto.voteItemList}" var="voteItem" varStatus="status">
		<div class="items">
		标题: <input name="itemTitle" value="${voteItem.title }" style="width: 300px;" type="text">
		&nbsp; 票数: <input name="itemVoteCount" value="${voteItem.voteCount }" style="width: 50px;" type="text">
		&nbsp; 排序: <input name="itemPriority" value="${voteItem.priority }" style="width: 30px;" type="text">
		&nbsp; <input value="删除" onclick="$(this).parent().remove();" type="button">
		</div>		
		</c:forEach>	
	</c:when>
	<c:otherwise>
		<div class="items">
		标题: <input name="itemTitle" style="width: 300px;" type="text">
		&nbsp; 票数: <input name="itemVoteCount" value="0" style="width: 50px;" type="text">
		&nbsp; 排序: <input name="itemPriority" value="1" style="width: 30px;" type="text">
		&nbsp; <input value="删除" onclick="$(this).parent().remove();" type="button">
		</div>
		<div class="items">
		标题: <input name="itemTitle" style="width: 300px;" type="text">
		&nbsp; 票数: <input name="itemVoteCount" value="0" style="width: 50px;" type="text">
		&nbsp; 排序: <input name="itemPriority" value="2" style="width: 30px;" type="text">
		&nbsp; <input value="删除" onclick="$(this).parent().remove();" type="button">
		</div>
		<div class="items">
		标题: <input name="itemTitle" style="width: 300px;" type="text">
		&nbsp; 票数: <input name="itemVoteCount" value="0" style="width: 50px;" type="text">
		&nbsp; 排序: <input name="itemPriority" value="3" style="width: 30px;" type="text">
		&nbsp; <input value="删除" onclick="$(this).parent().remove();" type="button">
		</div>
		<div class="items">
		标题: <input name="itemTitle" style="width: 300px;" type="text">
		&nbsp; 票数: <input name="itemVoteCount" value="0" style="width: 50px;" type="text">
		&nbsp; 排序: <input name="itemPriority" value="4" style="width: 30px;" type="text">
		&nbsp; <input value="删除" onclick="$(this).parent().remove();" type="button">
		</div>
		<div class="items">
		标题: <input name="itemTitle" style="width: 300px;" type="text">
		&nbsp; 票数: <input name="itemVoteCount" value="0" style="width: 50px;" type="text">
		&nbsp; 排序: <input name="itemPriority" value="5" style="width: 30px;" type="text">
		&nbsp; <input value="删除" onclick="$(this).parent().remove();" type="button">
		</div>	
	</c:otherwise>
</c:choose>

</div>
</td></tr>
<tr><td colspan="2" class="pn-fbutton">
<input type="hidden" name="votetopicId" value="${voteDto.votetopicId}"/>
<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset"></td>
</tr></tbody></table>
</form>
</div>

<textarea id="itemTpl" style="display: none;">&lt;div class="items"&gt;
标题: &lt;input type="text" name="itemTitle" style="width:300px"/&gt;
&nbsp; 票数: &lt;input type="text" name="itemVoteCount" value="0" style="width:50px"/&gt;
&nbsp; 排序: &lt;input type="text" name="itemPriority" value="{0}" style="width:30px"/&gt;
&nbsp; &lt;input type="button" value="删除" onclick="$(this).parent().remove();"/&gt;
&lt;/div&gt;
</textarea>

<script type="text/javascript">
var tpl = $.format($("#itemTpl").val());
var index = 6;
function addLines() {
	$("#itemsContainer").append(tpl(index++));
}
</script>


</body></html>