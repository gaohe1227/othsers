<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title></title>
		<link href="<%=basePath%>res/dwcms/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>res/dwcms/css/theme.css" rel="stylesheet"type="text/css">
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
		<script type="text/javascript">
			function showMessage(){
				$.messager.show({title:'提示:',msg:'Ftp设置已更改',timeout:4000,showType:'slide'});
			}
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
		</div>
		<div class="body-box">
			<div class="rhead">
				<div class="rpos">
					当前位置: FTP管理 - 添加
				</div>
				<form class="ropt">
					<input value="返回列表" onclick="this.form.action='v_list.do';"
						type="submit">
				</form>
				<div class="clear"></div>
			</div>
			<form method="post" action="o_save.do" id="jvForm">
				<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1"
					width="100%">
					<tbody>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>名称:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="100" value="${ftpInfo.ftpName }"  name="ftpName" class="required" type="text">
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>服务器IP:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="50" value="${ftpInfo.ip }" name="ip" class="required" type="text">
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>FTP端口号:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="10" value="${ftpInfo.port }" name="port"
									class="required digits" style="width: 70px;" type="text">
									<span class="pn-fhelp">默认端口21</span>
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>传输超时时间:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="10" value="${ftpInfo.timeout }" name="timeout"
									class="required digits" style="width: 70px;" type="text">
									<span class="pn-fhelp">单位：秒，0为服务器默认</span>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>FTP用户名:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="100" value="${ftpInfo.username }" name="username" class="required"
									type="text">
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>FTP密码:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="100" value="${ftpInfo.password }" name="password" class="required"
									type="text">
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								远程目录:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="255" value="${ftpInfo.ftpPath }" name="ftpPath" type="text">
									<span class="pn-fhelp">留空为根目录</span>
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>编码:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="255"  value="${ftpInfo.encoding }" name="encoding"
									class="required" type="text">
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>访问URL:
							</td>
							<td colspan="3" class="pn-fcontent" width="88%">
								<input maxlength="255" value="${ftpInfo.url }" name="url" class="required"
									style="width: 260px;" type="text">
									<span class="pn-fhelp">访问该FTP的url地址</span>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="pn-fbutton">
							<input type="hidden" value="${ftpInfo.ftpId }" name="ftpId"/>
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