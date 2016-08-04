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
<script type="text/javascript">
function disablePerms() {
	if($("input[name=isSuper]:checked").val()==1) {
		$(".perm-container input[type=checkbox]").attr("disabled","disabeld");
	} else {
		$(".perm-container input[type=checkbox]").removeAttr("disabled");
	}
}
$(function() {
	$("#jvForm").validate();
	
	$("input[name=isSuper]").bind("click",function(){
		disablePerms();
	});
});
</script>
<style type="text/css">
.perm-container{}
.perm-layout-1{padding:3px 0;}
.perm-layout-2{padding-left:30px;}
</style>
</head>
<body>

<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 角色管理 - 添加</div>
	<form class="ropt">
		<input value="返回列表" onclick="this.form.action='v_list.do';" type="submit">
	</form>
	<div class="clear"></div>
</div>
<form method="post" action="o_save.do" id="jvForm">
<table class="pn-ftable" border="0" cellpadding="2" cellspacing="1" width="100%">
<tbody><tr>
<td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>角色名:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="100" name="roleName" value="${role.roleName}" class="required" type="text"></td><td class="pn-flabel pn-flabel-h" width="15%"><span class="pn-frequired">*</span>排列顺序:</td><td colspan="1" class="pn-fcontent" width="35%"><input maxlength="5" value="${role.priority }" name="priority" class="required digits" style="width: 70px;" type="text"></td></tr>
<tr><td class="pn-flabel pn-flabel-h" width="15%">拥有所有权限:</td>
<td colspan="3" class="pn-fcontent" width="85%">
	<c:choose>
		<c:when test="${role.isSuper==1}">
	<label><input value="1" checked="checked" name="isSuper" type="radio">是</label> 
	<label><input value="0"  name="isSuper" type="radio">否</label>	
		</c:when>
		<c:otherwise>
	<label><input value="1" name="isSuper" type="radio">是</label> 
	<label><input value="0" checked="checked" name="isSuper" type="radio">否</label>		
		</c:otherwise>
	</c:choose>
</td>
</tr>
<tr><td class="pn-flabel pn-flabel-h" width="15%">功能权限:</td><td colspan="3" class="pn-fcontent" width="85%">
<div class="perm-container">
<input name="perms" value="/index.do,/top.do,/main.do,/left.do,/right.do" type="hidden">
<div class="perm-layout-1">
<label><input value="/personal/" name="perms" type="checkbox">个人资料</label>
</div>

<div class="perm-layout-1">
<label><input value="/frame/channel,/channel/v_left.do,/channel/v_tree.do,/channel/v_list.do" name="perms" type="checkbox">栏目</label>
	<div class="perm-layout-2">
	<label><input value="/channel/v_add.do,/channel/o_save.do,/fck/upload.do,/common/v_image_area_select.do,/common/o_image_cut.do,/common/o_upload_image.do" name="perms" type="checkbox">添加</label>
	<label><input value="/channel/v_edit.do,/channel/o_update.do,/channel/o_priority.do,/fck/upload.do,/common/v_image_area_select.do,/common/o_image_cut.do,/common/o_upload_image.do" name="perms" type="checkbox">修改</label>
	<label><input value="/channel/o_delete.do" name="perms" type="checkbox">删除</label>	
	</div>
</div>

<div class="perm-layout-1">
<label><input value="/frame/content,/content/v_left.do,/content/v_tree.do,/content/v_list.do,/content/v_view.do" name="perms" type="checkbox">内容</label>
	<div class="perm-layout-2">
	<label><input value="/content/v_add.do,/content/o_save.do,/content/v_tree_channels.do,/content/o_upload_attachment.do,/content/o_upload_media.do,/fck/upload.do,/common/v_image_area_select.do,/common/o_image_cut.do,/common/o_upload_image.do" name="perms" type="checkbox">添加</label>
	<label><input value="/content/v_edit.do,/content/o_update.do,/content/v_tree_channels.do,/content/o_upload_attachment.do,/content/o_upload_media.do,/fck/upload.do,/common/v_image_area_select.do,/common/o_image_cut.do,/common/o_upload_image.do" name="perms" type="checkbox">修改</label>
	<label><input value="/content/o_delete.do" name="perms" type="checkbox">删除</label>
	<label><input value="/content/o_check.do,/content/o_reject.do" name="perms" type="checkbox">审核</label>
	</div>
</div>

<div class="perm-layout-1">
<label><input value="/frame/template,/template/v_left.do,/template/v_tree.do,/template/v_list.do" name="perms" type="checkbox">模板</label>
	<div class="perm-layout-2">
	<label><input value="/template/v_add.do,/template/o_save.do,/template/o_swfupload.do,/template/o_create_dir.do" name="perms" type="checkbox">添加</label>
	<label><input value="/template/v_edit.do,/template/o_update.do,/template/v_rename.do,/template/o_rename.do" name="perms" type="checkbox">修改</label>
	<label><input value="/template/o_delete.do,/template/o_delete_single.do" name="perms" type="checkbox">删除</label>
	<label><input value="/template/v_setting.do,/template/o_def_template.do,/template/o_export.do,/template/o_import.do" name="perms" type="checkbox">设置</label>
	</div>
</div>

<div class="perm-layout-1">
<label><input name="perms" value="/frame/resource,/resource/v_left.do,/resource/v_tree.do,/resource/v_list.do" type="checkbox">资源</label>
	<div class="perm-layout-2">
	<label><input value="/resource/v_add.do,/resource/o_save.do,/resource/o_create_dir.do,/resource/v_upload.do,/resource/o_upload.do,/resource/o_swfupload.do" name="perms" type="checkbox">添加</label>
	<label><input value="/resource/v_edit.do,/resource/o_update.do,/resource/v_rename.do,/resource/o_rename.do" name="perms" type="checkbox">修改</label>
	<label><input value="/resource/o_delete.do,/resource/o_delete_single.do" name="perms" type="checkbox">删除</label>
	</div>
</div>

<div class="perm-layout-1">
<label><input value="/frame/assistant" name="perms" type="checkbox">辅助</label>
<div>
	<div class="perm-layout-2">
	<label><input value="/comment/" name="perms" type="checkbox">评论管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/guestbook/" name="perms" type="checkbox">留言管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/guestbook_ctg/" name="perms" type="checkbox">留言类别</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/vote_topic/" name="perms" type="checkbox">投票管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/advertising/" name="perms" type="checkbox">广告管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/advertising_space/" name="perms" type="checkbox">广告版位</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/friendlink/" name="perms" type="checkbox">友情链接管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/friendlink_ctg/" name="perms" type="checkbox">友情链接类别</label>
	</div>
</div>
</div>

<div class="perm-layout-1">
<label><input value="/frame/maintain" name="perms" type="checkbox">维护</label>
<div>
	<div class="perm-layout-2">
	<label><input value="/topic/,/common/v_image_area_select.do,/common/o_image_cut.do,/common/o_upload_image.do" name="perms" type="checkbox">专题管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/tag/" name="perms" type="checkbox">TAG管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/keyword/" name="perms" type="checkbox">关键词管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/sensitivity/" name="perms" type="checkbox">敏感词管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/content_cycle/" name="perms" type="checkbox">内容回收站</label>
	</div>
</div>
</div>

<div class="perm-layout-1">
<label><input value="/frame/generate" name="perms" type="checkbox">生成</label>
<div>
	<div class="perm-layout-2">
	<label><input value="/static/" name="perms" type="checkbox">页面静态化</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/lucene/" name="perms" type="checkbox">全文检索</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/acquisition/" name="perms" type="checkbox">采集管理</label>
	</div>
</div>
</div>

<div class="perm-layout-1">
<label><input value="/frame/user" name="perms" type="checkbox">用户</label>
<div>
	<div class="perm-layout-2">
	<label><input value="/member/" name="perms" type="checkbox">会员管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/group/" name="perms" type="checkbox">会员组管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/admin_global/" name="perms" type="checkbox">管理员(全站)</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/admin_local/" name="perms" type="checkbox">管理员(本站)</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/role/" name="perms" type="checkbox">角色管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/log/" name="perms" type="checkbox">日志管理</label>
	</div>
</div>
</div>

<div class="perm-layout-1">
<label><input value="/frame/config" name="perms" type="checkbox">配置</label>
<div>
	<div class="perm-layout-2">
	<label><input value="/config/" name="perms" type="checkbox">全局设置</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/site_config/" name="perms" type="checkbox">站点设置</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/model/,/item/" name="perms" type="checkbox">模型管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/type/" name="perms" type="checkbox">内容类型</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/ftp/" name="perms" type="checkbox">FTP管理</label>
	</div>
	<div class="perm-layout-2">
	<label><input value="/site/" name="perms" type="checkbox">站点管理</label>
	</div>
</div>
</div>

</div>
<script type="text/javascript">
$(function() {
	$(".perm-container input[type=checkbox]").bind("click",function() {
		parentCheck(this);
		childCheck(this);
	});
});
function parentCheck(chk) {
	var obj = $(chk).parent().parent().parent();
	while(obj && obj.attr("class").indexOf("perm-container")==-1) {
		if(chk.checked) {
			$(obj.children()[0]).children().attr("checked",true);
		}
		obj = obj.parent();
	}
}
function childCheck(chk) {
	$(chk).parent().next().children().find("input[type=checkbox]").each(function(){this.checked=chk.checked});
}
 /**
    js 字符串 contains 方法
 	string:原始字符串 *substr:子字符串  *isIgnoreCase:忽略大小写  
 **/ 
function contains(string,substr,isIgnoreCase) { 
		if(isIgnoreCase) {  
			string=string.toLowerCase();
			substr=substr.toLowerCase();
	    }
	    var startChar=substr.substring(0,1);
	    var strLen=substr.length;
	    for(var j=0;j<string.length-strLen+1;j++) {  
		    //如果匹配起始字符,开始查找
		    if(string.charAt(j)==startChar)  { 
			    if(string.substring(j,j+strLen)==substr){  return true; }    
			} 
		}  
		return false;
}


function doPermsCheck(roleId){
	if(roleId==null||roleId==""){
		return;
	}
	var checkboxPerms= $("input[type=checkbox]");
	$.ajax({
		async:"false",
		type:"GET",
		url:"<%=basePath%>admin/core/member/role/o_perm.do?roleId="+roleId+"",
		dataType:"json",
		success:function(data){
			for(var i=0;i<checkboxPerms.length;i++){
				for(var j=0;j<data.length;j++){
					if(contains(checkboxPerms[i].value,data[j],false)){
						checkboxPerms[i].checked="true";
					}
				}
			}
		},
		error:function(msg){
			alert("ERROR:"+msg);
		},
	});

}  
doPermsCheck(${role.roleId});
</script>
<c:if test="${role.isSuper==1}">
	<script type="text/javascript">
		disablePerms();
	</script>
</c:if>
</td></tr>
<tr><td colspan="4" class="pn-fbutton">
<input type="hidden" name="roleId" value="${role.roleId}"/>
<input value="提交" type="submit"> &nbsp; <input value="重置" type="reset"></td>
</tr></tbody></table>

</form>
</div>

</body></html>