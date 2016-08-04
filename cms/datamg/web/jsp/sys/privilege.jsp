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
					<!-- 用户ID -->
					<input type="hidden" id="userId" name="roleId" value="<%=null!=request.getParameter("id")?request.getParameter("id"):"" %>"/>
			    	<ul id="tree"></ul>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" href="javascript:void(0)" onclick="submitForm();" style="width:80px">保存</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="cancelFun();" style="width:80px">取消</a>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
					var userId = $("#userId").val();
					$("#tree").tree({
						animate:true,
						lines:true,
						checkbox:true,
						onlyLeafCheck:true,
						url:easyui.contextPath+'/sys/menuAction!doNotSecurityPrivilegeTree.do?id='+userId,
						method:'get'
					});
				});
			function submitForm(){
					var userId = $("#userId").val();
					//alert("roleId="+roleId);
					var nodes = $("#tree").tree("getChecked"); //获取勾选节点
					var privileges = '';
					for(var i=0; i<nodes.length; i++){
						if ('' != privileges){ 
							privileges += ',';
						}
						privileges += nodes[i].id;
					}
					//alert(privileges);
					$.post(easyui.contextPath+"/sys/menuAction!userGrant.do",{'id':userId,"ids":privileges},function(result){
							var rs = eval('(' + result + ')');  
							if(rs.success){
								window.parent.userWindow.window('close'); //关闭弹出窗口
							}
							easyui.show(rs.msg); 
						});
				};
			function cancelFun(){
				window.parent.userWindow.window('close'); //关闭弹出窗口
			};
		</script>
	</body>
</html>
