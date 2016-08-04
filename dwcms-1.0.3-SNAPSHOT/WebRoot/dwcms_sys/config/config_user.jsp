<%@ include    file="/res/common/jsp/jsp_defined.jsp" %>
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
				$.messager.show({title:'提示:',msg:'用户配置已更改',timeout:4000,showType:'slide'});
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
		<div
			style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;">
			<iframe style="width: 186px; height: 199px;"
				 border="0"
				frameborder="0" scrolling="no"></iframe>
		</div>
		<div class="body-box">
			<div class="rhead">
				<div class="rpos">
					当前位置: 全局设置 - 会员设置 - 修改
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
			<form method="post" action="<%=basePath %>/admin/core/config/configAttr/o_save.do" id="jvForm">
				<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1"
					width="100%">
					<tbody>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>开启会员功能:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<c:choose>
									<c:when test="${configAttrInfo.member_on}">
										<label>
											<input value="true" checked="checked" name="member_on" type="radio">
												是 
										</label>
										<label>
											<input value="false" name="member_on" type="radio">
												否 
										</label>
									</c:when>
									<c:otherwise>
										<label>
											<input value="true" name="member_on" type="radio">
												是 
										</label>
										<label>
											<input value="false" checked="checked"  name="member_on" type="radio">
												否 
										</label>									
									</c:otherwise>
								</c:choose>
							</td>
							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>开启会员注册:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<c:choose>
									<c:when test="${configAttrInfo.register_on}">
										<label>
											<input value="true" checked="checked" name="register_on"
												type="radio">
												是 
										</label>
										<label>
											<input value="false" name="register_on" type="radio">
												否 
										</label>
									</c:when>
									<c:otherwise>
										<label>
											<input value="true"  name="register_on"
												type="radio">
												是 
										</label>
										<label>
											<input value="false" checked="checked" name="register_on" type="radio">
												否 
										</label>	
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>用户名最小长度:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<input value="${configAttrInfo.username_min_len}" name="username_min_len" class="required digits"
									type="text">
							</td>
							<td class="pn-flabel pn-flabel-h" width="15%">
								<span class="pn-frequired">*</span>密码最小长度:
							</td>
							<td colspan="1" class="pn-fcontent" width="35%">
								<input value="${configAttrInfo.password_min_len}" name="password_min_len" class="required digits"
									type="text">
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="15%">
								用户名保留字:
							</td>
							<td colspan="3" class="pn-fcontent" width="85%">
								<textarea cols="30" rows="5" name="username_reserved"
									maxlength="255">${configAttrInfo.username_reserved }</textarea>
								<div class="pn-fhelp">
									可以使用 * 作为通配符，如: *admin*
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="pn-fbutton">
							<input name="config_id" value="${configAttrInfo.config_id}" type="hidden">
								<input value="提交" type="submit">
									&nbsp; <input value="重置" type="reset">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>

	</body>
</html>