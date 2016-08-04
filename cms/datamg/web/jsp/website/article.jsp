<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/taglib.jsp"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>文章管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>

<body>
	<div data-options="region:'center',fit:true,border:false" style="height: 100%">
		<table id="articleGrid" data-options="fit:true" ></table>
	</div>
	<div id="articletoolbar" style="display: none;">
		<table>
			<tr>
				<sj:privilege privilege="/ws/articleAction!save"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="genArticleHtml()">生成网页</a></td></sj:privilege>
				<sj:privilege privilege="/ws/articleAction!save"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addArticleFun()">添加</a></td></sj:privilege>
				<sj:privilege privilege="/ws/articleAction!update"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editArticleFun()">修改</a></td></sj:privilege>
				<sj:privilege privilege="/ws/articleAction!deleteAll"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteArticleFun()">删除</a></td></sj:privilege>
				<td><div class="datagrid-btn-separator"></div></td>
				<td>文章类型:</td>
				<td><input type="text" name="QUERY_t#category.id_S_EQ" style="width: 160px;" id="parentCategory" class="easyui-combotree" data-options="url:'<%=contextPath %>/ws/categoryAction!doNotSecurityComboTree.do',method:'get',animate:true,lines:true">
			    	<a href="" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#parentCategory').combotree('clear');"></a></td>
				<td>文章标题:</td>
				<td><input name="QUERY_t#title_S_LK" type="text" style="width: 130px;" /></td>
				<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="articleSearchFun()">查询</a></td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		var articleGrid;
		var articleWindow;
		$(function() {
			articleGrid = $('#articleGrid').datagrid({
				url : easyui.contextPath+'/ws/articleAction!grid.do',
				rownumbers : true,
				pagination : true,
				singleSelect : false,
				sortName : 'createTime',
				sortOrder : 'desc',
				pageSize : 20,
				pageList : [ 10, 20, 30, 50, 100 ],
				frozenColumns : [ [ {
					field : 'ck',
					checkbox : true
				} ] ],
				columns : [ [ {
					title : '文章标题',
					field : 'title',
					width : '150',
					sortable : true
				}, {
					title : '作者',
					field : 'author',
					width : '130',
					sortable : true
				}, {
					title : '类型',
					field : 'type',
					width : '80',
					formatter : function(value, row, index) {
						return value == 0 ? "原创" : "转载";
					}
				}, {
					title : '评论数',
					field : 'reviewNum',
					width : '80',
					sortable : true
				}, {
					title : '浏览数',
					field : 'browseNum',
					width : '80',
					sortable : true
				}, {
					title : '内容',
					field : 'content',
					width : '200',
					hidden:true
				}, {
					title : '创建时间',
					field : 'createTime',
					width : '150',
					sortable : true
				} ] ],
				toolbar : '#articletoolbar'
			});
		});
		//搜索
		function articleSearchFun() {
			var search = {};
			$("#articletoolbar").find("input").each(
					function() {
						if (this['value'] != undefined
								&& this['value'].length > 0) {// 如果值非空，才封装对象
							if (search[this['name']]) {
								search[this['name']] = search[this['name']]
										+ "," + this['value'];
							} else {
								search[this['name']] = this['value'];
							}
						}
					});
			articleGrid.datagrid("reload", search);
		}
		
		//生成网页（内容页）
		function genArticleHtml(){
			//对话框加载
			articleWindow = easyui.window({
				title:'生成网页（内容页）',
				width:1000,
				height:600,
				href: easyui.contextPath+'/jsp/website/genArticle.jsp'
			});
			articleWindow.window('open');
		}
		
		//添加文章
		function addArticleFun(){
			//对话框加载
			articleWindow = easyui.window({
				title:'添加文章信息',
				width:1000,
				height:600,
				href: easyui.contextPath+'/jsp/website/articleForm.jsp'
			});
			
			articleWindow.window('open');
		}
		//修改文章
		function editArticleFun(){
			var row = articleGrid.datagrid('getSelected');
			if(row){
				articleWindow = easyui.window({
					title:'添加文章信息',
					width:1000,
					height:600,
					href: easyui.contextPath+'/jsp/website/articleForm.jsp?id='+row.id
				});
				articleWindow.window('open');
			}else{
				easyui.show("请选择您要修改的信息!");
			}
		}
		//删除文章记录
		function deleteArticleFun(){
			$.messager.confirm("删除确认","您确认删除该记录?",function(r){
				if(r){
					var rows = articleGrid.datagrid("getSelections");
					if(rows.length>0){
						var ids="";
						for(var i=0;i<rows.length;i++){
							if(""!=ids){
								ids+=",";
							}
							ids+=rows[i].id;
						}
						 //Ajax访问服务器
						$.getJSON(easyui.contextPath+"/ws/articleAction!deleteAll.do?ids="+ids,function(rs){
								if(rs.success){
									articleGrid.datagrid('reload');
								}
								easyui.show(rs.msg);
						});
					}else{
						easyui.show("请选择您要删除的文章信息!");
					}
				}
			});
		}
	</script>
</body>
</html>
