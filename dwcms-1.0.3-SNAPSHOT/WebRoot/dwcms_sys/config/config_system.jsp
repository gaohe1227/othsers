<%@include   file="/res/common/jsp/jsp_defined.jsp" %>
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
				$.messager.show({title:'提示:',msg:'系统设置已更改',timeout:4000,showType:'slide'});
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
			style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"></div>
		<div class="body-box">
			<div class="rhead">
				<div class="rpos">
					当前位置: 全局设置 - 系统设置 - 修改
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
			<form method="post" action="<%=basePath %>admin/core/config/config/o_save.do" id="jvForm">
				<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1"
					width="100%">
					<tbody>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="10%">
								部署路径:
							</td>
							<td colspan="1" class="pn-fcontent" width="40%">
								<input maxlength="20" value="${configInfo.contextPath}" name="contextPath"
									type="text">
								<span class="pn-fhelp">部署在根目录请留空</span>
							</td>
							<td class="pn-flabel pn-flabel-h" width="10%">
								端口号:
							</td>
							<td colspan="1" class="pn-fcontent" width="40%">
								<input value="${configInfo.port }" name="port" class="digits" type="text">
								<span class="pn-fhelp">默认留空</span>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="10%">
								<span class="pn-frequired">*</span>默认图片:
							</td>
							<td colspan="3" class="pn-fcontent" width="90%">
								<input maxlength="100" value="${configInfo.defImg }"
									name="defImg" class="required" style="width: 300px;"
									type="text">
								<span class="pn-fhelp">图片不存在时显示</span>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="10%">
								<span class="pn-frequired">*</span>数据库附件:
							</td>
							<td colspan="1" class="pn-fcontent" width="40%">
									<label>
										<input value="1" name="isUploadToDb" type="radio">
										是
									</label>
									<label>
										<input value="0" checked="checked" name="isUploadToDb"
											type="radio">
										否
									</label>								
							</td>
							<td class="pn-flabel pn-flabel-h" width="10%">
								<span class="pn-frequired">*</span>附件地址:
							</td>
							<td colspan="1" class="pn-fcontent" width="40%">
								<input maxlength="50" value="${configInfo.dbFileUri }" name="dbFileUri"
									class="required" type="text">
								<span class="pn-fhelp">一般无需改动</span>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="pn-fbutton">
								<input name="configId" value="${configInfo.configId}" type="hidden">
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