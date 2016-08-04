<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglib.jsp" %>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>用户管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
</head>

	<body>
		<div class="easyui-layout" data-options="fit:true">
			  <div data-options="region:'west',split:true" style="width:200px;">
			  		<ul id="orgTree"></ul>
			  </div>   
   			  <div data-options="region:'center'">
   			  		<div data-options="fit:true,border:false" style="height: 100%">
   			  			<input type="hidden" name="unitId"/>
						<table id="baseUserGrid" data-options="fit:true"></table>
					</div>
					<div id="baseUsertoolbar" style="display: none;">
							<table>
								<tr>
									<sj:privilege privilege="/data/baseUserAction!save"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addLoginUserFun()">添加</a></td></sj:privilege>
									<sj:privilege privilege="/data/baseUserAction!update"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editLoginUserFun()">修改</a></td></sj:privilege>
									<sj:privilege privilege="/data/baseUserAction!deleteAll"><td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteLoginUsers()">删除</a></td></sj:privilege>
									<td><div class="datagrid-btn-separator"></div></td>
									<td>用户名:<input type="hidden" name="QUERY_t#unit.id_S_EQ" id="unitId"></td>
									<td><input name="QUERY_t#userName_S_LK" type="text" style="width: 130px;" /></td>
									<td>真实姓名:</td>
									<td><input name="QUERY_t#realName_S_LK" type="text" style="width: 130px;" /></td>
									<td><a href="" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="baseUserSearchFun()">查询</a></td>
								</tr>
							</table>
					</div>
   			  </div>  
		</div>
		<script type="text/javascript">
		var baseUserGrid;
		var baseUserWin;
		$(function(){
			//加载机构树
			$("#orgTree").tree({
				url:easyui.contextPath+'/data/baseUnitAction!doNotSecurityTree.do',
				method:'get',
				animate:true,
				lines:false,
				onClick:function(node){
					$(":input[name='unitId']").val(node.id);
					$("#unitId").val(node.id);
					baseUserGrid.datagrid('reload',{'QUERY_t#unit.id_S_EQ':node.id});
				}
			});
			//加载表格
			baseUserGrid = $('#baseUserGrid').datagrid({    
			    url:easyui.contextPath+'/data/baseUserAction!grid.do', 
				rownumbers : true,
				pagination : true,
				singleSelect:false,
				sortName:'createTime',
				sortOrder:'desc',
				pageSize:20,
				pageList:[10,20,30,50,100],
				frozenColumns:[[{field:'ck',checkbox:true},{title:'用户名',field:'userName',width:'120',sortable:true}]],
			    columns:[[{title:'真实姓名',field:'realName',width:'100',sortable:true},
			    	{title:'邮箱',
				     field:'email',
				     width:'130'
				    },{title:'手机号码',
					   field:'mobilePhone',
					   width:'100'
					},{	   title:'性别',
						   field:'sex',
						   width:'80',
						   formatter: function(value,row,index){
								if("1"==value){
									return "男";
								}else if("2"==value){
									return "女";
								}else{
									return "未知";
								}
							}
						},{
						title:'描述',
						field:'description',
						width:'150'
						},{
						title:'创建时间',
						field:'createTime',
						width:'150',
						sortable:true
						}
			    ]],
			    toolbar:'#baseUsertoolbar'
			});
		});
		function baseUserSearchFun(){
			baseUserGrid.datagrid("reload",easyui.serializeObject("baseUsertoolbar"));
		}
		//添加用户
		function addLoginUserFun(){
			//alert("abc..");
				var unitId = $(":input[name='unitId']").val();
				if(unitId.length>0){
					baseUserWin = easyui.window({
							title:"添加用户信息",
							href:easyui.contextPath+"/jsp/data/usersForm.jsp?unitId="+unitId
						});
					baseUserWin.window('open');
				}else{
					easyui.show("请选择左边机构树,再进行添加!");
				}
			}
		function editLoginUserFun(){
				var row = baseUserGrid.datagrid('getSelected');
				if(row){
					baseUserWin = easyui.window({
						title:'修改登录用户信息',
						href:easyui.contextPath+'/jsp/data/usersForm.jsp?id='+row.id
					});
					baseUserWin.window('open');
				}else{
					easyui.show("请选择您要修改的信息!");
				}
			}
		// 删除用户信息
		function deleteLoginUsers(){
				var rows = baseUserGrid.datagrid("getSelections");
				if(rows.length>0){
					var ids="";
					for(var i=0;i<rows.length;i++){
						if(""!=ids){
							ids+=",";
						}
						ids+=rows[i].id;
					}
					 //Ajax访问服务器
					$.getJSON(easyui.contextPath+"/data/baseUserAction!deleteAll.do?ids="+ids,function(rs){
							if(rs.success){
								baseUserGrid.datagrid('reload');
							}
							easyui.show(rs.msg);
						}); 
				}else{
					easyui.show("请选择您要删除的用户信息!");
				}
			}
		</script>
	</body>
</html>
