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
				<form id="menuForm" class="form" method="post">
					<input type="hidden" name="data.id" value="<%=null!=request.getParameter("id")?request.getParameter("id"):"" %>"/>
			    	<table class="table" width="100%">
			    		<tr>
			    			<th>菜单名称:</th>
			    			<td><input class="easyui-validatebox" style="width: 160px;" type="text" name="data.name" data-options="required:true"></input></td>
			    		</tr>
			    		<tr>
			    			<th>菜单地址:</th>
			    			<td><input class="easyui-validatebox" style="width: 160px;" type="text" name="data.href"></input></td>
			    		</tr>
			    		<tr>
			    			<th>子菜单:</th>
			    			<td>
			    				<input type="checkbox" name="data.isleaf" class="easyui-validatebox" style="width: 160px;" value="true">
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>跳转类型</th>
			    			<td>
			    				<select name="data.skipType" class="easyui-combobox" style="width: 160px;">
			    					<option value="HREF" selected="selected">HREF</option>
			    					<option value="IFRAME">IFRAME</option>
			    				</select>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>菜单序号:</th>
			    			<td><input name="data.sort" value="1" style="width: 160px;" class="easyui-numberspinner" style="width:80px;" data-options="required:true,min:1,editable:true">  
		
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>菜单类别:</th>
			    			<td>
			    				<select class="easyui-combobox" name="data.type" style="width: 160px;">
			    					<option value="1" selected="selected">菜单</option>
			    					<option value="0">功能</option>
			    				</select>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>父级菜单:</th>
			    			<td>
			    				<input type="text" name="data.parentMenu.id" style="width: 160px;" id="parentMenu" class="easyui-combotree" data-options="url:'<%=contextPath %>/sys/menuAction!doNotSecurityComboTree.do',method:'get',animate:true,lines:true">
			    				<a href="" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#parentMenu').combotree('clear');"></a>
			    			</td>
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
					$.getJSON(easyui.contextPath+"/sys/menuAction!getById.do?id="+id,function(rs){
							// alert(rs);
							if(undefined != rs.id){
								$('#menuForm').form('load', {
									'data.id' : rs.id,
									'data.name' : rs.name,
									'data.description' : rs.description,
									'data.href': rs.href,
									'data.isleaf':rs.isleaf,
									'data.sort':rs.sort,
									'data.parentMenu.id':rs.parentId,
									'data.type':rs.type,
									'data.skipType':rs.skipType
								});
								$.messager.progress('close');
							}
						});
				}
			});
			var cancelFun = function(){
				window.parent.w.window('close');
			};
			var submitForm = function(){
					//alert($("#menuForm").form('validate'));
					if($("#menuForm").form('validate')){
						var url = easyui.contextPath+"/sys/menuAction!save.do";
						// alert($(":input[name='data.id']").val());
						if($(":input[name='data.id']").val().length>0){
							url = easyui.contextPath+"/sys/menuAction!update.do";
						}
						// alert(url);
						$("#menuForm").form('submit',{
								url:url,
								success:function(result){
									var rs = eval('(' + result + ')');  
									easyui.show(rs.msg);
									if(rs.success){
										window.parent.grid.treegrid('reload');
										window.parent.w.window('close');
									}
								}
						});
					}
				};
		</script>
	</body>
</html>
