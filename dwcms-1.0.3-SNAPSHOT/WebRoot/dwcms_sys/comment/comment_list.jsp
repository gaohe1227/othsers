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
<script type="text/javascript">
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
</script>
</head>
<body>
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;">
<iframe style="width: 186px; height: 199px;" src="" border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 评论管理 - 列表</div>
	<form class="ropt">
	</form>
	<div class="clear"></div>
</div>
<form id="tableForm" method="post">
<input name="pageNo" value="" type="hidden">
<table class="pn-ltable" style="" border="0" cellpadding="0" cellspacing="1" width="100%">
<thead class="pn-lthead"><tr>
	<th width="20"><input onclick='Pn.checkbox("ids",this.checked)' type="checkbox"></th>
	<th>ID</th>
	<th>评论</th>
	<th>文档</th>
	<th>会员</th>
	<th>操作选项</th></tr></thead>
    <tbody class="pn-ltbody">
    	<c:if test="${empty commentDtoList}">
    		<tr><td colspan="6" align="center">暂无任何评论</td></tr>
    	</c:if>
    	<c:if test="${!empty commentDtoList}">
    		<c:forEach items="${commentDtoList}" var="commentDto" begin="0">
			    <tr>
					<td><input name="ids" value="${commentDto.commentId}" type="checkbox"></td>
					<td>${commentDto.commentId}</td>
					<td>
					    <c:if test="${commentDto.isRecommend}">	
							[<span style="color:red">推荐</span>]
						</c:if>	
						<a href="http://localhost:8080/jcms/jeeadmin/jeecms/comment/v_list.do?contentId=167">${commentDto.text}</a>
						<br><span style="color:red"></span>
					</td>
					<td>		
						<a href="http://localhost:8080/jcms/star/167.jhtml" target="_blank" title="${commentDto.contentTitle}">${commentDto.contentTitle}</a>
					</td>	
						<td align="center">		${commentDto.commentUsername}<br>
							${commentDto.ip}<br><fmt:formatDate value="${commentDto.createTime}"  type="date" pattern="yyyy-MM-dd HH:mm:ss"/> 
					</td>
					<td align="center">		<a href="<%=basePath %>admin/assistant/comment/v_edit.do?id=${commentDto.commentId }&amp;pageNo=${page.currentPage}" class="pn-opt">修改</a> | <a href="<%=basePath %>admin/assistant/comment/o_del.do?ids=${commentDto.commentId }&amp;pageNo=${page.currentPage}" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a></td>
				</tr>
			</c:forEach>
		 </c:if>
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
		tableForm.action="v_list.do";
		tableForm.onsubmit=null;
		tableForm.submit();
	} catch(e) {
		alert('_gotoPage(pageNo)方法出错');
	}
}
</script>
<div><input value="删除" onclick="optDelete();" type="button"></div>
</form>
</div>

</body></html>