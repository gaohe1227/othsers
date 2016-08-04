<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglib.jsp"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>登录用户管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>

<body>
	<div data-options="region:'center',border:false" style="height: 100%">
		<table id="userGrid" data-options="fit:true"></table>
	</div>
	<div id="usertoolbar" style="display: none;">
		<table>
			<tr>
				<sj:privilege privilege="/sys/loginUserAction!save">
					<td><a href="" class="easyui-linkbutton"
						data-options="iconCls:'icon-add',plain:true"
						onclick="addLoginUserFun()">添加</a></td>
				</sj:privilege>
				<sj:privilege privilege="/sys/loginUserAction!update">
					<td><a href="" class="easyui-linkbutton"
						data-options="iconCls:'icon-edit',plain:true"
						onclick="editLoginUserFun()">修改</a></td>
				</sj:privilege>
				<sj:privilege privilege="/sys/loginUserAction!deleteAll">
					<td><a href="" class="easyui-linkbutton"
						data-options="iconCls:'icon-remove',plain:true"
						onclick="deleteLoginUsers()">删除</a></td>
				</sj:privilege>
				<sj:privilege privilege="/sys/loginUserAction!resetPassword">
					<td><a href="" class="easyui-linkbutton"
						data-options="iconCls:'icon-lock',plain:true"
						onclick="resetPassword()">重置密码</a></td>
				</sj:privilege>
				<sj:privilege privilege="/sys/menuAction!userGrant">
					<td><a href="" class="easyui-linkbutton"
						data-options="iconCls:'icon-setup',plain:true" onclick="grant()">授权</a></td>
				</sj:privilege>
				<td><div class="datagrid-btn-separator"></div></td>
				<td>登录名:</td>
				<td><input name="QUERY_t#loginName_S_LK" type="text"
					style="width: 130px;" /></td>
				<td><a href="" class="easyui-linkbutton"
					data-options="iconCls:'icon-search',plain:true"
					onclick="loginUserSearchFun()">查询</a></td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		var userGrid;
		var userWindow;
		$(function() {
			userGrid = $('#userGrid').datagrid({
				url : easyui.contextPath + '/sys/loginUserAction!grid.do',
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
					title : '登录用户ID',
					field : 'id',
					width : '150'
				}, {
					title : '登录名',
					field : 'loginName',
					width : '130',
					sortable : true
				}, {
					title : '是否锁定',
					field : 'isLock',
					width : '200',
					formatter : function(value, row, index) {
						return value ? "锁定" : "正常";
					}
				}, {
					title : '用户类型',
					field : 'type',
					width : '200',
					formatter : function(value, row, index) {
						return value == 0 ? "超级管理员" : "普通用户";
					}
				}, {
					title : '描述',
					field : 'description',
					width : '150'
				}, {
					title : '创建时间',
					field : 'createTime',
					width : '150',
					sortable : true
				} ] ],
				toolbar : '#usertoolbar'
			});
		});
		function loginUserSearchFun() {
			var search = {};
			$("#usertoolbar").find("input").each(
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
			userGrid.datagrid("reload", search);
		}
		//添加登录用户
		function addLoginUserFun() {
			//alert("abc..");
			userWindow = easyui.window({
				title : "添加登录用户信息",
				href : easyui.contextPath + "/jsp/sys/loginuserForm.jsp"
			});
			userWindow.window('open');
		}
		function editLoginUserFun() {
			var row = userGrid.datagrid('getSelected');
			if (row) {
				userWindow = easyui.window({
					title : '修改登录用户信息',
					href : easyui.contextPath
							+ '/jsp/sys/loginuserForm.jsp?id=' + row.id
				});
				userWindow.window('open');
			} else {
				easyui.show("请选择您要修改的信息!");
			}
		}
		// 删除用户信息
		function deleteLoginUsers() {
			$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
				if(r){
					var rows = userGrid.datagrid("getSelections");
					if (rows.length > 0) {
						var ids = "";
						for (var i = 0; i < rows.length; i++) {
							if ("" != ids) {
								ids += ",";
							}
							ids += rows[i].id;
						}
						//Ajax访问服务器
						$.getJSON(easyui.contextPath
								+ "/sys/loginUserAction!deleteAll.do?ids=" + ids,
								function(rs) {
									if (rs.success) {
										userGrid.datagrid('reload');
									}
									easyui.show(rs.msg);
								});
					} else {
						easyui.show("请选择您要删除的用户信息!");
					}
				}
			});
		}
		//重置用户密码
		function resetPassword() {
			var row = userGrid.datagrid('getSelected');
			if (row) {
				//Ajax访问服务器
				$.getJSON(easyui.contextPath
						+ "/sys/loginUserAction!resetPassword.do?id=" + row.id,
						function(rs) {
							easyui.show(rs.msg);
						});
			} else {
				easyui.show("请选择您要重置的用户信息!");
			}
		}
		//用户授权
		function grant() {
			var row = userGrid.datagrid('getSelected');
			//alert(row.id);
			if (row) {
				userWindow = easyui.window({
					title : "用户授权",
					href : easyui.contextPath + "/jsp/sys/privilege.jsp?id="
							+ row.id
				});
				userWindow.window('open');
			} else {
				easyui.show("请选择您要授权的用户信息!");
			}
		}
	</script>
</body>
</html>
