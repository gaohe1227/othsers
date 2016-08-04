<%@ page language="java" pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>机构表单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>

	<body>
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="unitForm" class="form" method="post">
					<input type="hidden" name="data.id" value="<%=null!=request.getParameter("id")?request.getParameter("id"):"" %>"/>
			    	<table class="table">
			    		<tr>
			    			<th>机构名称:</th>
			    			<td><input class="easyui-validatebox" style="width: 160px;" type="text" name="data.name" data-options="required:true"></input></td>
			    		</tr>
			    		<tr>
			    			<th>机构编码:</th>
			    			<td><input class="easyui-validatebox" data-options="required:true" style="width: 160px;" type="text" name="data.serialNumber"></input></td>
			    		</tr>
			    		<tr>
			    			<th>最后级机构:</th>
			    			<td>
			    				<input type="checkbox" name="data.isleaf" class="easyui-validatebox" style="width: 160px;" value="true">
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>父级机构:</th>
			    			<td>
			    				<input type="text" name="data.parentUnit.id" style="width: 160px;" id="parentUnit" class="easyui-combotree" data-options="url:'<%=contextPath %>/data/baseUnitAction!doNotSecurityTree.do',method:'get',animate:true,lines:true">
			    				<a href="" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#parentUnit').combotree('clear');"></a>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>机构描述:</th>
			    			<td>
			    				<textarea rows="4" style="width: 400px" name="data.description"></textarea>
			    			</td>
			    		</tr>
			    	</table>
			    </form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" href="javascript:void(0)" onclick="javascript:submitUnitForm();" style="width:80px">保存</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:cancelUnitFun();" style="width:80px">取消</a>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				var id = $(":input[name='data.id']").val();
				if(id.length>0){
					$.messager.progress({
						text : '数据加载中....'
					});
					$.getJSON(easyui.contextPath+"/data/baseUnitAction!getById.do?id="+id,function(rs){
							// alert(rs);
							if(undefined != rs.id){
								$('#unitForm').form('load', {
									'data.id' : rs.id,
									'data.name' : rs.name,
									'data.description' : rs.description,
									'data.parentUnit.id':rs.parentId,
									'data.serialNumber':rs.serialNumber
								});
								$.messager.progress('close');
							}
						});
				}
			});
			var cancelUnitFun = function(){
				window.parent.unitWindow.window('close');
			};
			var submitUnitForm = function(){
					//alert($("#menuForm").form('validate'));
					if($("#unitForm").form('validate')){
						var url = easyui.contextPath+"/data/baseUnitAction!save.do";
						// alert($(":input[name='data.id']").val());
						if($(":input[name='data.id']").val().length>0){
							url = easyui.contextPath+"/data/baseUnitAction!update.do";
						}
						//alert(url);
						//alert("data.parentUnit.id="+$(":input[name='data.parentUnit.id']").val());
						$("#unitForm").form('submit',{
								url:url,
								success:function(result){
									var rs = eval('(' + result + ')');  
									easyui.show(rs.msg);
									if(rs.success){
										window.parent.unitGrid.treegrid('reload');
										window.parent.unitWindow.window('close');
									}
								}
						});
					}
				};
		</script>
	</body>
</html>
