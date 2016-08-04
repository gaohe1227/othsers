<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
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
$(function() {
	$("#jvForm").validate();
});
</script>	
		<script type="text/javascript">
			function showMessage(){
				$.messager.show({title:'提示:',msg:'站点设置已更改',timeout:4000,showType:'slide'});
			}
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
					当前位置: 站点设置 - 基本设置 - 修改
				</div>
				<form class="ropt">
					<input value="基本设置" onclick="this.form.action='<%=basePath%>admin/core/config/site/v_edit.do';"
						type="submit">
				</form>
				<div class="clear"></div>
			</div>
			<form method="post" action="<%=basePath%>admin/core/config/site/o_save.do" id="jvForm">
				<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1"
					width="100%">
					<tbody>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>站点名称:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="100" value="${siteInfo.siteName }" name="siteName"
									class="required" style="width: 260px;" type="text">
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>站点简称:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="100" value="${siteInfo.shortName}" name="shortName"
									class="required" type="text">
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>域名:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="50" value="${siteInfo.domain}" name="domain"
									class="required" type="text">
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>路径:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="20" value="${siteInfo.sitePath}" name="sitePath" class="required"
									type="text">
									<span class="pn-fhelp">各站点资源的存放路径</span>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								域名别名:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="255" value="${siteInfo.domainAlias}" name="domainAlias" style="width: 200px;"
									type="text">
									<span class="pn-fhelp">用","分开</span>
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								域名重定向:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="255" value="${siteInfo.domainRedirect}" name="domainRedirect"
									style="width: 200px;" type="text">
									<span class="pn-fhelp">用","分开</span>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>使用相对路径:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<label>
									<input value="1" checked="checked" name="isRelativePath"
										type="radio">
										是 
								</label>
								<label>
									<input value="0" name="isRelativePath" type="radio">
										否 
								</label>
								<span class="pn-fhelp">只适于单站点</span>
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>访问协议:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<select name="protocol">
									<option value="http://" selected="selected">
										http://
									</option>
									<option value="https://">
										https://
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>动态页后缀:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<select name="dynamicSuffix">
									<option value=".jsp" selected="selected">
										.jsp
									</option>
									<option value=".htm">
										.htm
									</option>
								</select>
								<span class="pn-fhelp">建议使用.jsp为后缀，以避免冲突</span>
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>静态页后缀:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<select name="staticSuffix">
									<option value=".html" selected="selected">
										.html
									</option>
									<option value=".shtml">
										.shtml
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								静态页目录:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="50" value="${siteInfo.staticDir}" name="staticDir" type="text">
									<label>
										<input onclick="$('#indexToRoot').val(this.checked)"
											type="checkbox">
											<input id="isIndexToRoot" name="isIndexToRoot" value="0"
												type="hidden">
												使用根首页 
									</label>
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>开启静态首页:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<label>
									<input value="1" name="isStaticIndex" type="radio">
										是 
								</label>
								<label>
									<input value="0" checked="checked" name="isStaticIndex"
										type="radio">
										否 
								</label>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>后台本地化:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="10" value="${siteInfo.localeAdmin}" name="localeAdmin"
									class="required" type="text">
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>前台本地化:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input maxlength="10" value="${siteInfo.localeFront}" name="localeFront"
									class="required" type="text">
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								附件FTP:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<select name="ftpUploadId">
									<option value="" selected="selected">
										--无--
									</option>
								</select>
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>开启回收站:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<label>
									<input value="1" checked="checked" name="isRecycleOn"
										type="radio">
										是 
								</label>
								<label>
									<input value="0" name="isRecycleOn" type="radio">
										否 
								</label>
							</td>
						</tr>
						<tr>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>终审级别:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<input value="${siteInfo.finalStep}" name="finalStep" class="required digits"
									type="text">
							</td>
							<td class="pn-flabel pn-flabel-h" width="12%">
								<span class="pn-frequired">*</span>审核后:
							</td>
							<td colspan="1" class="pn-fcontent" width="38%">
								<select name="afterCheck">
									<option value="1">
										不能修改删除
									</option>
									<option value="2" selected="selected">
										修改后退回
									</option>
									<option value="3">
										修改后不变
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="pn-fbutton">
								<input name="siteId" value="${siteInfo.siteId}" type="hidden">
								<input name="configId" value="${siteInfo.configId}" type="hidden">
								<input name="tplSolution" value="${siteInfo.tplSolution}" type="hidden">
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