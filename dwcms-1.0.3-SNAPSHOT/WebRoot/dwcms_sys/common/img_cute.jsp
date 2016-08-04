<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include   file="/res/common/jsp/jsp_defined.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<title>图片裁剪</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${ctx }/thirdparty/jcrop/css/jquery.Jcrop.css" type="text/css" />
	<script src="${ctx }/thirdparty/jcrop/js/jquery.min.js"></script>
	<script src="${ctx }/thirdparty/jcrop/js/jquery.Jcrop.js"></script>
<script type="text/javascript"> 
        jQuery(function($){  
			var jcrop_api, boundx, boundy; 
            //使原图具有裁剪功能 
            $('#ferret').Jcrop({  
                onChange: updatePreview,  
                onSelect: updatePreview,  
                aspectRatio: 0 
            },
            function(){  
                // Use the API to get the real image size  
                var bounds = this.getBounds();  
                boundx = bounds[0];  
                boundy = bounds[1];  
                // Store the API in the jcrop_api variable  
                jcrop_api = this;  
                jcrop_api.setSelect([0,0,${param.zoomWidth},${param.zoomHeight}]);
                $('#oimgW').append(boundx); 
                $('#oimgH').append(boundy); 
                $('#ferret').css("width",boundx);
                $('#ferret').css("height",boundy);
                $('#ferretDiv').css("width",boundx);
                $('#ferretDiv').css("height",boundy);
            }); 
            //裁剪过程中，每改变裁剪大小执行该函数 
            function updatePreview(c){  
                if (parseInt(c.w) > 0){    
                    $('#minImg').css({  
                        //139 为预览div的宽和高  
                    	width: Math.round(139 / c.w * boundx) + 'px',
                        height: Math.round(139 / c.h * boundy) + 'px',  
                        marginLeft: '-' + Math.round(139 / c.w * c.x) + 'px',  
                        marginTop: '-' + Math.round(139 / c.h * c.y) + 'px'  
                    });  
                    $('#cutImageW').val(c.w);  //c.w 裁剪区域的宽  
                    $('#cutImageH').val(c.h); //c.h 裁剪区域的高  
                    $('#cutImageX').val(c.x);  //c.x 裁剪区域左上角顶点相对于图片左上角顶点的x坐标  
                    $('#cutImageY').val(c.y);  //c.y 裁剪区域顶点的y坐标 
                    $('#reMinWidth').val(c.w); 
                    $('#reMinHeight').val(c.h); 

                    
                }  
              };  
        });  
      </script>  
  </head>
  
<body style="margin: 3px auto; padding: 0px; font-size: 14px; width: 1200px;">
<div style="">
	<div id="ferretDiv" style="border:1px solid #333;margin-right:10px;float:left;">
		<img id="ferret" src="${ctx }${param.imgSrcPath }"  title="image select" alt="loading IMG ......">
	</div>
	<div style="float:left;">
		<div id="imgDiv" style="overflow:hidden;width:139px;height:139px;border:1px solid #333;">
			<img id="minImg" src="${ctx }${param.imgSrcPath }">
		</div>
		<form id="submitForm" action="cuteImage.do" target="hiddenIframe" method="post" style="margin:7px 0px 0px 0px;padding:0px">
			<input id="imgSrcPath" name="imgSrcPath" value="${param.imgSrcPath }" type="hidden">
			<input id="cutImageW" name="imgWidth" type="hidden">
			<input id="cutImageH" name="imgHeight" type="hidden">
			<input id="cutImageX" name="imgTop" type="hidden">
			<input id="cutImageY" name="imgLeft" type="hidden">
			<input id="imgScale" name="imgScale" value="1" type="hidden">
			<input name="uploadNum" value="1" type="hidden">
			<div style="margin-bottom:3px;">原图 &nbsp; &nbsp;
			宽: <span id="oimgW"></span> &nbsp; &nbsp; 
			高: <span id="oimgH"></span></div>
			缩略图 宽: <input name="reMinWidth" id="reMinWidth" value="${param.zoomWidth }" size="5" onkeypress="if(event.keyCode==13){$('#resetButton').click();return false;}"  type="text">
			高：<input name="reMinHeight" id="reMinHeight" value="${param.zoomHeight}" size="5" onkeypress="if(event.keyCode==13){$('#resetButton').click();return;}"  type="text">
			<div style="text-align:center;margin-top:7px;"><input value="确认裁剪" onclick="$('#submitForm').submit();window.close();" type="button"> <input value="关闭窗口" onclick="window.close();" type="button"></div>
		</form>
	</div>
	
</div>

  </body>
</html>
