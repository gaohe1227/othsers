<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglib.jsp" %>
<%
String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>机构管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
</head>

	<body>
		<div id="unittoolbar" style="display:none">
			<table>
				<tr>
					<sj:privilege privilege="/data/baseUnitAction!save"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addUnitFun()">添加</a></td></sj:privilege>
					<sj:privilege privilege="/data/baseUnitAction!update"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editUnitFun()">修改</a></td></sj:privilege>
					<sj:privilege privilege="/data/baseUnitAction!delete"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteUnitFun()">删除</a></td></sj:privilege>
					<td><div class="datagrid-btn-separator"></div></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true" onclick="easyui.treeGridRedoFun($('#unitTreeGrid'))">折叠</a></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="easyui.treeGridUndoFun($('#unitTreeGrid'))">展开</a></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="$('#unitTreeGrid').treegrid('reload');">刷新</a></td>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',fit:true,border:false" style="height: 100%">
			<table id="unitTreeGrid" data-options="fit:true"></table>
		</div>
		<script type="text/javascript">
		function addUnitFun(){
			//对话框加载
			unitWindow = easyui.window({
				title:'添加机构信息',
				href:easyui.contextPath+'/jsp/data/unitForm.jsp'
			});
			unitWindow.window('open');
		}
		function editUnitFun(){
			var node = unitGrid.treegrid('getSelected');
			if(node){
				//对话框加载
				unitWindow = easyui.window({
					title:'修改机构信息',
					href:easyui.contextPath+'/jsp/data/unitForm.jsp?id='+node.id
				});
				unitWindow.window('open');
			}else{
				easyui.show('请选择您要修改的信息!');
			}			
		}
		function deleteUnitFun(){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			    	var node = unitGrid.treegrid('getSelected');
					if(node){
						 //Ajax访问服务器
						$.getJSON(easyui.contextPath+"/data/baseUnitAction!delete.do?id="+node.id,function(rs){
								if(rs.success){
									unitGrid.treegrid('reload');
								}
								easyui.show(rs.msg);
							}); 
					}else{
						easyui.show("请选择您要删除的信息!");
					}
			    }    
			});
		}
		var unitGrid;
		var unitWindow;
		$(function(){
			unitGrid = $('#unitTreeGrid').treegrid({    
			    url:easyui.contextPath+'/data/baseUnitAction!treeGrid.do',
			    idField:'id',
			    treeField:'name',
				rownumbers : true,
				pagination : false,
			    columns:[[
			    	{title:'机构名称',
				     field:'name',
				     width:180
				    },{title:'机构编码',
					   field:'serialNumber',
					   width:180
					},
					{
						title:'是否是最后级单位',
						field:'isleaf',
						widht:'80',
						formatter:function(value,row,index){
							return value?"是":"否";
					 	}
					},{
						title:'描述',
						field:'description',
						widht:300
					}
			    ]],
			    toolbar: '#unittoolbar'
			});
		});
		</script>
	</body>
</html>
