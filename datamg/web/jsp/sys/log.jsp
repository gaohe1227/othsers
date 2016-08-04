<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglib.jsp" %>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>系统日志管理管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
</head>

	<body>
		<div id="logtoolbar" style="display:none">
			<table>
				<tr>
					<sj:privilege privilege="/sys/roleAction!deleteAll"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeLogAllFun()">删除</a></td></sj:privilege>
					<td><div class="datagrid-btn-separator"></div></td>
					<td>登录名</td>
					<td><input type="text" name="QUERY_t#loginName_S_LK"/></td>
					<td>模块名称</td>
					<td><input type="text" name="QUERY_t#moduleName_S_LK"/></td>
					<td>时间段</td>
					<td><input type="text" class="easyui-datebox" name="QUERY_t#createTime_D_GT"/>-</td>
					<td><input type="text" class="easyui-datebox" name="QUERY_t#createTime_D_LT"/></td>
					<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="logSerachFun()">查询</a></td>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',border:false" style="height: 100%">
			<table id="logGrid" data-options="fit:true"></table>
		</div>
		<script type="text/javascript">
		function logSerachFun(){
			var serach = easyui.serializeObject("logtoolbar");
			logGrid.datagrid('reload',serach);
		}
		function removeLogAllFun(){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			    	var rows = logGrid.datagrid('getSelections');
					if(rows.length>0){
						var ids = "";
						for(var i=0;i<rows.length;i++){
							if(""!=ids){
								ids+=",";
							}
							ids+=rows[i].id;
						}
						 //Ajax访问服务器
						$.getJSON(easyui.contextPath+"/sys/logAction!deleteAll.do",{ids:ids},function(rs){
								if(rs.success){
									logGrid.datagrid('unselectAll');
									logGrid.datagrid('reload');
								}
								easyui.show(rs.msg);
							}); 
					}else{
						easyui.show('请选择您要删除的信息!');
					}
			    }   
			});  
		}
		var logGrid;
		$(function(){
			logGrid = $('#logGrid').datagrid({
			    url:easyui.contextPath+'/sys/logAction!grid.do', 
				rownumbers : true,
				striped : true,
				pagination : true,
				singleSelect:false,
				sortName:'createTime',
				sortOrder:'desc',
				pageSize:20,
				pageList:[20,50,100,200],
			    columns:[[{field:'ck',checkbox:true},
			    	{title:'登录名',
				     field:'loginName',
				     width:'130',
				     sortable:true
				    },{title:'IP地址',
					   field:'ipAddress',
					   width:'130'
					},{title:'模块名称',
					   field:'moduleName',
					   width:'130'
					},{
					   title:'模块地址',
					   field:'moduleUrl',
					   width:'130'
					},{
					   title:'操作类型',
					   field:'operation',
					   width:'130'
					},{
					   title:'操作明细',
					   field:'record',
					   width:'130'
					},{
						   title:'操作时间',
						   field:'createTime',
						   width:'130',
						   sortable:true
						}
			    ]],
			    toolbar: '#logtoolbar'
			});
		});
		</script>
	</body>
</html>
