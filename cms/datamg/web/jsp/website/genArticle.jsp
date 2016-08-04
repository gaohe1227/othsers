<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>生成网页（内容页）</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>

	<body>
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="articleForm" class="form" method="post">
					<input type="hidden" name="data.id" value="<%=null!=request.getParameter("id")?request.getParameter("id"):"" %>"/>
					<input type="hidden" name="data.createTime">
			    	<table class="table" width="100%">
			    		<tr>
			    			<th>选择模板:</th>
			    			<td><input class="easyui-validatebox" style="width: 220px;" type="text" name="data.title" data-options="required:true"></input></td>
			    		</tr>
			    		<tr>
			    			<th>保存路径:</th>
			    			<td>
			    				<input type="text" name="data.category.id" style="width: 220px;" class="easyui-combotree" data-options="url:'<%=contextPath %>/ws/categoryAction!doNotSecurityComboTree.do',method:'get',animate:true,lines:true,required:true">
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>文章作者:</th>
			    			<td><input class="easyui-validatebox" style="width: 220px;" type="text" name="data.author" data-options="required:true"></input></td>
			    		</tr>
			    		<tr>
			    			<th>文章类型</th>
			    			<td>
			    				<select name="data.type" class="easyui-combobox" style="width: 220px;">
			    					<option value="0">原创</option>
			    					<option value="1">转载</option>
			    				</select>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>文章内容:</th>
			    			<td>
			    				<textarea style="width:800px;height:380px;" name="data.content"></textarea>
			    			</td>
			    		</tr>
			    	</table>
			    </form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" href="javascript:void(0)" onclick="javascript:submitForm();" style="width:80px">保存</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" href="javascript:void(0)" onclick="javascript:submitForm();" style="width:80px">预览</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:cancelFun();" style="width:80px">取消</a>
			</div>
		</div>
		<script type="text/javascript">
			var editor;
			$(function(){
				//加载编辑器
				editor = KindEditor.create('textarea[name="data.content"]',{
					readonlyMode:false
				});
				
				var id = $(":input[name='data.id']").val();
				if(id.length>0){
					$.messager.progress({
						text : '数据加载中....'
					});
					$.getJSON(easyui.contextPath+"/ws/articleAction!getById.do?id="+id,function(rs){
							// alert(rs);
							if(undefined != rs.id){
								$('#articleForm').form('load', {
									'data.id' : rs.id,
									'data.title' : rs.title,
									'data.category.id' : rs.category.id,
									'data.author':rs.author,
									'data.createTime':rs.createTime,
									'data.type':rs.type,
									'data.content':rs.content
								});
								//editor.html(rs.content);
								$.messager.progress('close');
							}
						});
				}
			});
			var cancelFun = function(){
				window.parent.articleWindow.window('close');
			};
			var submitForm = function(){
					//alert(editor.html());
					//alert($("#menuForm").form('validate'));
					if($("#articleForm").form('validate')){
						var url = easyui.contextPath+"/cms/cmsAction!save.do";
						// alert($(":input[name='data.id']").val());
						if($(":input[name='data.id']").val().length>0){
							url = easyui.contextPath+"/cms/cmsAction!update.do";
						}
						// alert(url);
						$("#articleForm").form('submit',{
								url:url,
								success:function(result){
									var rs = eval('(' + result + ')');  
									if(rs.success){
										window.parent.articleGrid.datagrid('reload');
										window.parent.articleWindow.window('close');
									}
									easyui.show(rs.msg);
								}
						});
					}
				};
		</script>
	</body>
</html>
