<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglib.jsp" %>
<%
String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>菜单管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
</head>

	<body>
		<div id="menutoolbar" style="display:none">
			<table>
				<tr>
					<sj:privilege privilege="/sys/menuAction!save"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addMenuFun()">添加</a></td></sj:privilege>
					<sj:privilege privilege="/sys/menuAction!update"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editMenuFun()">修改</a></td></sj:privilege>
					<sj:privilege privilege="/sys/menuAction!delete"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteMenuFun()">删除</a></td></sj:privilege>
					<td><div class="datagrid-btn-separator"></div></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true" onclick="easyui.treeGridRedoFun($('#menuTreeGrid'))">折叠</a></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="easyui.treeGridUndoFun($('#menuTreeGrid'))">展开</a></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="$('#menuTreeGrid').treegrid('reload');">刷新</a></td>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',border:false" style="height: 100%">
			<table id="menuTreeGrid" data-options="fit:true"></table>
		</div>
		<script type="text/javascript">
		function addMenuFun(){
			//对话框加载
			w = easyui.window({
				title:'添加菜单或功能信息',
				href:easyui.contextPath+'/jsp/sys/menuForm.jsp'
			});
			w.window('open');
		}
		function editMenuFun(){
			var node = grid.treegrid('getSelected');
			if(node){
				//对话框加载
				w = easyui.window({
					title:'修改菜单或功能信息',
					href:easyui.contextPath+'/jsp/sys/menuForm.jsp?id='+node.id
				});
				w.window('open');
			}else{
				easyui.show('请选择您要修改的信息!');
			}			
		}
		function deleteMenuFun(){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			    	var node = grid.treegrid('getSelected');
					if(node){
						 //Ajax访问服务器
						$.getJSON(easyui.contextPath+"/sys/menuAction!delete.do?id="+node.id,function(rs){
								if(rs.success){
									grid.treegrid('reload');
								}
								easyui.show(rs.msg);
							}); 
					}else{
						easyui.show("请选择您要删除的信息!");
					}
			    }    
			});
		}
		var grid;
		var w;
		$(function(){
			grid = $('#menuTreeGrid').treegrid({    
			    url:easyui.contextPath+'/sys/menuAction!treeGrid.do',    
			    idField:'id',
			    treeField:'name',
				rownumbers : true,
				pagination : false,
			    columns:[[
			    	{title:'菜单名称',
				     field:'name',
				     width:200
				    },{title:'连接地址',
				    	align:'left',
					   field:'href',
					   width:230,
					   formatter:function(value,row,index){
						   return easyui.divTooltip(value,50);
					   }
					},
					{
						title:'导航菜单',
						align:'center',
						field:'isleaf',
						widht:'80',
						formatter:function(value,row,index){
							return value?"是":"否";
					 	}
					},
			        {title:'类型',
				     field:'type',
				     align:'center',
				     width:90,
				     formatter:function(value,row,index){
								return value==1?"菜单":"功能";
						 }
				    },{
				    	title:"URL跳转类型",
				    	field:'skipType',
				    	align:'center',
				    	width:100,
				    	formatter:function(value,row,index){
				    		if(row.type==1&&row.isleaf){
				    			return value;
				    		}else{
				    			return "无";
				    		}
					 	}
				    },
				    {title:'序号',
					 field:'sort',
					 align:'center',
					 width:'100'
					},{
						title:'描述',
						field:'description',
						widht:200,
						formatter:function(value,row,index){
							   return easyui.divTooltip(value);
						   }
					}
			    ]],
			    toolbar: '#menutoolbar'
			});
		});
		</script>
	</body>
</html>
