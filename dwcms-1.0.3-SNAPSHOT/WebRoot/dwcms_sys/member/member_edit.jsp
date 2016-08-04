<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<%@ taglib uri="GroupTagLib" prefix="user" %>
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
<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});
</script>		
		<script type="text/javascript">
			function showMessage(){
				$.messager.show({title:'提示:',msg:'用户信息已保存',timeout:4000,showType:'slide'});
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
<body>
	<c:if test="${status==true}">
		<script type="text/javascript">
			showMessage();
		</script>
	</c:if>	
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 会员管理 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>用户名:</td><td colspan="1" class="pn-fcontent" width="38%"><input value="${userInfo.username }" maxlength="100" name="username" vld="{required:true,username:true,remote:'v_check_username.do',messages:{remote:'用户名已被使用'}}" type="text"></td><td class="pn-flabel pn-flabel-h" width="12%">电子邮箱:</td><td colspan="1" class="pn-fcontent" width="38%"><input value="${userInfo.email }" name="email" class="email" size="30" type="text"></td></tr>

<tr>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>密码:</td><td colspan="1" class="pn-fcontent" width="38%"><input value="${userInfo.password}" autocomplete="off" id="password" maxlength="100" name="password" class="required" type="password">
</td><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>确认密码:</td><td colspan="1" class="pn-fcontent" width="38%"><input value="${userInfo.password}" autocomplete="off" equalto="#password" type="password">
</td>
</tr>

<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>会员组:</td><td colspan="3" class="pn-fcontent" width="88%">
	<user:showGroupSelect showType="SELECT"/>
	<c:if test="${userInfo.groupId!=null}">
		<script type="text/javascript">
			setOptSelected('groupId',${userInfo.groupId});
		</script>
	</c:if>	
</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">真实姓名:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="100" value="${userInfo.realname }" name="realname" type="text"></td>
<td class="pn-flabel pn-flabel-h" width="12%">性别:</td>
<td colspan="1" class="pn-fcontent" width="38%">
	<label><input value="true" name="gender" <c:if test="${userInfo.gender}">checked="checked"</c:if> type="radio">男</label> 
	<label><input value="false" name="gender" <c:if test="${!userInfo.gender}">checked="checked"</c:if> type="radio">女</label> 
</td>
</tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">出生日期:</td>
<td colspan="1" class="pn-fcontent" width="38%"><input id="birthday" name="birthday" value="<fmt:formatDate value="${userInfo.birthday}"  type="date" pattern="yyyy-MM-dd"/>" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" type="text"></td>
<td class="pn-flabel pn-flabel-h" width="12%">来自:</td><td colspan="1" class="pn-fcontent" width="38%"><input value="${userInfo.comefrom }" maxlength="150" name="comefrom" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">QQ:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="100" value="${userInfo.qq}" name="qq" type="text"></td><td class="pn-flabel pn-flabel-h" width="12%">MSN:</td><td colspan="1" class="pn-fcontent" width="38%"><input value="${userInfo.msn}" maxlength="100" name="msn" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">电话:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="50" value="${userInfo.phone }" name="phone" type="text"></td><td class="pn-flabel pn-flabel-h" width="12%">手机:</td><td colspan="1" class="pn-fcontent" width="38%"><input value="${userInfo.mobile }" maxlength="50" name="mobile" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">个人介绍:</td><td colspan="3" class="pn-fcontent" width="88%"><textarea cols="70" rows="5" name="intro" maxlength="255">${userInfo.intro }</textarea>
</td></tr>
<tr>
<td colspan="4" class="pn-fbutton">
<input type="hidden" name="userId" value="${userInfo.userId}" />
<input type="hidden" name="loginCount" value="${userInfo.loginCount}" />
<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset">
</td>
</tr></tbody></table>
</form>
</div>

</body></html>