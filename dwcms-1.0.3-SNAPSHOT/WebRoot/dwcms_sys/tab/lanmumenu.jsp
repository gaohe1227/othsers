﻿<%@ page language="java"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[业务中心]-[我的邮件]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                      <input type="checkbox" name="checkbox62" value="checkbox" />
                    </div></td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">新增</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/33.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">修改</div></td>
                  </tr>
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/11.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">删除</div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
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
        <td>&nbsp;
<div style="margin-left:50px; line-height:20px;">
		<div algin='center' style='padding:0px;margin:0px;margin-left:0px;' onclick='show(menu1)'>+首页<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu1' style='padding:0px;margin:0px;margin-left:5px;'><div algin='center' style='padding:0px;margin:0px;margin-left:5px;' onclick='show(menu61)'>+专家团队<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu61' style='padding:0px;margin:0px;margin-left:10px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-中高级验房师<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-助理验房师<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-师资级验房师<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div><div algin='center' style='padding:0px;margin:0px;margin-left:5px;' onclick='show(menu74)'>+认识我们<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu74' style='padding:0px;margin:0px;margin-left:10px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-资质证书<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-公司背景<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-公司大事记<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-企业文化<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div><div algin='center' style='padding:0px;margin:0px;margin-left:5px;' onclick='show(menu79)'>+验房百科<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu79' style='padding:0px;margin:0px;margin-left:10px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-维权知识<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-政策法规<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' style='padding:0px;margin:0px;margin-left:10px;' onclick='show(menu84)'>+验房知识<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu84' style='padding:0px;margin:0px;margin-left:15px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:15px;'>-tes<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-购房知识<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-装修知识<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-标准规范<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div><div algin='center' style='padding:0px;margin:0px;margin-left:5px;' onclick='show(menu65)'>+客服中心<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu65' style='padding:0px;margin:0px;margin-left:10px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-在线留言<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-法律维权<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-加盟答疑<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-投诉建议<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-查看答疑<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-验房答疑<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-下载专区<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div><div algin='center' style='padding:0px;margin:0px;margin-left:5px;' onclick='show(menu28)'>+品牌加盟<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu28' style='padding:0px;margin:0px;margin-left:10px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-加盟申请<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-加盟介绍<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-分支机构<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-品牌优势<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div><div algin='center' style='padding:0px;margin:0px;margin-left:5px;' onclick='show(menu32)'>+资讯中心<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu32' style='padding:0px;margin:0px;margin-left:10px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-品牌资讯<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-精彩推荐<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-行业动态<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div><div algin='center' style='padding:0px;margin:0px;margin-left:5px;' onclick='show(menu22)'>+大客户委托<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu22' style='padding:0px;margin:0px;margin-left:10px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-分户验收<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-其他服务<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-验房内训<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-工具订购<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div><div algin='center'  style='margin:0px;padding:0px;margin-left:5px;'>-ttwefdsfa<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' style='padding:0px;margin:0px;margin-left:5px;' onclick='show(menu18)'>+验房收楼<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu18' style='padding:0px;margin:0px;margin-left:10px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-验房项目<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-验房预约<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-验房收费<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-验房流程<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-验房百科<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-验房业绩<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-服务优势<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div><div algin='center' style='padding:0px;margin:0px;margin-left:5px;' onclick='show(menu55)'>+成功案例<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu55' style='padding:0px;margin:0px;margin-left:10px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-维权案例<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-培训案例<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-客户评价<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-大客户案例<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-验房案例<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div><div algin='center' style='padding:0px;margin:0px;margin-left:5px;' onclick='show(menu46)'>+培训认证<span   style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center' id='menu46' style='padding:0px;margin:0px;margin-left:10px;'><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-在线报名<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-课程体系<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-证书查询<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div><div algin='center'  style='margin:0px;padding:0px;margin-left:10px;'>-招生简章<span style='position:absolute;right:50px;'><a href='#'>编辑</a>|<a href='#'>查看栏目内容</a>|<a href='#'>删除</a></span></div></div></div>
</div>		
		</td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4"></td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"></td>
                  <td width="45"></td>
                  <td width="45"></td>
                  <td width="40"></td>
                  <td width="100"></td>
                  <td width="40"></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>