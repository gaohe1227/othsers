<%@ include file="/res/common/jsp/jsp_defined.jsp" %>
<%@ taglib uri="GroupTagLib" prefix="user" %>
<%@ taglib uri="ChannelTagLib" prefix="channel" %>
<%@ taglib uri="TopicTagLib" prefix="topic" %>
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
		<script type="text/javascript" src="${ctx}/thirdparty/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.ext.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.colorpicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/ajaxfileupload.js"></script>
<script type="text/javascript">
var types = [];
	types[0] = {hasImage:false,imgWidth:100,imgHeight:100};
	types[1] = {hasImage:true,imgWidth:143,imgHeight:98};
	types[2] = {hasImage:true,imgWidth:280,imgHeight:200};
	types[3] = {hasImage:false,imgWidth:0,imgHeight:0};
var channels = [];
	channels[0] = {
		id:9,
		hasTitleImg:false,
		titleImgWidth:139,
		titleImgHeight:139,
		hasContentImg:false,
		contentImgWidth:310,
		contentImgHeight:310
	};
	channels[1] = {
		id:37,
		hasTitleImg:false,
		titleImgWidth:139,
		titleImgHeight:139,
		hasContentImg:true,
		contentImgWidth:139,
		contentImgHeight:98
	};
	channels[2] = {
		id:38,
		hasTitleImg:false,
		titleImgWidth:139,
		titleImgHeight:139,
		hasContentImg:true,
		contentImgWidth:139,
		contentImgHeight:98
	};
	channels[3] = {
		id:39,
		hasTitleImg:false,
		titleImgWidth:139,
		titleImgHeight:139,
		hasContentImg:true,
		contentImgWidth:139,
		contentImgHeight:98
	};
function typeChange(n) {
	var tr = $('#tr-typeImg');
	tr.toggle(types[n].hasImage);
	$('#zoomWidth0').val(types[n].imgWidth);
	$('#zoomHeight0').val(types[n].imgHeight);
}
function channelChange(n) {
	if(n==0) {
		return;
	}
	//0为请选择，所以必须减一。
	n--;
	var trt = $('#tr-titleImg');
	var trc = $('#tr-contentImg');
	trt.toggle(channels[n].hasContentImg);
	$('#zoomWidth1').val(channels[n].titleImgWidth);
	$('#zoomHeight1').val(channels[n].titleImgHeight);
	trc.toggle(channels[n].hasTitleImg);
	$('#zoomWidth2').val(channels[n].contentImgWidth);
	$('#zoomHeight2').val(channels[n].contentImgHeight);
	fetchTopics(channels[n].id);
}
function fetchTopics(channelId) {
	$.getJSON("../topic/by_channel.do",{channelId:channelId},function(topics) {
		var ts = $("#topics");
		ts.empty();
		var len = topics.length;
		for(var i=0;i<len;i++) {
			ts.append("<label><input type='checkbox' name='topicIds' value='"+topics[i].id+"'/>"+topics[i].name+"</label> ");
		}
		ts.parent().toggle(len>0);
	});
}
$.validator.methods.leafChannel = function(value, element, param) {
	var i = element.selectedIndex;
	return $(element.options[i]).attr("class")!="sel-disabled";
}
$(function() {
	$("#colorPicker").colorpicker({
	    fillcolor:true,
	    event:'mouseover',
	    target:$("#titleColor"),
	    success:function(o,color){
        	$("#colorPicker").css("background-color",color);
    	}
	});	
	$("#jvForm").validate({
		rules: {
			channelId: {
				required: true,
				leafChannel: true
			},
			mediaType: {
				required: function() {return $("#mediaPath").val()!=""}
			}
		},
		messages:{
			channelId: {
				leafChannel: "请选择末级栏目"
			},
			mediaType:$.validator.messages.required
		}
	});
	//副栏目对话框
	$("#channelsDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 280,
		height: 400,
		position: ["center",20],
		buttons: {
			"OK": function() {
				$("#channelsSelector input[name='channels']:checked").each(function(){
					appendChannels(this);
					$(this).removeAttr("checked");
				});
				$(this).dialog("close");
			}
		}
	});
	$('#channelsLink').click(function(){
		$('#channelsDialog').dialog('open');
		return false;
	});	
	$("#channelsSelector").treeview({
		url: "v_tree_channels.do"
	});
});
function appendChannels(channel) {
	var hasContain = false;
	$("input[name=channelIds]").each(function() {
		if($(this).val()==$(channel).val()) {
			hasContain = true;
		}
	});
	if(hasContain) {
		return;
	}
	var nodeList = eval($(channel).attr("nodeList"));
	var s = "<div style='padding-top:3px'>";
	for(var i=0,len=nodeList.length;i<len;i++) {
		s += nodeList[i];
		if(i<len-1) {
			s += " > ";
		}
	}
	s += " <a href='javascript:void(0);' onclick='$(this).parent().remove();' class='pn-opt'>删除</a>";
	s += "<input type='hidden' name='channelIds' value='"+$(channel).val()+"'/>";
	s += "</div>";
	$("#channelsContainer").append(s);
}
</script>
<style type="text/css">
.sel-disabled{background-color:#ccc}
</style>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="v_add.do_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 内容管理 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
		<input name="cid" value="9" type="hidden">
	</form>
	<div class="clear"></div>
</div>
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
<form id="uploadForm" action="${ctx }/common/o_upload_image.do" method="post" enctype="multipart/form-data" target="hiddenIframe" style="display:none;width:0px;height:0px;">
<span id="fileContent"></span>
<input id="ufWidth" name="zoomWidth" type="hidden">
<input id="ufHeight" name="zoomHeight" type="hidden">
<input id="ufFileName" name="fileName" type="hidden">
<input id="ufMark" name="mark" type="hidden">
<input id="uploadNum" name="uploadNum" type="hidden">
</form>
<iframe name="hiddenIframe" border="0" style="display: none; width: 0px; height: 0px;" frameborder="0"></iframe><script type="text/javascript">
//上传附件
function uploadAttachment(n) {
	var af = $('#attachmentFile'+n);
	//检查是否选择了文件
	if(af.val()=='') {
		alert('请选择要上传的文件');
		return;
	}
    $.ajaxFileUpload({  
        url : "o_upload_attachment.do", // 需要链接到服务器地址  
         
        dataType : "json", // 服务器返回的格式，可以是json  
        fileElementId : "attachmentFile"+n, // 文件选择框的id属性  
        success : function(data, status) // 相当于java中try语句块的用法  
        {  
                $("#attachmentNames"+n).attr("value",data.attachmentName);  
                $("#attachmentPaths"+n).attr("value","${ctx}"+data.path);  
        },  
        error : function(data, status, e) // 相当于java中catch语句块的用法  
        {  
                alert("附件上传失败");  
        }  
	});	
}
</script>
<form id="attachmentForm" action="o_upload_attachment.do" method="post" enctype="multipart/form-data" target="attachment_iframe" style="display:none;width:0px;height:0px;">
<span id="attachmentContent"></span>
<input id="attachmentNum" name="attachmentNum" type="hidden">
</form>
<iframe name="attachment_iframe" border="0" style="display: none; width: 0px; height: 0px;" frameborder="0"></iframe><script type="text/javascript">
//上传附件
function uploadMedia() {
	var mf = $("#mediaFile");
	//检查是否选择了文件
	if(mf.val()=="") {
		alert("请选择要上传的文件");
		return;
	}
    $.ajaxFileUpload({  
        url : "o_upload_media.do", // 需要链接到服务器地址  
         
        dataType : "json", // 服务器返回的格式，可以是json  
        fileElementId : "mediaFile", // 文件选择框的id属性  
        success : function(data, status) // 相当于java中try语句块的用法  
        {  
                $("#mediaPath").attr("value","${ctx}"+data.path);  
        },  
        error : function(data, status, e) // 相当于java中catch语句块的用法  
        {  
                alert("媒体上传失败");  
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
<form id="mediaForm" action="o_upload_media.do" method="post" enctype="multipart/form-data" target="media_iframe" style="display:none;width:0px;height:0px;">
<span id="mediaContent"></span>
<input id="mediaFilename" name="filename" type="hidden">
</form>
<iframe name="media_iframe" border="0" style="display: none; width: 0px; height: 0px;" frameborder="0"></iframe><form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>



<td class="pn-flabel pn-flabel-h" width="10%"><span class="pn-frequired">*</span>栏目:</td><td colspan="3" class="pn-fcontent" width="90%">
<div style="float:left">
<div>
<channel:showChannelSelect channelId="9" showType="CONTENT"/>
		<script type="text/javascript">
			setOptSelected('channelId',${contentDTO.channelId});
		</script>
<input id="channelsLink" value="副栏目" type="button">
<span class="pn-fhelp">只能选择末级栏目</span>
</div>
<div><label for="channelId" class="error" generated="true"></label></div>
<div id="channelsContainer"></div>
</div>

<div style="float:left;padding-left:7px;">
&nbsp;专题: <span id="topics">
<topic:showTopicLabel/>
</span>
 <script type="text/javascript">
function doCheckboxTopic(contentId){
	if(contentId==null||contentId==""){
		return;
	}
	var topics= $("input[name=topicId]");
	$.ajax({
		async:"false",
		type:"GET",
		url:"<%=basePath%>admin/core/content/o_topic.do?contentId="+contentId+"",
		dataType:"json",
		success:function(data){
			for(var i=0;i<topics.length;i++){
				for(var j=0;j<data.length;j++){
					if(topics[i].value==data[j].topicId){
						topics[i].checked="true";
					}
				}
			}
		},
		error:function(msg){
			alert("ERROR:"+msg);
		},
	});
} 
doCheckboxTopic(${contentDTO.contentId});
 </script>
</div>
<div style="clear:both"></div>
</td>

</tr><tr id="tr-title">


<td class="pn-flabel pn-flabel-h" width="10%"><span class="pn-frequired">*</span>软件名称:</td>
<td colspan="3" class="pn-fcontent" width="90%">
<input maxlength="150" name="title" value="${contentDTO.title }" class="required" size="70" type="text"><label><input <c:if test="${contentDTO.link!='' && contentDTO.link!=null}">checked="checked"</c:if>  onclick="$('#linkDiv').toggle(this.checked);"  type="checkbox">外部链接</label>
<div id="linkDiv" <c:if test="${contentDTO.link==''||contentDTO.link==null}"> style="display:none"</c:if>>url: <input id="link" value="${contentDTO.link}" name="link" size="35" maxlength="255" type="text"></div>
</td>

</tr><tr id="tr-shortTitle">


<td class="pn-flabel pn-flabel-h" width="10%">软件简称:</td>
<td colspan="1" class="pn-fcontent" width="40%">
<input maxlength="150" value="${contentDTO.shortTitle }"  name="shortTitle" class="pn-fruler" size="35" type="text">
<div class="pn-fhelp">在列表中显示，留空则显示完整标题</div></td>




<td class="pn-flabel pn-flabel-h" width="10%">标题颜色:</td><td colspan="1" class="pn-fcontent" width="40%">
<input id="titleColor" name="titleColor" value="${contentDTO.titleColor }"  style="width: 70px;" type="text"><input id="colorPicker" tabindex="10000" readonly="readonly"  style="background-color: rgb(0,0,0); width: 30px; border: 1px solid rgb(204, 204, 204); margin-left: 2px; cursor: pointer;"  type="text">
&nbsp; <label><input onclick="$('#bold').val(this.checked)" type="checkbox">加粗<input id="bold" name="isBold" value="false" type="hidden"></label>
<div class="pn-fhelp">在列表中的样式</div></td>

</tr><tr id="tr-description">


<td class="pn-flabel pn-flabel-h" width="10%">摘要:</td><td colspan="3" class="pn-fcontent" width="90%"><textarea cols="70" rows="3" name="description" maxlength="255">${contentDTO.description }</textarea>
</td>

</tr><tr id="tr-author">


<td class="pn-flabel pn-flabel-h" width="10%">发布人:</td><td colspan="1" class="pn-fcontent" width="40%">
<input maxlength="100" name="author" value="${contentDTO.author}" type="text"</td>




<td class="pn-flabel pn-flabel-h" width="10%">浏览权限:</td>
<td colspan="3" class="pn-fcontent" width="90%">

 <user:showGroupSelect showType="GROUPVIEW"/>
 <script type="text/javascript">
function doCheckboxViewGroup(contentId){
	if(contentId==null||contentId==""){
		return;
	}
	var checkboxViewGroup= $("input[name=viewGroupIds]");
	$.ajax({
		async:"false",
		type:"GET",
		url:"<%=basePath%>admin/core/content/o_groupview.do?contentId="+contentId+"",
		dataType:"json",
		success:function(data){
			for(var i=0;i<checkboxViewGroup.length;i++){
				for(var j=0;j<data.length;j++){
					if(checkboxViewGroup[i].value==data[j].groupId){
					   checkboxViewGroup[i].checked="true";
					}
				}
			}
		},
		error:function(msg){
			alert("ERROR:"+msg);
		},
	});
} 
doCheckboxViewGroup(${contentDTO.contentId});
 </script>
 <span class="pn-fhelp">不选则继承栏目权限</span></td>

</tr><tr id="tr-topLevel">


<td class="pn-flabel pn-flabel-h" width="10%">固顶级别:</td><td colspan="1" class="pn-fcontent" width="40%">
<select name="topLevel" id="topLevel">
<option selected="selected" value="0">不固顶</option>
<option value="1">固顶1</option>
<option value="2">固顶2</option>
<option value="3">固顶3</option>
<option value="4">固顶4</option>
<option value="5">固顶5</option>
<option value="6">固顶6</option></select>
		<script type="text/javascript">
			setOptSelected('topLevel',${contentDTO.topLevel});
		</script>
&nbsp;排序时间: <input name="sortDate" value="<fmt:formatDate value="${contentDTO.sortDate}" type="both"/>"  style="width: 140px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text">
</td>




<td class="pn-flabel pn-flabel-h" width="10%">发布时间:</td>
<td colspan="1" class="pn-fcontent" width="40%"><input name="releaseDate" value="<fmt:formatDate value="${contentDTO.releaseDate}" type="both"/>" style="width: 140px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text"> <span class="pn-fhelp">留空则为当前时间</span></td>
</tr>

<tr id="tr-contentImg" <c:choose><c:when test="${channelDTO.hasContentImg==true}">style="display:true;"</c:when><c:otherwise>style="display:none;"</c:otherwise></c:choose>>
<td id="contentImg" class="pn-flabel" width="10%">内容图:</td><td colspan="1" class="pn-fcontent" width="40%">
<input id="uploadImgPath2" name="contentImg" value="${contentDTO.contentImg}" style="width: 220px;" type="text"> <input value="预览" onclick="previewImg(2);" type="button"><br>
<span id="ufc2"><input id="uploadFile2" name="uploadFile" size="14" style="width: 180px;" type="file"></span><label><input onclick="$('#mark2').val(this.checked);" type="checkbox">水印</label><input id="mark2" value="false" type="hidden"> <input value="上传" onclick="upload(2);" type="button"><br>
宽: <input id="zoomWidth2" value="${channelDTO.contentImgWidth }" size="5" type="text"> 高: <input  value="${channelDTO.contentImgHeight }" id="zoomHeight2" size="5" type="text"> <input value="裁剪" onclick="imgCut(2);" type="button"> 
</td><td colspan="2" class="pn-fbutton">
<img id="preImg2" alt="预览" <c:if test="${contentDTO.contentImg!=null}">src="${contentDTO.contentImg}"</c:if> style="width: 100px; height: 70px; background-color: rgb(204, 204, 204); border: 1px solid rgb(51, 51, 51);">
</td>
</tr>

<tr id="tr-attachments">


<td class="pn-flabel" width="10%">软件上传:</td><td colspan="3" class="pn-fcontent" width="90%">
<table id="attachTable" border="0">
<tbody><tr>
	<td align="center"><input onclick="addAttachLine();" value="增加" type="button"></td>
	<td align="center">附件名称</td>
	<td align="center">附件地址</td>
	<td align="center">上传</td>
</tr>
<c:choose>
	<c:when test="${fn:length(contentDTO.attachmentList)>0}">
	<c:forEach items="${contentDTO.attachmentList}" var="attachment" varStatus="status">
<tr id="attachTr${status.index}">
	<td align="center"><a onclick="$('#attachTr${status.index}').remove();" href="javascript:void(0);" class="pn-opt">删除</a></td>
	<td align="center"><input value="${attachment.attachmentName}" id="attachmentNames${status.index}"  name="attachmentNames" type="text"></td>
	<td align="center"><input value="${attachment.attachmentPath}" id="attachmentPaths${status.index}" name="attachmentPaths" type="text"></td>
	<td align="center">
		<span id="afc0"><input id="attachmentFile${status.index}" name="attachmentFile" size="12" style="width: 160px;" type="file"></span>
		<input value="上传" onclick="uploadAttachment(${status.index});" type="button">
		<input id="attachmentFilenames${status.index}" value="${attachment.attachmentName}" name="attachmentFilenames" type="hidden">
	</td>
</tr>	
	</c:forEach>
	</c:when>
	<c:otherwise>
<tr id="attachTr0">
	<td align="center"><a onclick="$('#attachTr0').remove();" href="javascript:void(0);" class="pn-opt">删除</a></td>
	<td align="center"><input id="attachmentNames0" name="attachmentNames" type="text"></td>
	<td align="center"><input id="attachmentPaths0" name="attachmentPaths" type="text"></td>
	<td align="center">
		<span id="afc0"><input id="attachmentFile0" name="attachmentFile" size="12" style="width: 160px;" type="file"></span>
		<input value="上传" onclick="uploadAttachment(0);" type="button">
		<input id="attachmentFilenames0" name="attachmentFilenames" type="hidden">
	</td>
</tr>	
	</c:otherwise>
</c:choose>
</tbody></table>
<textarea id="attachTr" style="display: none;">&lt;tr 
id="attachTr{0}"&gt;
	&lt;td align="center"&gt;&lt;a onclick="$('#attachTr{0}').remove();" 
href="javascript:void(0);" class="pn-opt"&gt;删除&lt;/a&gt;&lt;/td&gt;
	&lt;td align="center"&gt;&lt;input type="text" id="attachmentNames{0}" 
name="attachmentNames"/&gt;&lt;/td&gt;
	&lt;td align="center"&gt;&lt;input type="text" id="attachmentPaths{0}" 
name="attachmentPaths"/&gt;&lt;/td&gt;
	&lt;td align="center"&gt;
		&lt;span id="afc{0}"&gt;&lt;input type="file" id="attachmentFile{0}" 
name="attachmentFile" size="12" style="width:160px"/&gt;&lt;/span&gt;
		&lt;input type="button" value="上传" 
onclick="uploadAttachment({0});"/&gt;
		&lt;input type="hidden" id="attachmentFilenames{0}" 
name="attachmentFilenames"/&gt;
	&lt;/td&gt;
&lt;/tr&gt;
</textarea>
<script type="text/javascript">
var attachIndex = 1;
var attachTpl = $.format($("#attachTr").val());
function addAttachLine() {
	$('#attachTable').append(attachTpl(attachIndex++));
}
</script>
</td>

</tr><tr id="tr-softType">
<td class="pn-flabel pn-flabel-h" width="10%">软件类型:</td><td colspan="1" class="pn-fcontent" width="40%"><select name="attr_softType"><option value="国产软件" selected="selected">国产软件</option><option value="国外软件">国外软件</option></select>
</td>
<td class="pn-flabel pn-flabel-h" width="10%">软件授权:</td><td colspan="1" class="pn-fcontent" width="40%"><select name="attr_warrant"><option value="免费版" selected="selected">免费版</option><option value="共享版">共享版</option></select>
</td></tr><tr id="tr-relatedLink">
<td class="pn-flabel pn-flabel-h" width="10%">相关链接:</td><td colspan="1" class="pn-fcontent" width="40%"><input value="http://${contentDTO.attrList[2].attrValue }" name="attr_relatedLink" size="50" vld="{maxlength:255}" type="text"></td>
<td class="pn-flabel pn-flabel-h" width="10%">演示地址:</td><td colspan="1" class="pn-fcontent" width="40%"><input value="http://${contentDTO.attrList[1].attrValue }" name="attr_demoUrl" size="60" vld="{maxlength:255}" type="text"></td></tr><tr id="tr-txt">


<td class="pn-flabel pn-flabel-h" width="10%">软件介绍:</td>
<td colspan="3" class="pn-fcontent" width="90%">
<script type="text/javascript" charset="utf-8" src="<%=basePath%>thirdparty/kindeditor/kindeditor.js"></script>
	<script type="text/javascript">
<!--
KE.show({
		id : 'txt',
		resizeMode : 1,
		filterMode : true,
		imageUploadJson : '<%=basePath%>thirdparty/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=basePath%>thirdparty/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function(id) {
		KE.event.ctrl(document, 13, function() {
			KE.util.setData(id);
					document.forms['jvForm'].submit();
				});
			KE.event.ctrl(KE.g[id].iframeDoc,13, function() {
					KE.util.setData(id);
					document.forms['jvForm'].submit();
			});
		}
		});

//-->
</script>
<textarea id="txt" name="txt" cols="75" rows="7" style="margin-left:0px;width:100%;height:480px;visibility:hidden;">${contentDTO.txt }</textarea>
<iframe style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; width: 100%; height: 0px;" id="txt___Frame"  frameborder="0" height="230" scrolling="no" width="100%"></iframe>
</td>

</tr><tr id="tr-typeId">


<td class="pn-flabel pn-flabel-h" width="10%">内容类型:</td><td colspan="1" class="pn-fcontent" width="40%">
<select name="typeId" id="typeId" onchange="typeChange(this.selectedIndex)">
<option selected="selected" value="1">普通</option>
<option value="2">图文</option>
<option value="3">焦点</option>
<option value="4">头条</option>
</select>
		<script type="text/javascript">
			setOptSelected('typeId',${contentDTO.typeId});
		</script>
&nbsp; <label><input <c:if test="${contentDTO.isRecommend}">checked="checked"</c:if>  onclick="$('#recommend').val(this.checked)" type="checkbox">推荐<input id="recommend" name="isRecommend" value="${contentDTO.isRecommend}" type="hidden"></label>
&nbsp; <label><input onclick="$('#draft').val(this.checked)" type="checkbox">草稿<input id="draft" name="draft" value="false" type="hidden"></label>
</td>




<td class="pn-flabel pn-flabel-h" width="10%">指定模板:</td><td colspan="1" class="pn-fcontent" width="40%"><select name="tplContent"><option value="" selected="selected">--默认--</option><option value="/red/content/新闻内容.html">/red/content/新闻内容.html</option></select>
</td>

</tr><tr>
<td colspan="4" class="pn-fbutton">
	<input name="contentId" value="${contentDTO.contentId }" type="hidden">
	<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset">
</td></tr></tbody></table>
</form>
</div>


<table style="display: none; position: absolute; margin-top: 0px; border: 1px solid rgb(204, 204, 204); background-color: rgb(255, 255, 255);" border="0" cellpadding="0" cellspacing="5"><tbody><tr height="15"><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FF8080" title="#FF8080">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FFFF80" title="#FFFF80">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#80FF80" title="#80FF80">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#00FF80" title="#00FF80">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#80FFFF" title="#80FFFF">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#0080FF" title="#0080FF">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FF80C0" title="#FF80C0">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FF80FF" title="#FF80FF">&nbsp;<div></div></div></td></tr><tr height="15"><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FF0000" title="#FF0000">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FFFF00" title="#FFFF00">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#80FF00" title="#80FF00">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#00FF40" title="#00FF40">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#00FFFF" title="#00FFFF">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#0080C0" title="#0080C0">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#8080C0" title="#8080C0">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FF00FF" title="#FF00FF">&nbsp;<div></div></div></td></tr><tr height="15"><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#804040" title="#804040">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FF8040" title="#FF8040">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#00FF00" title="#00FF00">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#008080" title="#008080">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#004080" title="#004080">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#8080FF" title="#8080FF">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#800040" title="#800040">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FF0080" title="#FF0080">&nbsp;<div></div></div></td></tr><tr height="15"><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#800000" title="#800000">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FF8000" title="#FF8000">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#008000" title="#008000">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#008040" title="#008040">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#0000FF" title="#0000FF">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#0000A0" title="#0000A0">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#800080" title="#800080">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#8000FF" title="#8000FF">&nbsp;<div></div></div></td></tr><tr height="15"><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#400000" title="#400000">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#804000" title="#804000">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#004000" title="#004000">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#004040" title="#004040">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#000080" title="#000080">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#000040" title="#000040">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#400040" title="#400040">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#400080" title="#400080">&nbsp;<div></div></div></td></tr><tr height="15"><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#000000" title="#000000">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#808000" title="#808000">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#808040" title="#808040">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#808080" title="#808080">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#408080" title="#408080">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#C0C0C0" title="#C0C0C0">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#400040" title="#400040">&nbsp;<div></div></div></td><td width="15"><div class="c" style="width:13px;height:13px;border:1px solid #fff;cursor:pointer;background-color:#FFFFFF" title="#FFFFFF">&nbsp;<div></div></div></td></tr></tbody></table><div aria-labelledby="ui-dialog-title-channelsDialog" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable" style="display: none; position: absolute; overflow: hidden; z-index: 1000; outline: 0px none;"><div style="-moz-user-select: none;" unselectable="on" class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span style="-moz-user-select: none;" unselectable="on" id="ui-dialog-title-channelsDialog" class="ui-dialog-title">请选择副栏目</span><a style="-moz-user-select: none;" unselectable="on" role="button" class="ui-dialog-titlebar-close ui-corner-all" href="#"><span style="-moz-user-select: none;" unselectable="on" class="ui-icon ui-icon-closethick">close</span></a></div><div class="ui-dialog-content ui-widget-content" id="channelsDialog" style="">
<ul id="channelsSelector" class="filetree treeview"><li class="open expandable lastExpandable" id=""><div class="hitarea open-hitarea expandable-hitarea lastExpandable-hitarea "></div><span class="folder">根目录</span><ul><li class="hasChildren expandable" id="1"><div class="hitarea hasChildren-hitarea expandable-hitarea "></div><span class="folder">新闻资讯</span><ul style="display: none;"><li class="last" id="placeholder"><span>placeholder</span></li></ul></li><li class="hasChildren expandable" id="2"><div class="hitarea hasChildren-hitarea expandable-hitarea "></div><span class="folder">影视娱乐</span><ul style="display: none;"><li class="last" id="placeholder"><span>placeholder</span></li></ul></li><li class="hasChildren expandable" id="3"><div class="hitarea hasChildren-hitarea expandable-hitarea "></div><span class="folder">财经报道</span><ul style="display: none;"><li class="last" id="placeholder"><span>placeholder</span></li></ul></li><li class="hasChildren expandable" id="4"><div class="hitarea hasChildren-hitarea expandable-hitarea "></div><span class="folder">房产资讯</span><ul style="display: none;"><li class="last" id="placeholder"><span>placeholder</span></li></ul></li><li class="hasChildren expandable" id="5"><div class="hitarea hasChildren-hitarea expandable-hitarea "></div><span class="folder">体育世界</span><ul style="display: none;"><li class="last" id="placeholder"><span>placeholder</span></li></ul></li><li class="hasChildren expandable" id="6"><div class="hitarea hasChildren-hitarea expandable-hitarea "></div><span class="folder">科技创新</span><ul style="display: none;"><li class="last" id="placeholder"><span>placeholder</span></li></ul></li><li class="hasChildren expandable" id="7"><div class="hitarea hasChildren-hitarea expandable-hitarea "></div><span class="folder">时尚汽车</span><ul style="display: none;"><li class="last" id="placeholder"><span>placeholder</span></li></ul></li><li class="hasChildren expandable lastExpandable" id="9"><div class="hitarea hasChildren-hitarea expandable-hitarea lastExpandable-hitarea "></div><span class="folder">下载中心</span><ul style="display: none;"><li class="last" id="placeholder"><span>placeholder</span></li></ul></li></ul></li></ul>
</div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-n"></div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-e"></div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-s"></div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-w"></div><div unselectable="on" style="z-index: 1001; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div unselectable="on" style="z-index: 1002; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-sw"></div><div unselectable="on" style="z-index: 1003; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-ne"></div><div unselectable="on" style="z-index: 1004; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"><button class="ui-state-default ui-corner-all" type="button">OK</button></div></div><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe></body></html>