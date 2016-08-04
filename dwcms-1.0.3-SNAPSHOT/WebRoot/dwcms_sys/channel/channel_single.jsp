<%@include   file="/res/common/jsp/jsp_defined.jsp" %>
<%@ taglib uri="GroupTagLib" prefix="user" %>
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
</script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
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
        secureuri : false,  
        dataType : "json", // 服务器返回的格式，可以是json  
        fileElementId : "uploadFile"+n, // 文件选择框的id属性  
        success : function(data, status) // 相当于java中try语句块的用法  
        {  
                alert("上传成功: " +status);  
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
		             $("#parentId").val(node.id);
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
	<div class="rpos">当前位置:  栏目管理 - <c:choose>
		<c:when test="${channelDto.channelId !=null}">修改</c:when>
		<c:otherwise>添加</c:otherwise>
	</c:choose></div>
	<form class="ropt">
		<input id="channelId" name="channelId" value="${channelDto.parentId }" type="hidden">
		<select name="modelId" onchange="if(this.options[this.selectedIndex].value!=''){this.form.action='v_add.do';this.form.submit();}">
			<option selected="selected" value="">--添加子栏目--</option>
			<option value="1">新闻</option>
			<option value="2">单页</option>
			<option value="3">作品</option>
			<option value="4">下载</option>
		</select>
&nbsp;	<input value="返回列表" onclick="$('#root').val('');this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="10%">上级栏目:</td><td colspan="1" class="pn-fcontent" width="40%">
<input id="chname" type="text" readonly value="<channel:showChannelSelect showType="SHOWNAME" channelId="${channelDto.parentId}"/>" style="width:120px;"/>&nbsp;&nbsp;<a id="menuBtn" href="#" onClick="showMenu(); return false;">选择</a>
<input id="parentId" name="parentId" type="hidden" value="${channelDto.parentId}"/>
     <div id="menuContent" style="display:none; position: absolute;width:160px;background: #fff;">
         <ul id="channelTree" style="margin-top:0; width:160px;">
         </ul>
     </div>		
</td><td class="pn-flabel pn-flabel-h" width="10%">模型:</td><td colspan="1" class="pn-fcontent" width="40%">
<input id="modelId" name="modelId" value="${model.modelId }" type="hidden">
${model.modelName }</td></tr>
<tr>

<td class="pn-flabel pn-flabel-h" width="10%"><span class="pn-frequired">*</span>栏目名称:</td><td colspan="1" class="pn-fcontent" width="40%"><input maxlength="100" value="${channelDto.channelName }" name="channelName" class="required" type="text"></td>

<td class="pn-flabel pn-flabel-h" width="10%"><span class="pn-frequired">*</span>访问路径:</td><td colspan="1" class="pn-fcontent" width="40%"><input maxlength="30" value="${channelDto.channelPath}" name="channelPath" class="required" type="text"></td>
</tr>
<tr>



<td class="pn-flabel pn-flabel-h" width="10%">meta标题:</td><td colspan="1" class="pn-fcontent" width="40%"><input maxlength="255" value="${channelDto.title}" name="title" size="35" type="text"></td>



<td class="pn-flabel pn-flabel-h" width="10%">meta关键字:</td><td colspan="1" class="pn-fcontent" width="40%"><input maxlength="255" value="${channelDto.keywords}" name="keywords" size="35" type="text"></td></tr>
<tr>



<td class="pn-flabel pn-flabel-h" width="10%">meta描述:</td><td colspan="3" class="pn-fcontent" width="90%"><textarea cols="70" rows="3" name="description" maxlength="255">${channelDto.description}</textarea>
</td></tr>
<tr>



<td class="pn-flabel pn-flabel-h" width="10%">栏目模板:</td><td colspan="1" class="pn-fcontent" width="40%"><select name="tplChannel"><option value="">--默认--</option><option value="/red/channel/新闻栏目.html">/red/channel/新闻栏目.html</option><option value="/red/channel/新闻栏目_父级.html" selected="selected">/red/channel/新闻栏目_父级.html</option></select>
</td>



<td class="pn-flabel pn-flabel-h" width="10%"><span class="pn-frequired">*</span>排列顺序:</td><td colspan="1" class="pn-fcontent" width="40%"><input maxlength="255" value="${channelDto.priority}" name="priority" class="reuqired digits" size="10" type="text"></td>

</tr>
<tr>



<td class="pn-flabel pn-flabel-h" width="10%"><span class="pn-frequired">*</span>显示:</td><td colspan="1" class="pn-fcontent" width="40%">
<label><input value="true" <c:if test="${channelDto.isDisplay}">checked="checked"</c:if>   name="isDisplay" type="radio">是</label> <label><input value="false"  <c:if test="${channelDto.isDisplay==false}">checked="checked"</c:if> name="isDisplay" type="radio">否</label>
&nbsp; <label><input  onclick="$('#blank').val(this.checked);" <c:if test="${channelDto.isBlank}"> checked="checked"</c:if> type="checkbox">新窗口打开</label><input id="blank" name="isBlank" value="0" type="hidden">
</td>



<td class="pn-flabel pn-flabel-h" width="10%">浏览权限:</td><td colspan="1" class="pn-fcontent" width="40%">

<user:showGroupSelect showType="GROUPVIEW"/>
</td>

</tr>
<tr>






<td class="pn-flabel pn-flabel-h" width="10%">外部链接:</td><td colspan="3" class="pn-fcontent" width="90%"><input maxlength="255" name="link" size="35" value="${channelDto.link }" type="text"> <span class="pn-fhelp">直接使用该地址作为url</span></td></tr>
<tr>



<td class="pn-flabel" width="10%">内容图:</td><td colspan="1" class="pn-fcontent" width="40%">
<input id="uploadImgPath2" name="contentImg" style="width: 220px;" type="text" value="${channelDto.contentImg }"> 
<input value="预览" onclick="previewImg(2);" type="button"><br>
<span id="ufc1"><input id="uploadFile2" name="uploadFile" size="14" style="width: 180px;" type="file"></span> <label>
<input onclick="$('#mark1').val(this.checked);" type="checkbox">水印</label>
<input id="mark1" value="false" type="hidden"> 
<input value="上传" onclick="upload(2);" type="button"><br>
宽: <input id="zoomWidth1" value="139" size="5" type="text"> 
高: <input id="zoomHeight1" value="139" size="5" type="text"> 
<input value="裁剪" onclick="imgCut(2);" type="button"> 
</td><td colspan="2" class="pn-fbutton">
<img id="preImg2" alt="预览" src="${ctx }${channelDto.contentImg }" style="width: 100px; height: 70px; background-color: rgb(204, 204, 204); border: 1px solid rgb(51, 51, 51);">
</td></tr>


<tr>
<td class="pn-flabel pn-flabel-h" width="10%">内容:</td><td colspan="3" class="pn-fcontent" width="90%">
<script type="text/javascript" charset="utf-8" src="<%=basePath%>thirdparty/kindeditor/kindeditor.js"></script>
	<script type="text/javascript">
<!--
KE.show({
		id : 'txt',
		resizeMode : 0,
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
<textarea id="txt" name="txt" cols="75" rows="8" style="margin-left:0px;width:100%;height:480px;visibility:hidden;">${channelDto.txt }</textarea>
<iframe style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; width: 100%; height: 0px;" id="txt___Frame"  frameborder="0" height="230" scrolling="no" width="100%"></iframe>
</td></tr>



<tr>
<td colspan="4" class="pn-fbutton">
<input name="channelId" value="${channelDto.channelId }" type="hidden">
	<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset">
</td></tr></tbody></table>
</form>
</div>

<iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe><iframe src="javascript:void(0)" style="margin: 0pt; padding: 0pt; border: 0pt none; background-color: transparent; background-image: none; height: 0px; width: 0px; position: absolute; z-index: 10000;" frameborder="0" scrolling="no"></iframe>
<script type="text/javascript">
function doCheckboxViewGroup(channelId){
	if(channelId==null||channelId==""){
		return;
	}
	var checkboxViewGroup= $("input[name=viewGroupIds]");
	$.ajax({
		async:"false",
		type:"GET",
		url:"<%=basePath%>admin/core/channel/o_groupview.do?channelId="+channelId+"",
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
function doCheckboxGroupContri(channelId){
	if(channelId==null||channelId==""){
		return;
	}
	var checkboxGroupContri= $("input[name=groupContriIds]");
	$.ajax({
		async:"false",
		type:"GET",
		url:"<%=basePath%>admin/core/channel/o_groupcontri.do?channelId="+channelId+"",
		dataType:"json",
		success:function(data){
			for(var i=0;i<checkboxGroupContri.length;i++){
				for(var j=0;j<data.length;j++){
					if(checkboxGroupContri[i].value==data[j].groupId){
					   checkboxGroupContri[i].checked="true";
					}
				}
			}
		},
		error:function(msg){
			alert("ERROR:"+msg);
		},
	});
}  
doCheckboxViewGroup(${channelDto.channelId});
doCheckboxGroupContri(${channelDto.channelId});
</script>
</body></html>