<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<%@ taglib uri="ChannelTagLib" prefix="channel" %>
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
$(function(){
    $('#channelTree').tree({   
	      checkbox: false,   
	      url: '<%=basePath%>admin/core/channel/v_asyncEasyTree.do',   
	      onBeforeExpand:function(node,param){
	            $('#channelTree').tree('options').url = "<%=basePath%>admin/core/channel/v_asyncEasyTree.do?parentId=" + node.id;// change the url                       
	                     //param.myattr = 'test';    // or change request parameter
	      },               
	      onClick:function(node){             
	             $("#chname").empty();
	             $("#chname").val(node.text);
	             $("#channelId").val(node.id);
	      }   
   });   
}); 
function showMenu() {  
   var cityObj = $("#chname");//输入框  
   var cityOffset = $("#chname").offset();//获取匹配元素在当前视口的相对偏移  
   //cityOffset.left 元素在当前视口的相对偏移  
   //slideDown 通过高度变化（向下增大）来动态地显示所有匹配的元素，在显示完成后可选地触发一个回调函数。  
   $("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");  
     
   $("body").bind("mousedown", onBodyDown);//给body绑定鼠标按下事件  
}  
function hideMenu() {  
   $("#menuContent").fadeOut("fast");  
   $("body").unbind("mousedown", onBodyDown);  
}
//event 代表事件的状态，比如事件在其中发生的元素、键盘按键的状态、鼠标的位置、鼠标按钮的状态。  
//event.target 直接接受事件的目标DOM元素  
function onBodyDown(event) {  
   //如果接受事件的目标DOM元素的id 不是menuBtn（选择） 或 不是menuContent（菜单内容） 或  menuContent对象中元素的个数不大于0  
   //点击不是选择按钮，不是菜单内容的时候就隐藏下拉目录  
   if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {  
       hideMenu();  
   }  
}
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="content_theme_save_update_files/My97DatePicker.html" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 专题管理 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
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
<form id="uploadForm" action="${ctx}/common/o_upload_image.do" method="post" enctype="multipart/form-data" target="hiddenIframe" style="display:none;width:0px;height:0px;">
<span id="fileContent"></span>
<input id="ufWidth" name="zoomWidth" type="hidden">
<input id="ufHeight" name="zoomHeight" type="hidden">
<input id="ufFileName" name="fileName" type="hidden">
<input id="ufMark" name="mark" type="hidden">
<input id="uploadNum" name="uploadNum" type="hidden">
</form>
<iframe name="hiddenIframe" border="0" style="display: none; width: 0px; height: 0px;" frameborder="0"></iframe>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>名称:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="150" name="topicName" value="${topic.topicName}" class="required" type="text"></td>
<td class="pn-flabel pn-flabel-h" width="12%">所属栏目:</td>
<td colspan="1" class="pn-fcontent" width="38%">
<input id="chname" type="text" readonly value="<channel:showChannelSelect showType="SHOWNAME" channelId="${topic.channelId}"/>" style="width:120px;"/>&nbsp;&nbsp;<a id="menuBtn" href="#" onClick="showMenu(); return false;">选择</a>
<input id="channelId" name="channelId" type="hidden" value="${topic.channelId}"/>
     <div id="menuContent" style="display:none; position: absolute;width:160px;background: #fff;">
         <ul id="channelTree" style="margin-top:0; width:160px;">
         </ul>
     </div>		
</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">简称:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="150" name="shortName" value="${topic.shortName}" type="text"> <span class="pn-fhelp">用于内容选择专题</span></td><td class="pn-flabel pn-flabel-h" width="12%">关键字:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="255" name="keywords" value="${topic.keywords}" style="width: 220px;" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">描述:</td><td colspan="3" class="pn-fcontent" width="88%"><textarea cols="70" rows="3" name="description"  maxlength="255">${topic.description}</textarea>
</td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">推荐:</td><td colspan="1" class="pn-fcontent" width="38%"><label><input value="true" name="isRecommend" type="radio">是</label> <label><input value="false" checked="checked" name="isRecommend" type="radio">否</label></td>
<td class="pn-flabel pn-flabel-h" width="12%"><span class="pn-frequired">*</span>排列顺序:</td><td colspan="1" class="pn-fcontent" width="38%"><input maxlength="5" value="${topic.priority}" name="priority" class="required" style="width: 70px;" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="12%">模板:</td><td colspan="3" class="pn-fcontent" width="88%"><select name="tplContent"><option value="" selected="selected">--默认--</option></select>
</td></tr>
<tr><td class="pn-flabel" width="12%">标题图:</td><td colspan="1" class="pn-fcontent" width="38%">
<input id="uploadImgPath1" name="titleImg" value="${topic.titleImg}"  style="width: 220px;" type="text"> <input value="预览" onclick="previewImg(1);" type="button"><br>
<span id="ufc1"><input id="uploadFile1" name="uploadFile" size="14" style="width: 180px;" type="file"></span><label><input onclick="$('#mark1').val(this.checked);" type="checkbox">水印</label><input id="mark1" value="false" type="hidden"> <input value="上传" onclick="upload(1);" type="button"><br>
宽: <input id="zoomWidth1" value="139" size="5" type="text"> 高: <input id="zoomHeight1" value="139" size="5" type="text"> <input value="裁剪" onclick="imgCut(1);" type="button"> 
</td><td colspan="2" class="pn-fbutton">
<img id="preImg1" alt="预览" style="width: 100px; height: 70px; background-color: rgb(204, 204, 204); border: 1px solid rgb(51, 51, 51);">
</td></tr>
<tr><td class="pn-flabel" width="12%">内容图:</td><td colspan="1" class="pn-fcontent" width="38%">
<input id="uploadImgPath2" name="contentImg" value="${topic.contentImg}"  style="width: 220px;" type="text"> <input value="预览" onclick="previewImg(2);" type="button"><br>
<span id="ufc2"><input id="uploadFile2" name="uploadFile" size="14" style="width: 180px;" type="file"></span><label><input onclick="$('#mark2').val(this.checked);" type="checkbox">水印</label><input id="mark2" value="false" type="hidden"> <input value="上传" onclick="upload(2);" type="button"><br>
宽: <input id="zoomWidth2" value="310" size="5" type="text"> 高: <input id="zoomHeight2" value="310" size="5" type="text"> <input value="裁剪" onclick="imgCut(2);" type="button"> 
</td><td colspan="2" class="pn-fbutton">
<img id="preImg2" alt="预览" style="width: 100px; height: 70px; background-color: rgb(204, 204, 204); border: 1px solid rgb(51, 51, 51);">
</td></tr>
<tr><td colspan="4" class="pn-fbutton">
<input type="hidden" name="topicId" value="${topic.topicId}"/>
<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset"></td>
</tr></tbody></table>
</form>
</div>

</body></html>