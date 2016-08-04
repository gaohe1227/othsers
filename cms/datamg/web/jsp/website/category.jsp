<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/taglib.jsp"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>分类管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>

<body>
	<div id="cattoolbar" style="display:none;">
			<table>
				<tr>
					<sj:privilege privilege="/ws/categoryAction!save"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addCategoryFun()">添加</a></td></sj:privilege>
					<sj:privilege privilege="/ws/categoryAction!update"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editCategoryFun()">修改</a></td></sj:privilege>
					<sj:privilege privilege="/ws/categoryAction!delete"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteCategorys()">删除</a></td></sj:privilege>
					<td><div class="datagrid-btn-separator"></div></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true" onclick="easyui.treeGridRedoFun($('#catTreeGrid'))">折叠</a></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="easyui.treeGridUndoFun($('#catTreeGrid'))">展开</a></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="reloadCategoryFun($('#catTreeGrid'))">刷新</a></td>
				</tr>
			</table>
	</div>
	<div id="catWindow"></div>
	<div data-options="region:'center',fit:true,border:false" style="height: 100%">
		<table id="catTreeGrid" data-options="fit:true" ></table>
	</div>
	<script type="text/javascript">
		var catGrid;
		var catWin;
		$(function() {
			catGrid = $('#catTreeGrid').treegrid({
				url : easyui.contextPath+'/ws/categoryAction!treeGrid.do',
				idField : 'id',
				treeField : 'name',
				rownumbers : true,
				pagination : false,
				onLoadError:onLoadError,
				columns : [ [ {
					title : '分类名称',
					field : 'name',
					width : 180
				}, {
					title : '分类描述',
					field : 'description',
					width : 180
				}, {
					title : '创建时间',
					field : 'createTime',
					width : '150'
				} ] ],
				toolbar : '#cattoolbar'
			});
		});
		//刷新
		function reloadCategoryFun(treeGrid){
			treeGrid.treegrid('reload');
		}
		//添加
		function addCategoryFun(){
			//对话框加载
			catWin = easyui.window({
				title:'添加分类信息',
				href: easyui.contextPath+'/jsp/website/categroyForm.jsp'
			});
			catWin.window('open');
		}
		//修改
		function editCategoryFun(){
			var node = catGrid.treegrid('getSelected');
			if(node){
				//对话框加载
				catWin = easyui.window({
					title:'修改分类信息',
					href: easyui.contextPath+'/jsp/website/categroyForm.jsp?id='+node.id
				});
				catWin.window('open');
			}else{
				easyui.show('请选择您要修改的信息!');
			}
		}
		//删除
		function deleteCategorys(){
			$.messager.confirm("删除确认","您确认删除该记录?",function(r){
				if(r){
					var node = catGrid.treegrid('getSelected');
					if(node){
						 //Ajax访问服务器
						$.getJSON(easyui.contextPath+"/ws/categoryAction!delete.do?id="+node.id,function(rs){
								if(rs.success){
									easyui.show(rs.msg);
									catGrid.treegrid('reload');
								}
							}); 
					}else{
						easyui.show('请选择您要删除的信息!');
					}
				}
			});
		}
	</script>
</body>
</html>
