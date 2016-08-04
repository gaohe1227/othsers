<%@ include file="/res/common/jsp/jsp_defined.jsp"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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
.STYLE2 {font-size: 9px}
.STYLE3 {
	color: #033d61;
	font-size: 12px;
}
-->
</style></head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" http-equiv="Content-Type" content="text/html; charset=utf-8">
  <tr>
    <td height="70" background="<%=basePath %>/dwcms_sys/images/main_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="270" height="24" background="<%=basePath %>/dwcms_sys/images/main_03.gif">&nbsp;</td>
            <td width="505" background="<%=basePath %>/dwcms_sys/images/main_04.gif">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="21"><img src="<%=basePath %>/dwcms_sys/images/main_07.gif" width="21" height="24"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="270" height="38" background="<%=basePath %>dwcms_sys/images/main_09.gif">&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="77%" height="25" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="50" height="19"><div align="center"><img src="<%=basePath %>/dwcms_sys/images/main_12.gif" onclick="window.parent.mainFrame.I.I2.location='<%=basePath %>admin/welcome.do';"  width="49" height="19"></div></td>
                    <td width="50"><div align="center"><img src="<%=basePath %>/dwcms_sys/images/main_14.gif" onclick="window.history.go(-1);" width="48" height="19"></div></td>
                    <td width="50"><div align="center"><img src="<%=basePath %>/dwcms_sys/images/main_16.gif" onclick="window.history.go(-1);" width="48" height="19"></div></td>
                    <td width="50"><div align="center"><img src="<%=basePath %>/dwcms_sys/images/main_18.gif" onclick="window.parent.mainFrame.I.I2.location=window.parent.mainFrame.I.I2.location;" width="48" height="19"></div></td>
                    <td width="50"><div align="center"><img src="<%=basePath %>/dwcms_sys/images/main_20.gif" onclick="window.parent.location='<%=basePath %>admin/loginout.do'" width="48" height="19"></div></td>
                    <td width="26"><div align="center"><img src="<%=basePath %>/dwcms_sys/images/main_21.gif" width="26" height="19"></div></td>
                    <td width="100"><div align="center"><img src="<%=basePath %>/dwcms_sys/images/main_22.gif" onclick="window.parent.mainFrame.I.I2.location='<%=basePath %>admin/profile.do';" width="98" height="19"></div></td>
                    <td>&nbsp;</td>
                  </tr>
                </table></td>
                <td width="220" valign="bottom"  nowrap="nowrap"><div align="right"><span class="STYLE1"><span class="STYLE2">■</span> 今天是：20087年5月12日 星期一</span></div></td>
              </tr>
            </table></td>
            <td width="21"><img src="<%=basePath %>dwcms_sys/images/main_11.gif" width="21" height="38"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="8" style=" line-height:8px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="270" background="<%=basePath %>dwcms_sys/images/main_29.gif" style=" line-height:8px;">&nbsp;</td>
            <td width="505" background="<%=basePath %>dwcms_sys/images/main_30.gif" style=" line-height:8px;">&nbsp;</td>
            <td style=" line-height:8px;">&nbsp;</td>
            <td width="21" style=" line-height:8px;"><img src="<%=basePath %>dwcms_sys/images/main_31.gif" width="21" height="8"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="28" background="<%=basePath %>dwcms_sys/images/main_36.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="177" height="28" background="<%=basePath %>dwcms_sys/images/main_32.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="20%"  height="22">&nbsp;</td>
            <td width="59%" valign="bottom"><div align="center" class="STYLE1">用户:<shiro:principal/></div></td>
            <td width="21%">&nbsp;</td>
          </tr>
        </table></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<c:forEach items="${rootMenu}" var="menu" begin="0">
            <td width="65" height="28"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="23" valign="bottom"><table width="58" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td height="20" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath %>dwcms_sys/images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"> <div align="center" class="STYLE3">
									<c:choose>
										<c:when test="${menu.useType=='JS'}">
											<a href="#" class="STYLE3" style="text-decoration:none;" onclick="window.parent.mainFrame.I.I1.location='<%=basePath %>admin/core/functiontree/create_sub_menu.do?id=${menu.id}';">${menu.name }</a>
										</c:when>
										<c:when test="${menu.useType=='JSP'}">
											<a href="#" class="STYLE3" style="text-decoration:none;" onclick="window.parent.mainFrame.I.I1.location='<%=basePath %>${menu.content }';">${menu.name }</a>
										</c:when>										
										<c:otherwise>
											${menu.name }
										</c:otherwise>
									</c:choose>	
							</div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
            <td width="3"><img src="<%=basePath %>dwcms_sys/images/main_34.gif" width="3" height="28"></td>
            </c:forEach>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td width="21"><img src="<%=basePath %>dwcms_sys/images/main_37.gif" width="21" height="28"></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
