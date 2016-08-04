<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>分类表单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>

	<body>
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="categoryForm" class="form" method="post" >
					<input type="hidden" name="data.id" value="<%=null!=request.getParameter("id")?request.getParameter("id"):"" %>"/>
					<input type="hidden" name="data.createTime">
			    	<table class="table" width="100%">
			    		<tr>
			    			<th>分类名称:</th>
			    			<td><input class="easyui-validatebox" style="width: 160px;" type="text" name="data.name" data-options="required:true"></input></td>
			    		</tr>
			    		<tr>
			    			<th>父级分类:</th>
			    			<td>
			    				<input type="text" name="data.parentCategory.id" style="width: 160px;" id="parentCategory" class="easyui-combotree" data-options="url:'<%=contextPath %>/ws/categoryAction!doNotSecurityComboTree.do',method:'get',animate:true,lines:true">
			    				<a href="" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#parentCategory').combotree('clear');"></a>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>描述描述:</th>
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
					$.getJSON(easyui.contextPath+"/ws/categoryAction!getById.do?id="+id,function(rs){
							// alert(rs);
							if(undefined != rs.id){
								$('#categoryForm').form('load', {
									'data.id' : rs.id,
									'data.name' : rs.name,
									'data.description' : rs.description,
									'data.parentCategory.id':rs.parentId,
									'data.createTime':rs.createTime
								});
								$.messager.progress('close');
							}
						});
				}
			});
			var cancelFun = function(){
				window.parent.catWin.window('close');
			};
			var submitForm = function(){
					//alert($("#menuForm").form('validate'));
					if($("#categoryForm").form('validate')){
						var url = easyui.contextPath+"/ws/categoryAction!save.do";
						// alert($(":input[name='data.id']").val());
						if($(":input[name='data.id']").val().length>0){
							url = easyui.contextPath+"/ws/categoryAction!update.do";
						}
						// alert(url);
						$("#categoryForm").form('submit',{
								url:url,
								success:function(result){
									var rs = eval('(' + result + ')');  
									if(rs.success){
										easyui.show(rs.msg);
										window.parent.catGrid.treegrid('reload');
										window.parent.catWin.window('close');
									}
								}
						});
					}
				};
		</script>
	</body>
</html>
