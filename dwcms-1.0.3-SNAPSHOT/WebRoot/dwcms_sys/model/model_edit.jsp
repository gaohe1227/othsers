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
		<script type="text/javascript" src="<%=basePath%>res/common/js/pony.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.ext.js"></script>
		
		<script type="text/javascript">
			function showMessage(){
				$.messager.show({title:'提示:',msg:'模型信息已保存',timeout:4000,showType:'slide'});
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
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 模型管理 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>模型ID:</td><td colspan="3" class="pn-fcontent" width="88%"><input maxlength="5" value="${modelInfo.modelId }" name="modelId" class="required digits" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>模型名称:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="100" value="${modelInfo.modelName }" name="modelName" class="required" type="text"></td><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>模型路径:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="100" value="${modelInfo.modelPath}" name="modelPath" class="required" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>栏目模板前缀:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="20" value="${modelInfo.tplChannelPrefix }" name="tplChannelPrefix" class="required" type="text"></td><td class="pn-flabel pn-flabel-h" width="12%">内容模板前缀:</td><td colspan="1"  class="pn-fcontent" width="38%"><input maxlength="20" value="${modelInfo.tplContentPrefix}" name="tplContentPrefix" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">栏目标题图:</td><td colspan="1" class="pn-fcontent" width="38%">
宽: <input value="${modelInfo.titleImgWidth }"  name="titleImgWidth"  style="width: 50px;" type="text">
高: <input name="titleImgHeight" value="${modelInfo.titleImgHeight }" style="width: 50px;" type="text">
</td><td class="pn-flabel pn-flabel-h" width="12%">栏目内容图:</td><td colspan="1" class="pn-fcontent" width="38%">
宽: <input name="contentImgWidth" value="${modelInfo.contentImgWidth }" style="width: 50px;" type="text">
高: <input name="contentImgHeight" value="${modelInfo.contentImgHeight }" style="width: 50px;" type="text">
</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>排列顺序:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="9" value="${modelInfo.priority}" name="priority" class="required" style="width: 70px;" type="text"></td><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>是否有内容:</td><td colspan="1" class="pn-fcontent" width="38%">
<c:choose>
	<c:when test="${modelInfo.hasContent }">
<label><input value="true" checked="checked" name="hasContent" type="radio">是</label> <label><input value="false" name="hasContent" type="radio">否</label>
	</c:when>
	<c:otherwise>
<label><input value="true"  name="hasContent" type="radio">是</label> <label><input checked="checked" value="false" name="hasContent" type="radio">否</label>
	</c:otherwise>
</c:choose>

</td>
</tr>
<tr><td colspan="4" class="pn-fbutton">
<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset"></td>
</tr></tbody></table>
</form>
</div>

</body></html>