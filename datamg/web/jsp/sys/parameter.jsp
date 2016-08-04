<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglib.jsp" %>
<%
String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>参数管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
</head>

	<body>
		<div id="paramtoolbar" style="display:none">
			<table>
				<tr>
					<sj:privilege privilege="/sys/parameterAction!save"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addParamFun()">添加</a></td></sj:privilege>
					<sj:privilege privilege="/sys/parameterAction!update"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editParamFun()">修改</a></td></sj:privilege>
					<sj:privilege privilege="/sys/parameterAction!delete"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteParamFun()">删除</a></td></sj:privilege>
					<td><div class="datagrid-btn-separator"></div></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true" onclick="easyui.treeGridRedoFun($('#paramTreeGrid'))">折叠</a></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="easyui.treeGridUndoFun($('#paramTreeGrid'))">展开</a></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="$('#paramTreeGrid').treegrid('reload');">刷新</a></td>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',border:false" style="height: 100%">
			<table id="paramTreeGrid" data-options="fit:true"></table>
		</div>
		<script type="text/javascript">
		function addParamFun(){
			//对话框加载
			paramWin = easyui.window({
				title:'添加参数信息',
				href:easyui.contextPath+'/jsp/sys/parameterForm.jsp'
			});
			paramWin.window('open');
		}
		function editParamFun(){
			var node = paramGrid.treegrid('getSelected');
			if(node){
				//对话框加载
				paramWin = easyui.window({
					title:'修改参数信息',
					href:easyui.contextPath+'/jsp/sys/parameterForm.jsp?id='+node.id
				});
				paramWin.window('open');
			}else{
				easyui.show('请选择您要修改的信息!');
			}			
		}
		function deleteParamFun(){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			    	var node = paramGrid.treegrid('getSelected');
					if(node){
						 //Ajax访问服务器
						$.getJSON(easyui.contextPath+"/sys/parameterAction!delete.do?id="+node.id,function(rs){
								if(rs.success){
									paramGrid.treegrid('reload');
								}
								easyui.show(rs.msg);
							}); 
					}else{
						easyui.show("请选择您要删除的信息!");
					}
			    }    
			});
		}
		var paramGrid;
		var paramWin;
		$(function(){
			paramGrid = $('#paramTreeGrid').treegrid({    
			    url:easyui.contextPath+'/sys/parameterAction!treeGrid.do',    
			    idField:'id',
			    treeField:'name',
				rownumbers : true,
				pagination : false,
			    columns:[[
			    	{title:'参数名称',
				     field:'name',
				     width:180
				    },{title:'参数代码',
					   field:'code',
					   width:180
					},{
						title:'描述',
						field:'description',
						widht:200
					}
			    ]],
			    toolbar: '#paramtoolbar'
			});
		});
		</script>
	</body>
</html>
