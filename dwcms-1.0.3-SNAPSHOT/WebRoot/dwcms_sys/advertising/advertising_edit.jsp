<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<%@ taglib uri="AdvertisingSpaceTagLib" prefix="advertisingspace" %>
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
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.ext.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.colorpicker.js"></script>		
		<script type="text/javascript" src="<%=basePath%>res/common/js/ajaxfileupload.js"></script>			
<script type="text/javascript">
$(function() {
	$("#colorPicker").colorpicker({
	    fillcolor:true,
	    event:'mouseover',
	    target:$("#textColor"),
	    success:function(o,color){
        	$("#colorPicker").css("background-color",color);
    	}
	});		
	var cotegory= "${advertisingDto.category}";
	if(cotegory==""){
		cotegory="image";
	}
	attrChange(cotegory);
	$("#textColor").colorPicker();
	$("#jvForm").validate();
});
var attr_all=["image","flash","text","code"];
function attrChange(value) {
	for(var attr in attr_all) {
		if(attr_all[attr]==value) {
			showAttr(attr_all[attr]);
		} else {
			hideAttr(attr_all[attr]);
		}
	}
}
function hideAttr(value) {
	var name = "#attr_"+value;
	$(name).hide();
	$(name+" input,"+name+" select,"+name+" textarea").each(function() {
		$(this).attr("disabled","disabled");
	});
}
function showAttr(value) {
	var name = "#attr_"+value;
	$("#attr_"+value).show();
	$(name+" input,"+name+" select,"+name+" textarea").each(function() {
		$(this).removeAttr("disabled");
	});
}
</script>
<style type="text/css">
.attr{padding:3px;margin:0;}
</style>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="ad_save_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
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
<iframe name="hiddenIframe" border="0" style="display: none; width: 0px; height: 0px;" frameborder="0"></iframe><script type="text/javascript">
//上传Flash
function uploadFlash(n) {
	var of = $("#flashFile"+n);
	//检查是否选择了图片
	if(of.val()=="") {
		alert("请先选择flash");
		return;
	}
    $.ajaxFileUpload({  
        url : "o_upload_flash.do", // 需要链接到服务器地址  
         
        dataType : "json", // 服务器返回的格式，可以是json  
        fileElementId : "flashFile"+n, // 文件选择框的id属性  
        success : function(data, status) // 相当于java中try语句块的用法  
        {  
                $("#flashPath"+n).val(data.path);  
                imagePath=data.path;
        },  
        error : function(data, status, e) // 相当于java中catch语句块的用法  
        {  
                alert("Flash上传失败");  
        }  
	});
}
function setOptSelected(elementId,eValue){
	if(eValue==null){return;}
	var statusSelect = document.getElementById(elementId);
	var statusOptions= statusSelect.options;
	for(var i=0 ;i< statusOptions.length;i++){
		if(statusOptions[i].value==eValue ){
			statusOptions[i].selected='selected';
		}	
	}
}
</script>
<form id="flashForm" action="o_upload_flash.do" method="post" enctype="multipart/form-data" target="flash_iframe" style="display:none;width:0px;height:0px;">
<span id="flashContent"></span>
<input id="flashNum" name="flashNum" type="hidden">
</form>
<iframe name="flash_iframe" border="0" style="display: none; width: 0px; height: 0px;" frameborder="0"></iframe><div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 广告管理 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>名称:</td>
<td colspan="1" class="pn-fcontent" width="38%"><input maxlength="100" name="adName" value="${advertisingDto.adName }" class="required" type="text"></td>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>版位:</td>
<td colspan="1" class="pn-fcontent" width="38%">
<advertisingspace:showAdvertisingSpaceSelect/>
		<script type="text/javascript">
			setOptSelected('adspaceId',${advertisingDto.adspaceId});
		</script>	

</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>类型:</td>
<td colspan="3" class="pn-fcontent" width="88%"><label>
<input value="image" <c:if test="${advertisingDto.category=='image'}">checked="checked"</c:if>  name="category" onclick="attrChange(this.value)" type="radio">图片</label> 
<label><input value="flash" <c:if test="${advertisingDto.category=='flash'}">checked="checked"</c:if> name="category" onclick="attrChange(this.value)" type="radio">FLASH</label> 
<label><input value="text" <c:if test="${advertisingDto.category=='text'}">checked="checked"</c:if> name="category" onclick="attrChange(this.value)" type="radio">文字</label>
<label><input value="code" <c:if test="${advertisingDto.category=='code'}">checked="checked"</c:if> name="category" onclick="attrChange(this.value)" type="radio">代码</label>
</td>
</tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>广告内容:</td><td colspan="3" class="pn-fcontent" width="88%">

<div id="attr_image">
	<p class="attr">图片地址: <input id="uploadImgPath1" name="attr_image_url" value="${image_url}" class="required" maxlength="255" style="width: 300px;" type="text"></p>
	<p class="attr">图片上传: <span id="ufc1"><input id="uploadFile1" name="uploadFile" type="file"></span> <input value="上传" onclick="upload(1);" type="button"><input id="mark1" value="false" type="hidden"></p>
	<p class="attr">图片尺寸: <input name="attr_image_width" value="${image_width}" maxlength="50" style="width: 70px;" type="text"> * <input name="attr_image_height" value="${image_height}" maxlength="50" style="width: 70px;" type="text"> <span class="pn-fhelp">（宽×高）</span></p>
	<p class="attr">链接地址: <input name="attr_image_link" value="${image_link}" maxlength="255" style="width: 300px;" type="text"></p>
	<p class="attr">链接提示: <input name="attr_image_title" value="${image_title}" maxlength="255" style="width: 300px;" type="text"></p>
	<p class="attr">链接目标: <label><input value="_blank" <c:if test="${image_target=='_blank'}">checked="checked"</c:if>  name="attr_image_target" type="radio">新窗口</label> <label><input value="_self" <c:if test="${image_target=='_self'}">checked="checked"</c:if> name="attr_image_target" type="radio">原窗口</label>
</p>
</div>

<div id="attr_flash" style="display:none;">
	<p class="attr">FLASH地址: <input disabled="disabled" id="flashPath1" name="attr_flash_url" value="${flash_url}"  class="required" maxlength="255" style="width: 300px;" type="text"></p>
	<p class="attr">FLASH上传: <span id="ffc1"><input disabled="disabled" id="flashFile1" name="flashFile" type="file"></span> <input disabled="disabled" value="上传" onclick="uploadFlash(1);" type="button"></p>
	<p class="attr">FLASH尺寸: <input disabled="disabled" name="attr_flash_width" value="${flash_width}" maxlength="50" style="width: 70px;" type="text"> * <input disabled="disabled" name="attr_flash_height"  value="${flash_height}" maxlength="50" style="width: 70px;" type="text"> <span class="pn-fhelp">（宽×高）</span></p>
</div>

<div id="attr_text" style="display:none;">
	<p class="attr">文字内容: <input disabled="disabled" name="attr_text_title" value="${text_title}" class="required" maxlength="255" style="width: 300px;" type="text"></p>
	<p class="attr">文字链接: <input disabled="disabled" name="attr_text_link" value="${text_link}" maxlength="255" style="width: 300px;" type="text"></p>
	<p class="attr">文字颜色: <input disabled="disabled" id="textColor" name="attr_text_color" value="${text_color}" maxlength="50" style="width: 70px;" type="text"><input id="colorPicker"  tabindex="10000" readonly="readonly" style="background-color: rgb(255, 255, 255); width: 30px; border: 1px solid rgb(204, 204, 204); margin-left: 2px; cursor: pointer;" type="text"></p>
	<p class="attr">文字大小: <input disabled="disabled" name="attr_text_font" maxlength="50" value="${text_font}" style="width: 70px;" type="text"> <span class="pn-fhelp">如：12px</span></p>
	<p class="attr">链接目标: <label><input disabled="disabled" value="_blank" <c:if test="${text_target=='_blank'}">checked="checked"</c:if>  name="attr_text_target" type="radio">新窗口</label> <label><input disabled="disabled" value="_self" <c:if test="${text_target=='_self'}">checked="checked"</c:if> name="attr_text_target" type="radio">原窗口</label>
</p>
</div>

<div id="attr_code" style="display:none;">
	<textarea disabled="disabled" name="code" rows="7" cols="60" maxlength="655350">${code}</textarea>
</div>

</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">开始时间:</td><td colspan="1" class="pn-fcontent" width="38%"><input name="startTime" value="<fmt:formatDate value="${advertisingDto.startTime}" type="both"/>"  style="width: 120px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" type="text"></td>
<td class="pn-flabel pn-flabel-h" width="12%">结束时间:</td><td colspan="1" class="pn-fcontent" width="38%"><input name="endTime" value="<fmt:formatDate value="${advertisingDto.endTime}" type="both"/>"   style="width: 120px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>点击次数:</td><td colspan="1" class="pn-fcontent" width="38%"><input value="${advertisingDto.clickCount}" name="clickCount"  class="required digits" style="width: 70px;" type="text"></td>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>展现次数:</td><td colspan="1" class="pn-fcontent" width="38%"><input value="${advertisingDto.displayCount}" name="displayCount" class="required digits" style="width: 70px;" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>权重:</td><td colspan="1" class="pn-fcontent" width="38%"><input value="${advertisingDto.adWeight}" name="adWeight" class="required digits" style="width: 70px;" type="text"></td>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>启用:</td><td colspan="1" class="pn-fcontent" width="38%"><label><input value="true" <c:if test="${advertisingDto.isEnabled==1}">checked="checked" </c:if> name="isEnabled" type="radio">是</label> <label><input value="false" <c:if test="${advertisingDto.isEnabled==0}">checked="checked" </c:if> name="isEnabled" type="radio">否</label></td>
</tr>
<tr><td colspan="4" class="pn-fbutton">
<input type="hidden" name="advertisingId" value="${advertisingDto.advertisingId }" />
<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset"></td>
</tr></tbody></table>
</form>
</div>
</body>
</html>
