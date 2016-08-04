<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglib.jsp" %>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>角色管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
</head>

	<body>
		<div id="roletoolbar" style="display:none">
			<table>
				<tr>
					<sj:privilege privilege="/sys/roleAction!save"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addRoleFun()">添加</a></td></sj:privilege>
					<sj:privilege privilege="/sys/roleAction!update"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editRoleFun()">修改</a></td></sj:privilege>
					<sj:privilege privilege="/sys/roleAction!delete"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteRoleFun()">删除</a></td></sj:privilege>
					<td><div class="datagrid-btn-separator"></div></td>
					<sj:privilege privilege="/sys/roleAction!setRoleMenus"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-setup',plain:true" onclick="setRoleMenu()">设置角色菜单</a></td></sj:privilege>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',fit:true,border:false" style="height: 100%">
			<table id="grid" data-options="fit:true" ></table>
		</div>
		<script type="text/javascript">
		function addRoleFun(){
			//对话框加载
	    	roleWindow = easyui.window({
					title:'添加角色信息',
					href:easyui.contextPath+'/jsp/sys/roleForm.jsp'
				});
			roleWindow.window('open');
		}
		function editRoleFun(){
			var node = roleGrid.datagrid('getSelected');
			if(node){
				//对话框加载
				roleWindow = easyui.window({
					title:'修改角色信息',
					href:easyui.contextPath+'/jsp/sys/roleForm.jsp?id='+node.id
				});
				roleWindow.window('open');
			}else{
				easyui.show('请选择您要修改的信息!');
			}
		}
		function deleteRoleFun(){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			    	var node = roleGrid.datagrid('getSelected');
					if(node){
						 //Ajax访问服务器
						$.getJSON(easyui.contextPath+"/sys/roleAction!delete.do?id="+node.id,function(rs){
								if(rs.success){
									roleGrid.datagrid('reload');
								}
								easyui.show(rs.msg);
							}); 
					}else{
						easyui.show('请选择您要删除的信息!');
					}
			    }   
			});  
		}
		function setRoleMenu(){
			var node = roleGrid.datagrid('getSelected');
			if(node){
				//对话框加载
				roleWindow = easyui.window({
						title:'设置角色菜单',
						href:easyui.contextPath+'/jsp/sys/roleMenus.jsp?id='+node.id
					});
				roleWindow.window('open');
			}else{
				easyui.show('请选择您要设置的角色信息!');
			}
		}
		var roleGrid;
		var roleWindow;
		$(function(){
			roleGrid = $('#grid').datagrid({    
			    url:easyui.contextPath+'/sys/roleAction!grid.do', 
				rownumbers : true,
				pagination : true,
				singleSelect:true,
				sortName:'name',
				sortOrder:'asc',
			    columns:[[{title:'角色ID',field:'id',width:'150'},
			    	{title:'角色名称',
				     field:'name',
				     width:'130',
				     sortable:true
				    },{title:'角色描述',
					   field:'description',
					   width:'200'
					}
			    ]],
			    toolbar: '#roletoolbar'
			});
		});
		</script>
	</body>
</html>
