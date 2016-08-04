<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 12px;
	color: #033d61;
	text-decoration: none;
}
-->
</style>
<style type="text/css">
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #ffffff; POSITION: relative; TOP: 2px 
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #FFCC00; POSITION: relative; TOP: 2px
}

</style>
<script>

var he=document.body.clientHeight-105
document.write("<div id=tt style=height:"+he+";overflow:hidden>")
</script>
<shiro:notAuthenticated>
<script type="text/javascript">
top.location="<%=basePath%>/login.do";
</script>
</shiro:notAuthenticated>
<!-- 
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/thirdparty/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/thirdparty/jquery-easyui/themes/icon.css">
	<script type="text/javascript" src="<%=basePath %>/thirdparty/jquery-easyui/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/thirdparty/jquery-easyui/jquery.easyui.min.js"></script>
 -->
		
	<link rel="stylesheet" href="<%=basePath %>thirdparty/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="<%=basePath %>thirdparty/zTree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>thirdparty/zTree/js/jquery.ztree.core-3.5.js"></script>			
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" background="<%=basePath %>dwcms_sys/images/main_40.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="19%">&nbsp;</td>
        <td width="81%" height="20"><span class="STYLE1">管理菜单</span></td>
      </tr>
    </table>
    </td>
  </tr>
 <tr>
        <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="23" background="<%=basePath %>dwcms_sys/images/main_47.gif" id="imgmenu2" class="menu_title" onmouseover="this.className='menu_title2';" onclick='showsubmenu(2);' onmouseout="this.className='menu_title';" style="cursor:hand">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="18%">&nbsp;</td>
                  <td width="82%" class="STYLE1">模版管理</td>
                </tr>
            </table></td>
          </tr>
          
          
          <tr>
            <td background="<%=basePath %>dwcms_sys/images/main_51.gif" style="z-index:100"  id="submenu2"><div class="sec_menu" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                
          <tr>
          	<td background="<%=basePath %>dwcms_sys/images/main_51.gif" style="z-index:100" id="submenu1"><div class="sec_menu" >
          		<table width="100%" border="0" cellspacing="0" cellpadding="0">
          			<tr align="center" height="20px;">
          				<td class="STYLE3">
          					<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
          					<a href="#" class="STYLE3" onclick="window.location=location;">刷新</a>&nbsp;
          					</table>
          				</td >
          				
          			</tr>
          		</table>
          		</div>
          	</td>
          </tr>
                
                  <tr >
                    <td style="z-index:100;"><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0" >
					<ul id="treeDemo" class="ztree" style="overflow:auto;"></ul>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="5"><img src="<%=basePath %>dwcms_sys/images/main_52.gif" width="151" height="5" /></td>
                  </tr>
                </table>
            </div></td>
          </tr>
        </table>          </td>
 </tr>
  
    </table></td>
  </tr>
  <tr>
    <td height="18" background="<%=basePath %>dwcms_sys/images/main_58.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="18" valign="bottom"><div align="center" class="STYLE3">版本：2013 V1.0</div></td>
      </tr>
    </table></td>
  </tr>
</table>
<script type="text/javascript">
	var setting = {
		callback: {
			onClick: onClick
		}
	};
	function onClick(e, treeId, treeNode){
		window.parent.I2.location="<%=basePath%>/admin/core/template/v_list.do?root="+treeNode.pId+"&filename="+treeNode.id+"";
	}
	var zNodes ={};
	$.ajax({            
	    type:"get",   
	    dataType:"json", 
	    async:false,
	    url:"<%=basePath%>admin/core/template/v_ztree.do?tmplPath=/t/cms/www",
	    error:function(request) {                
	        alert("数据加载出错:"+request);
	    },
	    success:function(data) {
	    	zNodes=data;
	    	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	    }            
	});


function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
imgmenu = eval("imgmenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
imgmenu.background="<%=basePath %>dwcms_sys/images/main_47.gif";
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
imgmenu.background="<%=basePath %>dwcms_sys/images/main_48.gif";
}
}

</script>