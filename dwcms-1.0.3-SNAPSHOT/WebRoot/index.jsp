<%@ include file="/res/common/jsp/jsp_defined.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/thirdparty/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/thirdparty/jquery-easyui/themes/icon.css">
	<!-- 
	<script type="text/javascript" src="${vhost}thirdparty/jquery-easyui/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${vhost}thirdparty/jquery-easyui/jquery.easyui.min.js"></script>	
	 -->
	<link rel="stylesheet" href="<%=basePath %>/thirdparty/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="<%=basePath %>/thirdparty/zTree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/thirdparty/zTree/js/jquery.ztree.core-3.5.js"></script>		

	<SCRIPT type="text/javascript">
		<!--
		var setting = {
			callback: {
				onClick: onClick
			}
		};
		function onClick(e, treeId, treeNode){
			alert(treeNode.id);
		}
		var zNodes ={};
		$.ajax({            
            type:"get",   
            dataType:"json", 
            url:"${vhost}/admin/core/channel/v_ztree.do",  //
            error:function(request) {                
                alert("数据加载出错:"+request);
            },
            success:function(data) {
            	zNodes=data;
            	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
            }            
		});
		//-->
	</SCRIPT>	
  </head>
  
  <body>
  <jsp:forward page="/index.vm"></jsp:forward>
  		<!-- 
        <ul id="tt" class="easyui-tree"  url="${vhost}admin/core/channel/c_channel_tree.do" /> 
        <ul id="ztree"   url="${vhost}admin/core/channel/v_ztree.do" /> 
		<ul id="treeDemo" class="ztree"></ul>
  		 -->
  </body>
  <!-- 
        <script type="text/javascript">
        	$("#tt").tree({
				onClick:function(node){
					alert(node.id+"\n\t\t"+node.text);
				}	
            });
        </script>
   -->
</html>
