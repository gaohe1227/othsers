<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<script type="text/javascript" charset="utf-8" src="../kindeditor.js"></script>
	<script type="text/javascript">
		KE.show({
			id : 'content1',
			imageUploadJson : '../../jsp/upload_json.jsp',
			fileManagerJson : '../../jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function(id) {
				KE.event.ctrl(document, 13, function() {
					KE.util.setData(id);
					document.forms['example'].submit();
				});
				KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
					KE.util.setData(id);
					document.forms['example'].submit();
				});
			}
		});
	</script>
</head>
<body>
	<%=htmlData%>
	<form name="example" method="post" action="demo.jsp">
		<textarea id="content1" name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
		<br />
		<input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)
	</form>
</body>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}

private String htmlTotxt(String str){
		  str = str.replaceAll("<a[^>]*>/i","");   
		  str = str.replaceAll("<\\a>(?i)",""); 
		  str = str.replaceAll("<div[^>]*>(?i)","");   
		  str = str.replaceAll("</div>(?i)","");
		  str = str.replaceAll("<font[^>]*>(?i)","");   
		  str = str.replaceAll("</font>(?i)","");
		  str = str.replaceAll("<p[^>]*>(?i)","");   
		  str = str.replaceAll("</p>(?i)","");
		  str = str.replaceAll("<span[^>]*>(?i)","");   
		  str = str.replaceAll("</span>(?i)","");
		  str = str.replaceAll("<?xml[^>]*>(?i)","");
		  str = str.replaceAll("</?xml>(?i)","");
		  str = str.replaceAll("<o:p[^>]*>(?i)","");
		  str = str.replaceAll("</o:p>(?i)","");
		  str = str.replaceAll("<u[^>]*>(?i)","");
		  str = str.replaceAll("</u>(?i)","");
		  str = str.replaceAll("<b[^>]*>(?i)","");
		  str = str.replaceAll("</b>(?i)",""); 
		  str = str.replaceAll("<meta[^>]*>(?i)","");
		  str = str.replaceAll("</meta>(?i)","");
		  str = str.replaceAll("<!--[^>]*-->(?i)","");//注释内容  
		  str = str.replaceAll("<p[^>]*-->(?i)","");//注释内容       
		  str = str.replaceAll("style=.+?['|\"](?i)","");//去除样式   
		  str = str.replaceAll("class=.+?['|\"](?i)","");//去除样式   
		  str = str.replaceAll("(?i)d=.+?['|\"](?i)","");//去除样式      
		  str = str.replaceAll("/lang=.+?['|\"](?i)","");//去除样式       
		  str = str.replaceAll("/width=.+?['|\"](?i)","");//去除样式    
		  str = str.replaceAll("/height=.+?['|\"](?i)","");//去除样式    
		  str = str.replaceAll("/border=.+?['|\"](?i)","");//去除样式    
		  str = str.replaceAll("/face=.+?['|\"](?i)","");//去除样式 
		  str = str.replaceAll("/face=.+?['|\"]/","");
		  str = str.replaceAll("/face=.+?['|\"]/","");
		  str = str.replaceAll( "&nbsp;","");
		     return str;
		}	
%>
