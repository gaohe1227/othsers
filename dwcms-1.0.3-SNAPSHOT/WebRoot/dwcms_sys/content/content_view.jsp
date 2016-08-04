<%@ include file="/res/common/jsp/jsp_defined.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
		<link href="<%=basePath%>res/dwcms/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>res/dwcms/css/theme.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/thirdparty/jquery-easyui/themes/icon.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/thirdparty/jquery-easyui/themes/dark-hive/easyui.css" id="swicth-style">
		<script type="text/javascript" src="<%=basePath%>/thirdparty/jquery-easyui/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/thirdparty/jquery-easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/res/common/js/pony.js"></script>
		<script type="text/javascript" src="<%=basePath%>/res/common/js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>/res/common/js/jquery.ext.js"></script>
<script type="text/javascript">
$(function() {
	$("#rejectDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 380,
		height: 200,
		position: ["center",50],
		buttons: {
			"OK": function() {
				rejectSubmit();
			}
		}
	});
});
function rejectSubmit() {
	$("input[name=rejectOpinion]").val($("#rejectOpinion").val());
	$("input[name=rejectStep]").val($("#rejectStep").val());
	$("#rejectDialog").dialog("close");
	var f = $("#jvForm")[0];
	f.action="o_reject.do";
	f.submit();
}
</script>
<style type="text/css">
h1{text-align:center;font-size:18px;}
.info{text-align:center;}
</style>
</head>
<body>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置:  内容管理 - 查看</div>
	<form class="ropt">
		<input type="submit" value="返回列表" onclick="this.form.action='v_list.do';"/>
		<input type="hidden" name="pageNo" value="${param.pageNo }"/>
		<input type="hidden" name="contentId" value=""/>
<input type="hidden" name="queryOrderBy" value="0"/><input type="hidden" name="queryStatus" value="${param.queryStatus }"/><input type="hidden" name="queryTopLevel" value="${param.queryTopLevel }"/><input type="hidden" name="queryRecommend" value="${param.queryRecommend }"/>	</form>
	<div class="clear"></div>
</div>
<form id="jvForm" method="post" style="padding-top:5px">
<input type="hidden" name="contentId" value="${contentDto.contentId }"/>
<input type="hidden" name="ids" value="${contentDto.contentId }"/>
	<input type="hidden" name="pageNo" value=""/>
	<input type="hidden" name="cid" value=""/>
<input type="hidden" name="queryOrderBy" value="0"/><input type="hidden" name="queryStatus" value=""/><input type="hidden" name="queryTopLevel" value="false"/><input type="hidden" name="queryRecommend" value="false"/>	<input type="hidden" name="rejectStep"/>
	<input type="hidden" name="rejectOpinion"/>
	<input type="submit" value="审核" onclick="this.form.action='o_check.do'"/>
	<input type="button" value="退回" onclick="$('#rejectDialog').dialog('open');"/>
	<input type="submit" value="修改" onclick="this.form.action='v_edit.do'"/>
	<input type="button" value="前台预览" onclick="$('#viewInFront').submit();"/>
</form>
<form id="viewInFront" action="/jcms/star/170.jhtml" target="_blank" method="get"></form>
<div id="rejectDialog" style="display:none" title="退回原因">
<p>退回原因: <input type="text" id="rejectOpinion" style="width:260px" onkeypress="if(event.keyCode==13){rejectSubmit();return false;}"/></p>
<p>退回级数:
	<select id="rejectStep">
		<option value="">上一级</option>
		<option value="1">1</option><option value="0">0</option>
	</select>
</p>
</div>
<div style="border:1px solid #ccc;">

	<h1>${contentDto.title }</h1>
	<p class="info">
		发布者: ${contentDto.author}
		
		
		&nbsp; 点击: ${contentDto.views}
		&nbsp; 发布时间: <fmt:formatDate value="${contentDto.releaseDate}" type="both"/> 		
	</p>
	<div>
	${contentDto.txt}
	</div>
</div>
</div>
</body>
</html>