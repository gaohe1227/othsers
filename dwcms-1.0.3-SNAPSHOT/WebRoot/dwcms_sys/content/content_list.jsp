<%@ include file="/res/common/jsp/jsp_defined.jsp" %>
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
function getTableForm() {
	return document.getElementById('tableForm');
}
function optDelete() {
	if(Pn.checkedCount('ids')<=0) {
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
function optCheck() {
	if(Pn.checkedCount('ids')<=0) {
		alert("请选择您要操作的数据");
		return;
	}
	var f = getTableForm();
	f.action="o_check.do";
	f.submit();
}
function optReject() {
	if(Pn.checkedCount('ids')<=0) {
		alert("请选择您要操作的数据");
		return;
	}
	$("#rejectDialog").dialog("open");
}
function rejectSubmit() {
	$("input[name=rejectOpinion]").val($("#rejectOpinion").val());
	$("input[name=rejectStep]").val($("#rejectStep").val());
	$("#rejectDialog").dialog("close");
	var f = getTableForm();
	f.action="o_reject.do";
	f.submit();
}
function chgStatus() {
	var queryStatus = $("input[name=queryStatus]:checked").val();
	location.href="v_list.do?channelId=${channelId}&queryTitle=${queryTitle}&queryInputUsername=${queryInputUsername}&queryTopLevel=${queryTopLevel}&queryRecommend=${queryRecommend}&queryTypeId=${queryTypeId}&queryStatus=" + queryStatus;
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
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 内容管理 - 列表</div>
	<form class="ropt">
		<input value="添加" onclick="this.form.action='v_add.do';" type="submit">
		<input name="channelId" value="${param.channelId }" type="hidden">
	</form>
	<div class="clear"></div>
</div>
<form action="v_list.do" method="post" style="padding-top:5px;">
<div>
标题: <input name="queryTitle" style="width: 100px;" value="${queryTitle}" type="text">
发布者: <input name="queryInputUsername" value="${queryInputUsername}" style="width: 70px;" type="text">
<label><input name="queryTopLevel" <c:if test="${queryTopLevel!=null}"> checked="checked"</c:if> value="true" type="checkbox">固顶</label>
<label><input name="queryRecommend" <c:if test="${queryRecommend!=null}"> checked="checked"</c:if> value="true" type="checkbox">推荐</label>
<select name="queryTypeId" id="queryTypeId"><option value="" selected="selected">--所有类型--</option><option value="1">普通</option><option value="2">图文</option><option value="3">焦点</option><option value="4">头条</option></select>
		<script type="text/javascript">
			setOptSelected('queryTypeId',${queryTypeId});
		</script>
<input name="cid" value="" type="hidden">
<input value="查询" type="submit">
</div>
<div style="padding-top:5px">
<label><input name="queryStatus" value="all" onclick="chgStatus();" type="radio" <c:if test="${queryStatus=='all' }">checked="checked" </c:if> >所有内容</label>
<label><input name="queryStatus" value="draft" onclick="chgStatus();" type="radio" <c:if test="${queryStatus=='draft' }">checked="checked" </c:if> >草稿</label>
<label><input name="queryStatus" value="prepared" onclick="chgStatus();" type="radio" <c:if test="${queryStatus=='prepared' }">checked="checked" </c:if> >待审</label>
<label><input name="queryStatus" value="passed" onclick="chgStatus();" type="radio" <c:if test="${queryStatus=='passed' }">checked="checked" </c:if> >已审</label>
<label><input name="queryStatus" value="checked" onclick="chgStatus();" type="radio" <c:if test="${queryStatus=='checked' }">checked="checked" </c:if> >终审</label>
<label><input name="queryStatus" value="rejected" onclick="chgStatus();" type="radio" <c:if test="${queryStatus=='rejected' }">checked="checked" </c:if>>退回</label>
</div>
</form>
<form id="tableForm" method="post">
<input name="pageNo" value="" type="hidden">
<input name="cid" value="" type="hidden">
<input name="queryOrderBy" value="0" type="hidden"><input name="queryTopLevel" value="false" type="hidden"><input name="queryRecommend" value="false" type="hidden"><input name="rejectStep" type="hidden">
<input name="rejectOpinion" type="hidden">

<table class="pn-ltable" style="" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead"><tr>
	<th width="20"><input onclick='Pn.checkbox("ids",this.checked)' type="checkbox"></th>
	<th>ID</th>
	<th>标题</th>
	<th>类型</th>
	<th>发布者</th>
	<th>点击</th>
	<th>发布时间</th>
	<th>状态</th>
	<th>操作选项</th></tr></thead>
<tbody class="pn-ltbody">
<c:forEach items="${contentDtoList}" var="contentDto" begin="0">
<tr>
	<td><input name="ids" value="${contentDto.contentId}" type="checkbox"></td>
	<td>${contentDto.contentId}</td>
	<td>		
		<c:if test="${contentDto.isRecommend}">
		<span style="color:red">[推]</span>
		</c:if>
		<strong>[${contentDto.channelName}]</strong>
		<a href="${ctx}/v_article.vm?contentId=${contentDto.contentId}" target="_blank">${contentDto.title }</a>
</td>
	<td align="center">${contentDto.typeName}</td>
	<td align="center">${contentDto.author}</td>
	<td align="right">${contentDto.views}</td>
	<td align="center"><fmt:formatDate value="${contentDto.releaseDate}" type="both"/> </td>
	<td align="center">${contentDto.statusName}		
</td>
	<td align="center">		<a href="<%=basePath%>/admin/core/content/v_view.do?contentId=${contentDto.contentId}&queryTitle=${queryTitle}&queryInputUsername=${queryInputUsername}&queryTopLevel=${queryTopLevel}&queryRecommend=${queryRecommend}&queryTypeId=${queryTypeId}&queryStatus=${queryStatus}&pageNo=${page.currentPage}" class="pn-opt">查看</a> | 		<a href="<%=basePath%>/admin/core/content/v_edit.do?contentId=${contentDto.contentId}&amp;cid=&amp;pageNo=&amp;queryTitle=&amp;queryInputUsername=&amp;queryTopLevel=false&amp;queryRecommend=false&amp;queryTypeId=&amp;queryStatus=&amp;queryOrderBy=0" class="pn-opt">修改</a> | 		<a href="<%=basePath%>/admin/core/content/o_del.do?ids=${contentDto.contentId}&amp;cid=&amp;pageNo=&amp;queryTitle=&amp;queryInputUsername=&amp;queryTopLevel=false&amp;queryRecommend=false&amp;queryTypeId=&amp;queryStatus=&amp;queryOrderBy=0" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
		</td>
</tr>
</c:forEach>

</tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr><td class="pn-sp" align="center">
	${page.pageStr }
</td></tr></tbody></table>
<script type="text/javascript">
function _gotoPage(pageNo) {
	try{
		var tableForm = getTableForm();
		$("input[name=pageNo]").val(pageNo);
		tableForm.action="v_list.do?channelId=${channelId}&queryTitle=${queryTitle}&queryInputUsername=${queryInputUsername}&queryTopLevel=${queryTopLevel}&queryRecommend=${queryRecommend}&queryTypeId=${queryTypeId}&queryStatus=${queryStatus}";
		tableForm.onsubmit=null;
		tableForm.submit();
	} catch(e) {
		alert('_gotoPage(pageNo)方法出错');
	}
}
</script>
<div>
	<input value="删除" onclick="optDelete();" type="button">
	<input value="审核" onclick="optCheck();" type="button">
	<input id="rejectButton" value="退回" onclick="optReject();" type="button">
</div>
</form>
</div>


<div style="display: none; position: absolute; overflow: hidden; z-index: 1000; outline: 0px none;"><div style="-moz-user-select: none;" unselectable="on" class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span style="-moz-user-select: none;" unselectable="on" id="ui-dialog-title-rejectDialog" class="ui-dialog-title">退回原因</span><a style="-moz-user-select: none;" unselectable="on" role="button" class="ui-dialog-titlebar-close ui-corner-all" href="#"><span style="-moz-user-select: none;" unselectable="on" class="ui-icon ui-icon-closethick">close</span></a></div><div  id="rejectDialog" style="">
<p>退回原因: <input id="rejectOpinion" style="width: 260px;" onkeypress="if(event.keyCode==13){rejectSubmit();return false;}" type="text"></p>
<p>退回级数:
	<select id="rejectStep">
		<option selected="selected" value="">上一级</option>
		<option value="1">1</option><option value="0">0</option>
	</select>
</p>
</div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-n"></div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-e"></div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-s"></div><div style="-moz-user-select: none;" unselectable="on" class="ui-resizable-handle ui-resizable-w"></div><div unselectable="on" style="z-index: 1001; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div unselectable="on" style="z-index: 1002; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-sw"></div><div unselectable="on" style="z-index: 1003; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-ne"></div><div unselectable="on" style="z-index: 1004; -moz-user-select: none;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"><button class="ui-state-default ui-corner-all" type="button">OK</button></div></div></body></html>