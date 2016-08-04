<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人资料</title>

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
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"></div>
<div class="body-box">
    <div class="rhead">
        <div class="rpos">当前位置: 个人资料</div>
        <div class="clear"></div>
    </div>
    <form method="post" action="<%=basePath%>/admin/core/member/user/o_profile.do" id="jvForm">
<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
<tr>
<td width="20%" class="pn-flabel pn-flabel-h">用户名:</td><td width="80%" class="pn-fcontent">
<shiro:principal/></td></tr>
<tr>
<td width="20%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>原密码:</td><td width="80%" class="pn-fcontent"><input type="password" autocomplete="off" maxlength="32" name="origPwd" vld="{required:true}" maxlength="32"/>
</td></tr><tr><td width="20%" class="pn-flabel pn-flabel-h">新密码:</td><td width="80%" class="pn-fcontent"><input type="password" autocomplete="off" id="newPwd" maxlength="32" name="newPwd" maxlength="32"/>
 <span class="pn-fhelp">不修改请留空</span></td></tr>
 <tr><td width="20%" class="pn-flabel pn-flabel-h">确认密码:</td><td width="80%" class="pn-fcontent"><input type="password" autocomplete="off" maxlength="32" equalTo="#newPwd" maxlength="32"/>
 <span class="pn-fhelp">不修改请留空</span></td></tr>
 <tr><td width="20%" class="pn-flabel pn-flabel-h">真实姓名:</td><td width="80%" class="pn-fcontent"><input type="text" maxlength="100" value="${userDto.realname}" name="realname" maxlength="100"/></td></tr>
 <tr><td width="20%" class="pn-flabel pn-flabel-h">电子邮箱:</td><td width="80%" class="pn-fcontent"><input type="text" maxlength="100" value="${userDto.email}" name="email" class="email" maxlength="100"/></td></tr><tr><td colspan="2" class="pn-fbutton">
<input type="hidden" value="${userDto.userId}" />
<input type="submit" value="提交"/> &nbsp; <input type="reset" value="重置"/></td>
</tr></table>
    </form>

</div>

</body>
</html>