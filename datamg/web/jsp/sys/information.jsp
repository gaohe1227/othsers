<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>用户查看个人信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>

	<body>
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="userForm" class="form" method="post" >
					<input type="hidden" name="data.createTime">
			    	<table class="table" width="100%">
			    		<tr>
			    			<th>登录名:</th>
			    			<td><input class="easyui-validatebox" style="width: 160px;" type="text" name="data.loginName" data-options="required:true,validType:'length[4,20]'"></input></td>
			    		</tr>
			    		<tr>
			    			<th>是否锁定:</th>
			    			<td>
			    				<input type="checkbox" name="data.isLock" value="true"><font color="red">注:勾选为锁定</font>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>用户类型:</th>
			    			<td>
			    				<select class="easyui-combobox" name="data.type">
			    					<option value="1" selected="selected">普通用户</option>
			    					<option value="0">超级管理员</option>
			    				</select>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>用户角色:</th>
			    			<td>
			    				<input class="easyui-combobox" id="roles" style="width: 200px;" name="data.roleIds" data-options="editable:false,required:true,multiple:true,valueField:'id',textField:'name',url:'<%=contextPath %>/sys/roleAction!doNotSecurityCombobox.do'" /> 	
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>登录描述:</th>
			    			<td>
			    				<textarea rows="4" style="width: 400px" name="data.description"></textarea>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>菜单权限:</th>
			    			<td>
			    				<ul id="infomationTree"></ul>
			    			</td>
			    		</tr>
			    	</table>
			    </form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="closeinformationWindow();" style="width:80px">取消</a>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				$.messager.progress({
					text : '数据加载中....'
				});
				$.getJSON(easyui.contextPath+"/sys/loginUserAction!doNotSecurityInfomation.do",function(rs){
						// alert(rs.id);
						if(undefined != rs.id){
							$('#userForm').form('load', {
								'data.id' : rs.id,
								'data.loginName' : rs.loginName,
								'data.description' : rs.description,
								'data.isLock':rs.isLock,
								'data.type':rs.type,
								'data.createTime':rs.createTime
							});
							if(undefined != rs.roleIds){
								$('#roles').combobox('setValues', rs.roleIds.split(","));
							}
							$("#infomationTree").tree({
								animate:true,
								lines:true,
								checkbox:false,
								url:easyui.contextPath+'/sys/menuAction!doNotSecurityMenuAndPrivilegeTree.do',
								method:'get'
							});
							$.messager.progress('close');
						}
					});
			});
			var closeinformationWindow = function (){
				window.parent.informationWindow.window('close');
			};
		</script>
	</body>
</html>
