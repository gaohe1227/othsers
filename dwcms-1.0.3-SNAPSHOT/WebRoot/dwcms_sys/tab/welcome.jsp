<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎页面</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>

<script>
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[系统中心]-[欢迎页面]</td>
              </tr>
            </table></td>
            <td width="54%"></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="18%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">系统环境信息</span></div></td>
            <td width="23%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">内容</span></div></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">操作系统名称:</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">windows xp </span></div></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">系统版本号:</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">1.2.0</span></div></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">Java安装路径:</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">C:\program\</span></div></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">Java环境版本:</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">1.2.1</span></div></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">Tomcat根目录:</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">D:tomcat\5.2.1\cmsdoadway</span></div></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">数据库版本信息:</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">mySql 5.0</span></div></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">信息管理系统版本编号:</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">企业内容信息管理系统1.0版</span></div></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">作者:</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">多维矩阵</span></div></td>
            </tr>
          <tr>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">联系方式:</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">邮箱:zhoutanxin@hotmail.com.Tel：010-52466853</span></div></td>
            </tr>
        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
