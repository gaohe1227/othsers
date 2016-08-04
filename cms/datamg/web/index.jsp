<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath = request.getContextPath();
	String param = request.getParameter("param");
	if(null==param){
		param = "";
	}
%>
<html>
<head>
<title>登录页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<jsp:include page="/jslib.jsp"></jsp:include>
</head>
<body>
	<div id="login" class="easyui-window" style="width:300px;height:200px">   
	    <form name="loginForm" id="loginForm" method="post">
	    	<table align="center" style="border: 0;padding-top: 10px">
			    		<tr>
			    			<th align="right">登录名:</th>
			    			<td><input class="easyui-validatebox" style="width: 160px;" type="text" name="data.loginName" data-options="required:true,validType:'length[4,20]'"></input></td>
			    		</tr>
			    		<tr>
			    			<th align="right">登录密码:</th>
			    			<!-- <td><input name="data.password" type="password" style="width: 160px;" class="easyui-validatebox" data-options="required:true,validType:['length[6,20]']" /></td> -->
			    		</tr>
	    	</table>
	    </form>
	</div>  
	<script type="text/javascript">
		function login(){
			 $.messager.progress({
					text:'登录中,请稍后...'
				 });
			 if($("#loginForm").form('validate')){ //表单验证通过
				$("#loginForm").form("submit",{ //提交表单
						url:'sys/loginUserAction!doNotSecurityLogin.do',
						success:function(result){
							var rs = eval('(' + result + ')');
							if(rs.success){
								location.replace("jsp/main.jsp");	;
							}else{
								$.messager.alert("登录失败",rs.msg,"error");
							}
							$.messager.progress('close');
						}
				});
			 }else{
				 $.messager.progress('close');
			 }
		}
		jQuery(function(){
				$("#login").dialog({
						iconCls:'icon-lock',
						modal:true,
						collapsible:false,
						title:'SSHE系统登录',
						minimizable:false,
						maximizable:false,
						closable:false,
						closed:false,
						buttons:[{
								  text:'登录',
								  iconCls:'icon-unlock',
								  handler:function(){
									  login();
								  }
								},{
									text:'重置',
									iconCls:'icon-cancel',
									handler:function(){
									 	$("#loginForm").form('clear');
								 	 }
									}]
					});
				$(document).keydown(function(event){
					if(13 == event.which){
						login();
					}
				});
			});
	</script>
</body>
	
</html>