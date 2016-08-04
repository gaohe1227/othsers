<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<jsp:include page="/jslib.jsp"></jsp:include>
<script type="text/javascript">
	jQuery(function(){
			$("#menuTree").tree({
					onClick:function(node){
						//alert(node.attributes);
						var attr = node.attributes;
						if(null!=attr&&''!=attr){
							var title = node.text;
							//alert(attr.skipType+"  "+attr.href);
							if('IFRAME'==attr.skipType){
								var content='<iframe src='+easyui.contextPath+attr.href+' allowTransparency="true" style="border:0;width:100%;height:99%;" frameBorder="0"></iframe>';
								if ($('#tabs').tabs('exists', title)){
									$('#tabs').tabs('select', title);
								}else{
									$('#tabs').tabs('add',{
										id:node.id,
									    title:title,
									    content:content,
									    closable:true,
									    cache:false
									}); 
								}
							}else{
								if ($('#tabs').tabs('exists', title)){
									$('#tabs').tabs('select', title);
								}else{
									$('#tabs').tabs('add',{
										id:node.id,
									    title:title,
									    href:easyui.contextPath+attr.href,
									    closable:true,
									    cache:false
									}); 
								}
							}
						}
					}
				});
			showDateTime();//显示时间和星期
			setInterval("showDateTime()", 1000);
		});
	//显示时间方法
	function showDateTime(){
		var dtStr = easyui.currDate(true);
		//alert("dtStr="+dtStr);
		$("#currDateTime").text(dtStr);
	}
	//退出系统
	function loginOut(){
		$.messager.confirm('确认对话框', '您想要退出该系统吗？', function(r){
			if (r){
			    // 退出操作;
				$.getJSON(easyui.contextPath+"/sys/loginUserAction!doNotSecurityLoginout.do",function(rs){
						if(rs.success){
							window.location.replace("<%=contextPath%>/index.jsp");
						}
						easyui.show(rs.msg);
					});
			}
		});
	}
	//显示修改密码对话框
	function showUpdatePassword(){
		$("#passwordDiv").dialog({
				iconCls:'icon-edit',
				title:'修改密码',
				width:320,
				height:140,
				modal:true,
				closed:true,
				buttons: [{
					text:'保存',
					iconCls:'icon-save',
					handler:function(){
						//保存密码修改
						if($("#updatePwd").form('validate')){
							var newPassword = $(":input[name='data.password']").val();
							var newrePassword = $(":input[name='rePassword']").val();
							//alert("easyui.contextPath="+easyui.contextPath);
							if(newPassword == newrePassword){
								$("#updatePwd").form('submit',{
									url:easyui.contextPath+'/sys/loginUserAction!doNotSecurityPassword.do',
									success:function(result){
										var rs = eval('(' + result + ')');
										easyui.show(rs.msg);
										if(rs.success){
											$("#updatePwd").form('clear');
											$("#passwordDiv").dialog('close');
										}
									}
								});
							}else{
								$.messager.alert("错误提示","两次密码输入不匹配!","error");
							}
						}
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$("#updatePwd").form('clear');
						$("#passwordDiv").dialog('close');
					}
				}]
		});
		$("#passwordDiv").dialog('open');
	}
	//用户查看我的信息
	var informationWindow;
	function showInformationWindow(){
		informationWindow = easyui.window({
			title:"我的信息",
			iconCls:'icon-user',
			href:easyui.contextPath+"/jsp/sys/information.jsp"
		});
		informationWindow.window('open');
	}
</script>
</head>

<body>
<div class="easyui-layout" fit="true">
	<div class="bg" data-options="region:'north',split:true" style="height:100px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false"></div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				欢迎用户(${loginName})登录系统  当前时间:<span id="currDateTime"></span>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-user',plain:true" href="javascript:void(0)" onclick="showInformationWindow()" style="width:80px">我的信息</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" href="javascript:void(0)" onclick="showUpdatePassword()" style="width:80px">修改密码</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" href="javascript:void(0)" onclick="loginOut()" style="width:80px">退出</a>
			</div>
		</div>
	</div>
	<div data-options="region:'west',split:true" title="导航菜单" style="width: 200px">
		<ul class="easyui-tree" id="menuTree" data-options="fit:true,url:'<%=contextPath%>/sys/menuAction!doNotSecurityTreeMenu.do',method:'get',animate:true">
		</ul>
	</div>
	<div data-options="region:'center'">
		<div class="easyui-tabs" data-options="fit:true" id="tabs"></div>
	</div>
</div>
<div id="passwordDiv"> 
  	<form id="updatePwd" name="updatePwd"> 
		<table style="width: 100%;border: 0"> 
			<tr>
	        	<td align="right">新密码</td>
	        	<td><input type="password" name="data.password" class="easyui-validatebox" data-options="required:true,validType:['length[6,20]']"/></td>
	        </tr>
	        <tr>
	        	<td align="right">确认密码</td>
	        	<td><input type="password" name="rePassword" class="easyui-validatebox" data-options="required:true,validType:['length[6,20]']"/></td>
	        </tr>
     	</table>
    </form>
</div>  
</body>
</html>
