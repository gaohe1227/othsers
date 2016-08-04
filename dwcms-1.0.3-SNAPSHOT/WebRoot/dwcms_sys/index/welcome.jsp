<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dwcms-left</title>
		<link href="<%=basePath%>res/dwcms/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>res/dwcms/css/theme.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/thirdparty/jquery-easyui/themes/icon.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/thirdparty/jquery-easyui/themes/dark-hive/easyui.css" id="swicth-style">
		<script type="text/javascript" src="<%=basePath%>/thirdparty/jquery-easyui/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/thirdparty/jquery-easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/pony.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>res/common/js/jquery.ext.js"></script>
</head>
<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;"  border="0" frameborder="0" scrolling="no"></iframe></div>
<div class="body-box">
<div class="rhead">
	<div class="rpos">当前位置: 首页 - 欢迎页</div>
	<div class="clear"></div>
</div>

<table style="border-right: 1px solid rgb(200, 200, 231); border-width: 0pt 1px 1px; border-style: none solid solid; border-color: -moz-use-text-color rgb(200, 200, 231) rgb(200, 200, 231); -moz-border-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-colors: none; -moz-border-left-colors: none; -moz-border-image: none; margin-top: 5px;" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody><tr>
    <td colspan="2" align="left" background="<%=basePath %>/res/dwcms/img/admin/msg_bg.jpg" height="26">
	&nbsp;&nbsp;<img src="<%=basePath %>/res/dwcms/img/admin/ico1.gif" align="absmiddle" border="0"> <strong>系统属性</strong> </td>
  </tr>
  <tr>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="right" bgcolor="#FFFFFF" height="25" width="18%">DWCMS程序版本：</td>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="left" bgcolor="#FFFFFF" width="82%">dwcms-3.1.1-final 【<a href="http://www.doadway.com/" target="_blank">查看最新版本</a>】</td>
  </tr>
  <tr style="background-color: rgb(247, 248, 250);">
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="right" height="25">操作系统版本：</td>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="left">
    	<%=System.getProperty("os.name") %> <%=System.getProperty("os.version") %>
    </td>
  </tr>
  <tr>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="right" bgcolor="#FFFFFF" height="25">操作系统类型：</td>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="left" bgcolor="#FFFFFF">
		<%=System.getProperty("os.arch") %> 32位 
	</td>
  </tr>
  <tr>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="right" bgcolor="#F7F8FA" height="25">用户,目录,临时目录：</td>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="left" bgcolor="#F7F8FA">
		<%=System.getProperty("user.name")+", "+System.getProperty("user.dir")+", "+System.getProperty("catalina.home")+"\\temp"%>
	</td>
  </tr>
  <tr>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="right" bgcolor="#FFFFFF" height="25">JAVA运行环境：</td>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="left" bgcolor="#FFFFFF">
		<%=System.getProperty("java.vendor")+System.getProperty("java.version")%>
	</td>
  </tr>
  <tr>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="right" bgcolor="#F7F8FA" height="25">JAVA虚拟机：</td>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="left" bgcolor="#F7F8FA">
		<%=System.getProperty("java.vm.name")+" "+System.getProperty("java.vm.version") %>
	</td>
  </tr>
  <tr>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="right" bgcolor="#FFFFFF" height="25">已用/剩余/最大 内存：</td>
    <td style="border-bottom: 1px dashed rgb(204, 204, 204);" align="left" bgcolor="#FFFFFF"><%=Runtime.getRuntime().totalMemory()/1024D/1024D%>/<%=(Runtime.getRuntime().maxMemory()-Runtime.getRuntime().totalMemory())/1024D/1024D%>/<%=Runtime.getRuntime().maxMemory()/1024D/1024D%>M</td>
  </tr>
</tbody></table>

</div>

</body></html>