<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<shiro:notAuthenticated>
	<script type="text/javascript">
		top.location="<%=basePath%>/login.do";
	</script>
</shiro:notAuthenticated>
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
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/thirdparty/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/thirdparty/jquery-easyui/themes/icon.css">
	<script type="text/javascript" src="<%=basePath %>/thirdparty/jquery-easyui/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/thirdparty/jquery-easyui/jquery.easyui.min.js"></script>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" background="<%=basePath %>dwcms_sys/images/main_40.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="19%">&nbsp;</td>
        <td width="81%" height="20"><span class="STYLE1">管理菜单</span></td>
      </tr>
    </table></td>
  </tr>
  <c:forEach items="${subMenu}" var="menu" begin="0">
  <tr>
    <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="23" background="<%=basePath %>dwcms_sys/images/main_47.gif" id="imgmenu1" class="menu_title" onMouseOver="this.className='menu_title2';" onClick="showsubmenu(1)" onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="18%">&nbsp;</td>
                <td width="82%" class="STYLE1">${menu.menu.name}</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td background="<%=basePath %>dwcms_sys/images/main_51.gif" id="submenu1">
			 <div class="sec_menu" >  
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                <c:forEach items="${menu.menuItems}" begin="0" var="menuItem">
                  <tr>
                    <td width="16%" height="25"><div align="center"><img src="<%=basePath %>dwcms_sys/images/left.gif" width="10" height="10" /></div></td>
                    <td width="84%" height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="20" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" onclick="window.parent.I2.location='<%=basePath %>${menuItem.content}';">${menuItem.name}</span></td>
                        </tr>
                    </table></td>
                  </tr>
                </c:forEach>  
                 
                </table></td>
              </tr>
              <tr>
                <td height="5"><img src="<%=basePath %>dwcms_sys/images/main_52.gif" width="151" height="5" /></td>
              </tr>
            </table></div></td>
          </tr>
        </table></td>
      </tr>
 </c:forEach>    
  <!--  
 <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="23" background="<%=basePath %>dwcms_sys/images/main_47.gif" id="imgmenu2" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(2)" onmouseout="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="18%">&nbsp;</td>
                  <td width="82%" class="STYLE1">系统管理</td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td background="<%=basePath %>dwcms_sys/images/main_51.gif" style="z-index:100"  id="submenu2"><div class="sec_menu" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
					<ul id="tt"  class="easyui-tree"  url="<%=basePath %>admin/core/functiontree/createtree.do" />
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
  -->
  
    </table></td>
  </tr>
  <tr>
    <td height="18" background="<%=basePath %>dwcms_sys/images/main_58.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="18" valign="bottom"><div align="center" class="STYLE3">版本：2008V1.0</div></td>
      </tr>
    </table></td>
  </tr>
</table>
<script>




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