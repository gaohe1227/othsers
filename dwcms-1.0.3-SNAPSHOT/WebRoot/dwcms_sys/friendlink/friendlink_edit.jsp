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
		<script type="text/javascript" src="<%=basePath%>res/common/js/ajaxfileupload.js"></script>		
<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="friendly_link_save_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<script type="text/javascript">
//上传图片
function upload(n) {
	var of = $("#uploadFile"+n);
	//检查是否选择了图片
	if(of.val()=="") {
		alert("请先选择图片");
		return;
	}
    $.ajaxFileUpload({  
        url : "<%=basePath %>common/o_upload_image.do", // 需要链接到服务器地址  
         
        dataType : "json", // 服务器返回的格式，可以是json  
        fileElementId : "uploadFile"+n, // 文件选择框的id属性  
        success : function(data, status) // 相当于java中try语句块的用法  
        {  
                $("#preImg"+n).attr("src","${ctx}"+data.path);  
                $("#uploadImgPath"+n).val(data.path);  
                imagePath=data.path;
        },  
        error : function(data, status, e) // 相当于java中catch语句块的用法  
        {  
                alert("图片上传失败");  
        }  
	});
}
//剪裁图片
function imgCut(n) {
	if($("#uploadImgPath"+n).val()=="") {
		alert("请先上传图片");
		return;
	}
	var url = "${ctx}/common/v_image_area_select.do?uploadNum="+n+"&imgSrcPath="
		+$("#uploadImgPath"+n).val()+"&zoomWidth="+$("#zoomWidth"+n).val()+"&zoomHeight="+$("#zoomHeight"+n).val();
	window.open(url,"imgcut","height=550, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=auto, resizable=yes,location=no, status=no");
}
//预览图片
function previewImg(n) {
	var img ="${ctx}"+ $("#uploadImgPath"+n).val();
	if(img!="") {
		if(img.indexOf("?")==-1) {
			$("#preImg"+n).attr("src",img+"?d="+new Date()*1);
		} else {
			$("#preImg"+n).attr("src",img+"&d="+new Date()*1);
		}
		if(!$("#preImg"+n).attr("noResize")) {
			$("#preImg"+n).css("width","auto");
			$("#preImg"+n).css("height","auto");
		}
	} else {
		$("#preImg"+n).removeAttr("src");		
	}
}
</script>
<form id="uploadForm" action="../common/o_upload_image.do" method="post" enctype="multipart/form-data" target="hiddenIframe" style="display:none;width:0px;height:0px;">
<span id="fileContent"></span>
<input id="ufWidth" name="zoomWidth" type="hidden">
<input id="ufHeight" name="zoomHeight" type="hidden">
<input id="ufFileName" name="fileName" type="hidden">
<input id="ufMark" name="mark" type="hidden">
<input id="uploadNum" name="uploadNum" type="hidden">
</form>
<iframe name="hiddenIframe" border="0" style="display: none; width: 0px; height: 0px;" frameborder="0"></iframe><div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 友情链接管理 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>网站名称:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="150" name="siteName" value="${friendlink.siteName}" class="required" type="text"></td>
<td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>网站地址:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="255" value="${friendlink.domain}" name="domain" class="required" style="width: 200px;" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>网站类别:</td><td colspan="1" class="pn-fcontent" width="35%"><select name="friendlinkctgId" class="required"><option selected="selected" value="1">文字链接</option></select>
</td><td class="pn-flabel pn-flabel-h" width="15%">站长邮箱:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="100" name="email" value="${friendlink.email}" type="text"></td></tr>
<tr><td id="linkLogo" class="pn-flabel" width="15%">网站LOGO:</td><td colspan="1" class="pn-fcontent" width="35%">
<input id="uploadImgPath0" name="logo" value="${friendlink.logo}" style="width: 180px;" type="text"> <input value="预览" onclick="previewImg(0);" type="button"><br>
<span id="ufc0"><input id="uploadFile0" name="uploadFile" size="14" style="width: 180px;" type="file"></span><input id="mark0" value="false" type="hidden"> <input value="上传" onclick="upload(0);" type="button"><br>
</td><td colspan="2" class="pn-fbutton">
<img <c:if test="${friendlink.logo!=null}">src="<%=basePath %>${friendlink.logo}"</c:if> id="preImg0"  alt="预览" style="width: 100px; height: 70px; background-color: rgb(204, 204, 204); border: 1px solid rgb(51, 51, 51);">
</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="15%">网站简介:</td><td colspan="3" class="pn-fcontent" width="85%"><textarea cols="50" rows="3" name="description" maxlength="255">${friendlink.description}</textarea>
</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>排列顺序:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="11" value="${friendlink.priority}" name="priority"  class="required" style="width: 100px;" type="text"></td><td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>点击次数:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="11"  value="${friendlink.views}" name="views" class="required" style="width: 100px;" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>显示:</td><td colspan="3" class="pn-fcontent" width="85%"><label><input value="true" <c:if test="${friendlink.isEnabled}">checked="checked"</c:if>  name="isEnabled"  class="required" type="radio">是</label> <label><input value="false" <c:if test="${friendlink.isEnabled==false}">checked="checked"</c:if> name="isEnabled" class="required" type="radio">否</label></td>
</tr>
<tr><td colspan="4" class="pn-fbutton">
<input type="hidden" name="friendlinkId" value="${friendlink.friendlinkId}" />
<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset"></td>
</tr></tbody></table>
</form>
</div>

</body></html>