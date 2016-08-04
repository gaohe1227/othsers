<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>用户表单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>

	<body>
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="baseUserForm" class="form" method="post">
					<input type="hidden" name="data.id" value="<%=null!=request.getParameter("id")?request.getParameter("id"):"" %>"/>
					<input type="hidden" name="data.createTime">
					<input type="hidden" name="data.unit.id" value="<%=null!=request.getParameter("unitId")?request.getParameter("unitId"):"" %>">
			    	<table class="table" width="100%">
			    		<tr>
			    			<th>用户名:</th>
			    			<td><input class="easyui-validatebox" style="width: 200px;" type="text" name="data.userName" data-options="required:true,validType:'length[4,20]'"></input></td>
			    		</tr>
			    		<tr>
			    			<th>真实姓名:</th>
			    			<td><input class="easyui-validatebox" style="width: 200px;" type="text" name="data.realName" data-options="required:true"></input></td>
			    		</tr>
			    		<tr>
			    			<th>用户类型:</th>
			    			<td>
			    				<input type="text" name="data.userType" style="width: 200px;" class="easyui-combobox" data-options="required:true,valueField:'code',textField:'name',url:'<%=contextPath%>/sys/parameterAction!doNotSecurityComboBox.do?id=userType'">
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>性别</th>
			    			<td>
			    				<input type="text" name="data.sex" style="width: 200px;" class="easyui-combobox" data-options="required:true,valueField:'code',textField:'name',url:'<%=contextPath%>/sys/parameterAction!doNotSecurityComboBox.do?id=sex'">
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>邮箱</th>
			    			<td>
			    				<input type="text" name="data.email" style="width: 200px;" class="easyui-validatebox" data-options="validType:'email'">
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>手机</th>
			    			<td>
			    				<input type="text" name="data.mobilePhone" style="width: 200px;" class="easyui-validatebox">
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>是否生成登录用户</th>
			    			<td>
			    				<input type="checkbox" name="data.isLogin" value="true" checked="checked"><font color="red">注:勾选会生成登录用户</font>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>用户描述:</th>
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
					$.getJSON(easyui.contextPath+"/data/baseUserAction!getById.do?id="+id,function(rs){
							// alert(rs.id);
							if(undefined != rs.id){
								$('#baseUserForm').form('load', {
									'data.id' : rs.id,
									'data.userName' : rs.userName,
									'data.description' : rs.description,
									'data.unit.id':rs.unit.id,
									'data.isLogin':rs.isLogin,
									'data.userType':rs.userType,
									'data.createTime':rs.createTime,
									'data.realName':rs.realName,
									'data.sex':rs.sex,
									'data.email':rs.email,
									'data.mobilePhone':rs.mobilePhone
								});
								$.messager.progress('close');
							}
						});
				}
			});
			var closeLoginUserWindow = function (){
				window.parent.baseUserWin.window('close');
			};
			var submitLoginUserForm = function(){
					if($("#baseUserForm").form('validate')){
						var url = easyui.contextPath+"/data/baseUserAction!save.do";
						if($(":input[name='data.id']").val().length>0){
							url = easyui.contextPath+"/data/baseUserAction!update.do";
						}
						$("#baseUserForm").form('submit',{
							url:url,
							success:function(result){
								var rs = eval('(' + result + ')');
								if(rs.success){
									window.parent.baseUserGrid.datagrid('reload');
									window.parent.baseUserWin.window('close');
								}
								easyui.show(rs.msg);
							}
						});
				}
			};
		</script>
	</body>
</html>
