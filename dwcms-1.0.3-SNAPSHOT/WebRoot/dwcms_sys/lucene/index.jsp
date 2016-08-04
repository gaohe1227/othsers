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
		<script type="text/javascript" src="${ctx}/thirdparty/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/pony.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.ext.js"></script>
<script type="text/javascript">
function luceneSubmit() {
	$.get("o_create.do", {
		"startDate" : $("#startDate").val(),
		"endDate" : $("#endDate").val(),
		"max" : $("#max").val(),
		"siteId" : $("#siteId").val(),
		"channelId" : $("#channelId").val(),
		"startId" : $("#startId").val()
	}, function(data) {
		if(data.success) {
			if(data.lastId && $("#stop").val()=="") {
				$("#startId").val(data.lastId);
				luceneSubmit();
			} else {
				$("#startId").val("");
				alert("操作成功");
				$("#submitButton").removeAttr("disabled");
				$("#cancelButton").attr("disabled","disabled");
				$("#stop").val("");
			}
		} else {
			alert(data.msg);
			$("#submitButton").removeAttr("disabled");
			$("#cancelButton").attr("disabled","disabled");
			$("#stop").val("");
		}
	}, "json");
}

$(function() {
	$("#jvForm").validate( {
		submitHandler : function(form) {
			$("#submitButton").attr("disabled","disabled");
			$("#cancelButton").removeAttr("disabled");
			$("#stop").val("");		
			luceneSubmit();
		}
	});
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
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 全文检索</div>
	<form class="ropt">
	</form>
	<div class="clear"></div>
</div>
<form method="get" action="o_create.do" id="jvForm">
<table class="pn-ftable" width="100%" border="0" cellpadding="2" cellspacing="1">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="20%">栏目:</td><td class="pn-fcontent" width="80%">
<input id="chname" type="text" readonly value="<channel:showChannelSelect showType="SHOWNAME" channelId="0"/>" style="width:120px;"/>&nbsp;&nbsp;<a id="menuBtn" href="#" onClick="showMenu(); return false;">选择</a>
<input id="channelId" name="channelId" type="hidden" value="0"/>
     <div id="menuContent" style="display:none; position: absolute;width:160px;background: #fff;">
         <ul id="channelTree" style="margin-top:0; width:160px;">
         </ul>
     </div>
</td></tr><tr><td class="pn-flabel pn-flabel-h" width="20%">开始日期:</td><td class="pn-fcontent" width="80%"><input id="startDate" name="startDate" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" type="text"></td></tr><tr><td class="pn-flabel pn-flabel-h" width="20%">结束日期:</td><td class="pn-fcontent" width="80%"><input id="endDate" name="endDate" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" type="text"></td></tr><tr><td class="pn-flabel pn-flabel-h" width="20%"><span class="pn-frequired">*</span>每次生成数量:</td><td class="pn-fcontent" width="80%"><input id="max" min="10" value="1000" name="max" class="required digits" type="text"></td></tr><tr><td colspan="2" class="pn-fbutton">
	<input id="siteId" name="siteId" value="1" type="hidden">
	<input id="startId" name="startId" type="hidden">
	<input id="stop" value="" type="hidden">
	<input id="submitButton" value="生成索引" type="submit">
&nbsp; <input id="cancelButton" value="取消" disabled="disabled" onclick="$('#stop').val('1')" type="button">
</td></tr></tbody></table>
</form>
</div>

</body></html>