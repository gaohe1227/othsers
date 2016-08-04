<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>登录用户表单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>

	<body>
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="userForm" class="form" method="post">
					<input type="hidden" name="data.id" value="<%=null!=request.getParameter("id")?request.getParameter("id"):"" %>"/>
					<input type="hidden" name="data.createTime">
			    	<table class="table" width="100%">
			    		<tr>
			    			<th>登录名:</th>
			    			<td><input class="easyui-validatebox" style="width: 160px;" type="text" name="data.loginName" data-options="required:true,validType:'length[4,20]'"></input></td>
			    		</tr>
			    		<!-- 修改登录用户信息不修改密码 -->
			    		<%if(null==request.getParameter("id")||"".equals(request.getParameter("id"))){ %>
			    		<tr>
			    			<th>登录密码:</th>
			    			<td>
			    				<input name="data.password" type="password" style="width: 160px;" class="easyui-validatebox" data-options="required:true,validType:['length[6,20]']" />   
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>重复密码:</th>
			    			<td>
			    				<input type="password" name="repassword" id="repassword" style="width: 160px;" class="easyui-validatebox" data-options="required:true,validType:['length[6,20]']" />  
			    			</td>
			    		</tr>
			    		<%} %>
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
			    	</table>
			    </form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" href="javascript:void(0)" onclick="javascript:submitLoginUserForm();" style="width:80px">保存</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:closeLoginUserWindow();" style="width:80px">取消</a>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				var id = $(":input[name='data.id']").val();
				if(id.length>0){
					$.messager.progress({
						text : '数据加载中....'
					});
					$.getJSON(easyui.contextPath+"/sys/loginUserAction!getById.do?id="+id,function(rs){
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
								// alert(rs.roleIds);
								if(undefined != rs.roleIds){
									$('#roles').combobox('setValues', rs.roleIds.split(","));
								}
								$.messager.progress('close');
							}
						});
				}
				//判断两次输入密码是否一致
				$("#repassword").blur(function(){
						var repwd = $(this).val();
						var pwd = $(":input[name='data.password']").val();
						if(''!=pwd && ''!=repwd && repwd!=pwd){
								easyui.show("两次密码输入不匹配!");
								$(this).val("");
								$(this).focus(); //输入重复密码框获得焦点
						}
					});
			});
			var closeLoginUserWindow = function (){
				window.parent.userWindow.window('close');
			};
			var submitLoginUserForm = function(){
					if($("#userForm").form('validate')){
						var url = easyui.contextPath+"/sys/loginUserAction!save.do";
						if($(":input[name='data.id']").val().length>0){
							url = easyui.contextPath+"/sys/loginUserAction!update.do";
						}
						$("#userForm").form('submit',{
							url:url,
							success:function(result){
								var rs = eval('(' + result + ')');
								if(rs.success){
									window.parent.userGrid.datagrid('reload');
									window.parent.userWindow.window('close');
								}
								easyui.show(rs.msg);
							}
						});
				}
			};
		</script>
	</body>
</html>
