<%@ include file="/res/common/jsp/jsp_defined.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
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
			function showMessage(){
				$.messager.show({title:'提示:',msg:'登陆配置已更改',timeout:4000,showType:'slide'});
			}
		</script>
		<script type="text/javascript">
			$(function() {
				$("#jvForm").validate();
			});
		</script>
	</head>
	<body>
	<c:if test="${status==true}">
		<script type="text/javascript">
			showMessage();
		</script>
	</c:if>	
		<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;">
		</div>
		<div class="body-box">
			<div class="rhead">
				<div class="rpos">
					当前位置: 全局设置 - 登录设置 - 修改
				</div>
				<form class="ropt"  method="post">
					<input value="系统设置"
						onclick="this.form.action='<%=basePath %>admin/core/config/config/v_edit.do';" type="submit">
					<input value="登录设置" onclick="this.form.action='<%=basePath %>/admin/core/config/doConfig/v_edit.do';"
						type="submit">
					<input value="会员设置"
						onclick="this.form.action='<%=basePath %>/admin/core/config/configAttr/v_edit.do';" type="submit">
				</form>
				<div class="clear"></div>
			</div>
			<form method="post"
				action="<%=basePath%>admin/core/config/doConfig/o_save.do"
				id="jvForm">
				<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1"
					width="100%">
					<tbody>
						<tr>

							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>登录错误次数:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<input maxlength="5" value="${doConfigInfo.login_error_times }"
									name="login_error_times" class="required digits" style="width: 70px;"
									type="text">
								<span class="pn-fhelp">达到错误次数后显示验证码</span>
							</td>
							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>登录错误时间:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<input maxlength="5" value="${doConfigInfo.login_error_interval}"
									name="login_error_interval" class="required digits"
									style="width: 70px;" type="text">
								<span class="pn-fhelp">(分钟)。超过时间重计次数</span>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>邮件服务器:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<input maxlength="100" value="${doConfigInfo.email_host}"
									name="email_host" class="required" type="text">
							</td>
							<td class="pn-flabel pn-flabel-h" width="15%">
								邮件端口:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<input maxlength="5" value="${doConfigInfo.email_port}"
									name="email_port" class="digits" type="text">
								<span class="pn-fhelp">留空则为默认端口</span>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>邮件用户名:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<input maxlength="100" value="${doConfigInfo.email_username}"
									name="email_username" class="required" type="text">
							</td>
							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>邮件密码:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<input maxlength="100" value="${doConfigInfo.email_password}"
									name="email_password" class="required" type="text">
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="15%">
								邮件编码:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<input maxlength="20" value="${doConfigInfo.email_encoding}"
									name="email_encoding" type="text">
							</td>
							<td class="pn-flabel pn-flabel-h" width="15%">
								发件人:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<input maxlength="100" value="${doConfigInfo.email_personal}"
									name="email_personal" type="text">
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>找回密码标题:
							</td>
							<td colspan="3" class="pn-fcontent" width="85%">
								<input maxlength="255" value="${doConfigInfo.message_subject}"
									name="message_subject" class="required" style="width: 220px;"
									type="text">
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>找回密码内容:
							</td>
							<td colspan="3" class="pn-fcontent" width="85%">
								<textarea cols="50" rows="5" name="message_text" class="required"
									maxlength="255">${doConfigInfo.message_text}
</textarea>
								<div class="pn-fhelp">
									用户ID：${uid}，用户名：${username}，重置KEY：${resetKey}，重置密码：${resetPwd}
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="pn-fbutton">
								<input value="提交" type="submit">
									&nbsp; 
								<input value="重置" type="reset">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>

	</body>
</html>