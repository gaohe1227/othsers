<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<%@ taglib uri="GroupTagLib" prefix="user" %>
<%@ taglib uri="RoleTagLib" prefix="role" %>
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
	//栏目权限对话框
	$("#channelDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 280,
		height: 420,
		position: ["center",20],
		buttons: {
			"OK": function() {
				$(this).dialog("close");
			}
		},
		close: function(event, ui) {
			//将列表框中已选中的项复制到隐藏表单中
			var s="";
			$("#channels").children().each(function(){
				if($(this).attr("selected")) {
					s += "<input type='hidden' name='channelIds' value='" +$(this).val()+ "'/>";
				}
			});
			$("#channelIdsContainer").empty().append(s);
		}
	});
	var channels_opened = false;
	$('#channel').click(function(){
		//第一次打开，需要获取数据。
		if(!channels_opened) {
			//获取数据
			$.get("v_channels_add.do",{"siteId":1},function(s) {
				$(s).appendTo("#channels");
			});
			channels_opened = true;
		}
		$('#channelDialog').dialog('open');
		return false;
	});	
});
function disChannels(chk) {
	$("#allChannel").val(chk);
	if(chk) {
		$("#channels").addClass("disabled").attr("disabled","disabled").children().each(function(){$(this).removeAttr("selected")});
		$("#channelIdsContainer").empty();
	} else {
		$("#channels").removeAttr("disabled").removeClass("disabled");
	}
}

function setOptSelected(elementId,eValue){
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
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 管理员(本站) - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody>
<tr>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>用户名:</td>
<td colspan="1" class="pn-fcontent" width="38%"><input maxlength="100" value="${managerInfo.username}" name="username" vld="{required:true,username:true,remote:'v_check_username.do',messages:{remote:'用户名已被使用'}}" type="text"></td>
<td class="pn-flabel pn-flabel-h" width="12%">电子邮箱:</td>
<td colspan="1" class="pn-fcontent" width="38%"><input maxlength="100" value="${managerInfo.email}" name="email" class="email" size="30" type="text"></td>
</tr>
<tr>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>密码:</td>
<td colspan="1" class="pn-fcontent" width="38%">
<input autocomplete="off" id="password" maxlength="100" value="${managerInfo.password}" name="password" class="required" type="password">
</td>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>确认密码:</td>
<td colspan="1" class="pn-fcontent" width="38%"><input value="${managerInfo.password}" autocomplete="off" equalto="#password" type="password">
</td>
</tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>会员组:</td>
<td colspan="1" class="pn-fcontent" width="38%">
	<user:showGroupSelect showType="SELECT"/>
	<c:if test="${managerInfo.groupId!=null}">
		<script type="text/javascript">
			setOptSelected('groupId',${managerInfo.groupId});
		</script>
	</c:if>	
</select>
</td>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>等级:</td>
<td colspan="1" class="pn-fcontent" width="38%">
<input value="${managerInfo.rank}" maxlength="5" max="9"  name="rank" class="required digits" style="width: 70px;" type="text"> 
<span class="pn-fhelp">越大等级越高</span>
</td>
</tr>
<tr>
<td class="pn-flabel pn-flabel-h" width="12%">真实姓名:</td>
<td colspan="1" class="pn-fcontent" width="38%">
<input value="${managerInfo.realname}" maxlength="100" name="realname" type="text">
</td><td class="pn-flabel pn-flabel-h" width="12%">性别:</td><td colspan="1" class="pn-fcontent" width="38%">
	<label><input value="true" name="gender" <c:if test="${managerInfo.gender}">checked="checked"</c:if> type="radio">男</label> 
	<label><input value="false" name="gender" <c:if test="${!managerInfo.gender}">checked="checked"</c:if> type="radio">女</label>
</tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>受限管理员:</td>
<td colspan="1" class="pn-fcontent" width="38%">
<label><input value="true"  <c:if test="${managerInfo.isSelfAdmin}">checked="checked"</c:if> name="isSelfAdmin" type="radio">是</label> 
<label><input value="false"  <c:if test="${!managerInfo.isSelfAdmin}">checked="checked"</c:if> name="isSelfAdmin" type="radio">否</label> <span class="pn-fhelp">只能管理自己的数据</span>
</td>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>只读管理员:</td><td colspan="1" class="pn-fcontent" width="38%">
<label><input value="true"  <c:if test="${managerInfo.isViewonlyAdmin}">checked="checked"</c:if>  name="isViewonlyAdmin" type="radio">是</label> 
<label><input value="false"  <c:if test="${!managerInfo.isViewonlyAdmin}">checked="checked"</c:if> name="isViewonlyAdmin" type="radio">否</label> <span class="pn-fhelp">用于后台演示</span>
</td>
</tr>

<tr><td class="pn-flabel pn-flabel-h" width="12%">角色:</td>
<td colspan="3" class="pn-fcontent" width="88%">
<role:showRoleName isCheckbox="true"/>
</td>
</tr>

<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>审核级别:</td><td colspan="3" class="pn-fcontent" width="88%">
<input value="1" name="steps" class="required digits" style="width: 40px;" type="text">	<input id="channel" value="栏目权限" type="button">	
	<input id="allChannel" name="allChannels" value="true" type="hidden">
	<span id="channelIdsContainer"></span>
	
<div style="clear:both"></div>
</td></tr>
<tr><td colspan="4" class="pn-fbutton">
<input type="hidden" name="userId" value="${managerInfo.userId }"/>
<input type="hidden" name="isAdmin" value="${managerInfo.isAdmin }"/>
<input type="hidden" name="loginCount" value="${managerInfo.loginCount}"/>
<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset"></td>
</tr></tbody></table>
</form>
</div>
<script type="text/javascript">
function doRoleCheck(userId){
	if(userId==null||userId==""){
		return;
	}
	var checkboxRoles= $("input[type=checkbox]");
	$.ajax({
		async:"false",
		type:"GET",
		url:"<%=basePath%>admin/core/member/manager/o_roleCheck.do?userId="+userId+"",
		dataType:"json",
		success:function(data){
			for(var i=0;i<checkboxRoles.length;i++){
				for(var j=0;j<data.length;j++){
					if(checkboxRoles[i].value==data[j].roleId){
						checkboxRoles[i].checked="true";
					}
				}
			}
		},
		error:function(msg){
			alert("ERROR:"+msg);
		},
	});
}  
doRoleCheck(${managerInfo.userId});
</script>
<div aria-labelledby="ui-dialog-title-channelDialog" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable" style="display: none; position: absolute; overflow: hidden; z-index: 1000; outline: 0px none;"><div style="-moz-user-select: none;" unselectable="on" class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span style="-moz-user-select: none;" unselectable="on" id="ui-dialog-title-channelDialog" class="ui-dialog-title">栏目权限(JEECMS开发站)</span><a style="-moz-user-select: none;" unselectable="on" role="button" class="ui-dialog-titlebar-close ui-corner-all" href="#"><span style="-moz-user-select: none;" unselectable="on" class="ui-icon ui-icon-closethick">close</span></a></div><div class="ui-dialog-content ui-widget-content" id="channelDialog" style="">
		<label><input onclick="disChannels(this.checked)" checked="checked" type="checkbox">所有栏目</label>
		<select id="channels" disabled="disabled" class="disabled" multiple="multiple" size="15" style="width:100%;"></select>
	</div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-n"></div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-e"></div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-s"></div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-w"></div><div unselectable="on" style="z-index: 1001; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div unselectable="on" style="z-index: 1002; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-sw"></div><div unselectable="on" style="z-index: 1003; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-ne"></div><div unselectable="on" style="z-index: 1004; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"><button class="ui-state-default ui-corner-all" type="button">OK</button></div></div></body></html>