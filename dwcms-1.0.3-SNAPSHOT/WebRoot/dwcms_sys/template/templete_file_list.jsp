<%@ include file="/res/common/jsp/jsp_defined.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
		<link href="<%=basePath%>res/dwcms/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>res/dwcms/css/theme.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/thirdparty/jquery-easyui/themes/icon.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.ext.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/pony.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/dwcms/js/admin.js"></script>
		
		<script type="text/javascript" src="<%=basePath%>thirdparty/swfupload/jquery.js"></script>
		<script src="<%=basePath%>thirdparty/swfupload/swfupload.js" type="text/javascript"></script>
		<script src="<%=basePath%>thirdparty/swfupload/swfupload.queue.js" type="text/javascript"></script>
		<script src="<%=basePath%>thirdparty/swfupload/fileprogress.js" type="text/javascript"></script>
		<script src="<%=basePath%>thirdparty/swfupload/handlers.js" type="text/javascript"></script>
		<link href="<%=basePath%>thirdparty/swfupload/process.css" rel="stylesheet" type="text/css"/>
		
<script type="text/javascript">
function getTableForm() {
	return document.getElementById('tableForm');
}
function optDelete() {
	if(Pn.checkedCount('names')<=0) {
		alert("请选择您要操作的数据");
		return;
	}
	if(!confirm("您确定删除吗？")) {
		return;
	}
	var f = getTableForm();
	f.action="o_del.do";
	f.submit();
}
var swfu;
window.onload=function() {
	var uploadUrl = "o_swfupload.do";
	//在firefox、chrome下，上传不能保留登录信息，所以必须加上jsessionid。
	var jsessionid = $.cookie("JSESSIONID");
	if(jsessionid) {
		uploadUrl += ";jsessionid="+jsessionid;
	}
	swfu=new SWFUpload({
		upload_url : uploadUrl,
		flash_url : "<%=basePath %>thirdparty/swfupload/swfupload.swf",
		file_size_limit : "100 MB",
		post_params: {"root" : "${root}"},
		file_types : "*.html",
		file_types_description : "Html Files",
		file_queue_limit : 0,
		custom_settings : {
			progressTarget : "fsUploadProgress",
			cancelButtonId : "btnCancel"
		},
		debug: false,
		
		button_image_url : "<%=basePath %>/thirdparty/swfupload/button_notext.png",
		button_placeholder_id : "spanButtonPlaceHolder",
		button_text: "&nbsp;上传文件",
		button_width: 61,
		button_height: 22,
		
		file_queued_handler : fileQueued,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,
		upload_start_handler : uploadStart,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		upload_complete_handler : uploadComplete,
		queue_complete_handler : queueComplete2
	});
};
function queueComplete2(numFilesUploaded) {
	//刷新页面
	location.href="v_list.do?root=${root}";
}
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 模板管理 - 列表</div>
	<form class="ropt">
	<input name="root" value="${root}" type="hidden">
&nbsp; <input value="创建模板" onclick="this.form.action='v_add.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" enctype="multipart/form-data">
<input name="root" value="${root}" type="hidden">
<table style="padding-top: 3px;" border="0">
<tbody><tr>
	<td>当前目录: ${root}</td>
	<td align="center" width="70">
		<span id="spanButtonPlaceHolder"></span>
	</td>
	<td><input id="btnCancel" value="取消" onclick="swfu.cancelQueue();" disabled="disabled" type="button"></td>
	<td>
&nbsp; 新建目录: <input name="dirName" size="10" onkeypress="if(event.keyCode==13){$('#dirButton').click();return false;}" type="text">
		<input id="dirButton" value="新建" onclick="this.form.method='post';this.form.action='o_create_dir.do';" type="submit">
	</td>
</tr>
<tr><td colspan="4"><div id="fsUploadProgress"></div></td></tr>
</tbody></table>
</form>
<form id="tableForm" method="post">
<input name="root" value="${root}" type="hidden">
<table class="pn-ltable" style="" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead"><tr>
	<th width="20"><input onclick='Pn.checkbox("names",this.checked)' type="checkbox"></th>
	<th width="20"> </th>
	<th>文件名</th>
	<th>大小</th>
	<th>最后修改时间</th>
	<th>操作选项</th></tr></thead>
<tbody class="pn-ltbody">
<c:forEach items="${fileList}" var="file" >
<tr>
	<td><input name="names" value="${root}/${file.filename}" type="checkbox"></td>
	<td align="center"><img src="<%=basePath %>res/common/img/file/${file.ico}.gif"></td>
	<td>${file.filename }</td>
	<td align="right">${file.size } KB</td>
	<td align="center">${file.lastModifiedDate }</td>
	<td align="center">		<a href="<%=basePath %>admin/core/template/v_rename.do?root=${root}&name=%2F${file.filename}" class="pn-opt">重命名</a> | 	<c:choose><c:when test="${file.isEditable}"><a  href="<%=basePath %>/admin/core/template/v_edit.do?root=${root}&filename=${file.filename}" class="pn-opt">修改</a></c:when><c:otherwise><a  disabled="disabled">修改</a></c:otherwise></c:choose>	 | <a href="<%=basePath %>admin/core/template/o_delete_single.do?root=${root}&name=%2F${file.filename}" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a></td>
</tr>
</c:forEach>
</tbody>
</table>
<div>
	<input value="删除" onclick="optDelete();" type="button">
</div>
</form>
</div>

</body></html>