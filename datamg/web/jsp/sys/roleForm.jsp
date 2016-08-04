<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>菜单表单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>

	<body>
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="roleForm" class="form" method="post">
					<input type="hidden" name="data.id" value="<%=null!=request.getParameter("id")?request.getParameter("id"):"" %>"/>
			    	<table class="table" width="100%">
			    		<tr>
			    			<th>角色名称:</th>
			    			<td><input class="easyui-validatebox" style="width: 160px;" type="text" name="data.name" data-options="required:true"></input></td>
			    		</tr>
			    		<tr>
			    			<th>菜单描述:</th>
			    			<td>
			    				<textarea rows="4" style="width: 400px" name="data.description"></textarea>
			    			</td>
			    		</tr>
			    	</table>
			    </form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" href="javascript:void(0)" onclick="javascript:submitForm();" style="width:80px">保存</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:cancelFun();" style="width:80px">取消</a>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				var id = $(":input[name='data.id']").val();
				if(id.length>0){
					$.messager.progress({
						text : '数据加载中....'
					});
					$.getJSON(easyui.contextPath+"/sys/roleAction!getById.do?id="+id,function(rs){
							// alert(rs);
							if(undefined != rs.id){
								$('#roleForm').form('load', {
									'data.id' : rs.id,
									'data.name' : rs.name,
									'data.description' : rs.description
								});
								$.messager.progress('close');
							}
						});
				}
			});
			var cancelFun = function(){
				window.parent.roleWindow.window('close');
			};
			var submitForm = function(){
					if($("#roleForm").form('validate')){
						var url = easyui.contextPath+"/sys/roleAction!save.do";
						if($(":input[name='data.id']").val().length>0){
							url = easyui.contextPath+"/sys/roleAction!update.do";
						}
						// alert(url);
						$("#roleForm").form('submit',{
								url:url,
								success:function(result){
									var rs = eval('(' + result + ')');
									easyui.show(rs.msg);
									if(rs.success){
										window.parent.roleGrid.datagrid('reload');
										window.parent.roleWindow.window('close');
									}
								}
						});
					}
				};
		</script>
	</body>
</html>
