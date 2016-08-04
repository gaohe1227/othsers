<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.table {
	border-collapse: collapse;
	border-spacing: 0;
}

.table th,.table td {
	border: 1px solid #8CACBB;
	padding: 0.3em 0.7em;
	text-align: left;
}

.table th {
	background: #F8F8F8;
	text-align: center;
}

.table thead th {
	text-align: center;
}

.table tbody th {
	text-align: right;
}

.table tr:hover {
	background-color: #f6fafd;
}

.table td:hover {
	background-color: #f9feff;
}

.form th {
	text-align: right;
}

.form th,.form td {
	padding: 0.1em 0.3em;
	border: 1px solid #D1D7DC;
}

.form input,.form select,.form textarea {
	width: 150px;
}

.form input[type='checkbox'],.form input[type='radio'] {
	width: 20px;
}
img{
	cursor: pointer;
}
</style>
<!-- easyui1.3.6引入 -->
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/js/easyui/themes/icon.css">
<script type="text/javascript" src="<%=contextPath%>/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- kindeditor4.1.10 引入 -->
<link rel="stylesheet" href="<%=contextPath%>/js/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=contextPath%>/js/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" type="text/javascript" src="<%=contextPath%>/js/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" type="text/javascript" src="<%=contextPath%>/js/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" type="text/javascript" src="<%=contextPath%>/js/kindeditor/plugins/code/prettify.js"></script>
<!-- 上传组件 plupload-->
<script charset="utf-8" type="text/javascript" src="<%=contextPath%>/js/plupload-2.0.0/js/plupload.full.min.js"></script>
<script charset="utf-8" type="text/javascript" src="<%=contextPath%>/js/plupload-2.0.0/js/i18n/zh_CN.js"></script>
<!-- 公共JS -->
<script type="text/javascript" src="<%=contextPath%>/js/utils.js"></script>
<script type="text/javascript">
	//设置项目的contextPath
	easyui.contextPath = '<%=contextPath%>';
</script>
<!-- kindeditor -->
<script charset="utf-8" type="text/javascript" src="<%=contextPath%>/js/easyuikindeditor.js"></script>
