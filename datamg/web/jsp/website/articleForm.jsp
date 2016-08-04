<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>文章表单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>

	<body>
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="articleForm" class="form" method="post">
					<input type="hidden" name="data.id" value="<%=null!=request.getParameter("id")?request.getParameter("id"):"" %>"/>
					<input type="hidden" name="data.createTime">
					<input type="hidden" name="data.accUrl"/>
			    	<table class="table" width="100%">
			    		<tr>
			    			<th>文章标题:</th>
			    			<td><input class="easyui-validatebox" style="width: 220px;" type="text" name="data.title" data-options="required:true"></input></td>
			    		</tr>
			    		<tr>
			    			<th>文章分类:</th>
			    			<td>
			    				<input type="text" name="data.category.id" style="width: 220px;" class="easyui-combotree" data-options="url:'<%=contextPath %>/ws/categoryAction!doNotSecurityComboTree.do',method:'get',animate:true,lines:true,required:true">
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>文章作者:</th>
			    			<td><input class="easyui-validatebox" style="width: 220px;" type="text" name="data.author" data-options="required:true"></input></td>
			    		</tr>
			    		<tr>
			    			<th>文章类型</th>
			    			<td>
			    				<select name="data.type" class="easyui-combobox" style="width: 220px;">
			    					<option value="0">原创</option>
			    					<option value="1">转载</option>
			    				</select>
			    			</td>
			    		</tr>
			    		<tr>
			    			<th>文章内容:</th>
			    			<td>
			    				<textarea class="easyui-kindeditor" id="editor_id" style="width:800px;height:380px;" name="data.content"></textarea>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td>附件:</td>
			    			<td>
				    			<div id="container">
									<div id="filelist">您的浏览器没有安装Flash插件，或不支持HTML5！</div>
									<button id="pickfiles">选择文件</button>
								</div>
							</td>
			    		</tr>
			    	</table>
			    </form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" href="javascript:void(0)" onclick="javascript:submitForm();" style="width:80px">保存</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:cancelFun();" style="width:80px">取消</a>
			</div>
		</div>
		<script type="text/javascript">
			var uploader;
			$(function(){
				//修改初始化表单
				var id = $(":input[name='data.id']").val();
				if(id.length>0){
					$.messager.progress({
						text : '数据加载中....'
					});
					$.getJSON(easyui.contextPath+"/ws/articleAction!getById.do?id="+id,function(rs){
							// alert(rs);
							if(undefined != rs.id){
								$('#articleForm').form('load', {
									'data.id' : rs.id,
									'data.title' : rs.title,
									'data.category.id' : rs.category.id,
									'data.author':rs.author,
									'data.createTime':rs.createTime,
									'data.type':rs.type,
									'data.content':rs.content,
									'data.accUrl':rs.accUrl
								});
								KindEditor.html($("#editor_id"),rs.content);
								$.messager.progress('close');
							}
						});
				}
				//初始化上传组件
				uploader = new plupload.Uploader({//配置参数
					browse_button : 'pickfiles',//选择文件的按钮
					container : 'container',//文件上传容器
					runtimes : 'html5,flash',//设置运行环境，会按设置的顺序，可以选择的值有html5,gears,flash,silverlight,browserplus,html4
					flash_swf_url : '<%=contextPath%>/js/plupload-2.0.0/js/Moxie.swf',
					url : '<%=contextPath%>/plupload',//上传文件路径
					max_file_size : '30mb',//100b, 10kb, 10mb, 1gb
					chunk_size : '5mb',//分块大小，小于这个大小的不分块
					unique_names : true,//生成唯一文件名
					// 指定要浏览的文件类型
					filters : [ {
						title : '图片',
						extensions : 'jpg,gif,png'
					}, {
						title : '文件',
						extensions : 'zip,7z,rar'
					},{
						title:'文档',
						extensions : 'txt,pdf,doc,xls,docx,xlsx'
					} ]
				});
				uploader.bind('Init', function(up, params) {//初始化的时候
					$('#filelist').html("");
				});
				uploader.bind('BeforeUpload', function(uploader, file) {//上传之前
					$('.plupload_delete').hide();
				});
				uploader.bind('FilesAdded', function(up, files) {//选择文件后
					$.each(files, function(i, file) {
						$('#filelist').append('<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b>' + '&nbsp;<span onclick="uploader.removeFile(uploader.getFile($(this).parent().attr(\'id\')));$(this).parent().remove();" style="cursor: pointer;" class="plupload_delete">删除</span></div>');
					});
					up.refresh();
				});
				uploader.bind('UploadProgress', function(up, file) {//上传进度
					$('#' + file.id + " b").html(file.percent + "%");
				});
				uploader.bind('Error', function(up, err) {//出现错误
					$('#filelist').append("<div>Error: " + err.code + ", Message: " + err.message + (err.file ? ", File: " + err.file.name : "") + "</div>");
					up.refresh();
				});
				uploader.bind('FileUploaded', function(up, file, info) {//上传完毕
					$('#' + file.id + " b").html("100%(后台正在合并文件，请稍后....)");
					var rs = eval('('+info.response+")");
					if (rs.status) {
						var urls = $(":input[name='data.accUrl']").val();
						if(""!=urls){
							urls+="#"+rs.fileUrl;
						}else{
							urls=rs.fileUrl;
						}
						$(":input[name='data.accUrl']").val(urls);
					}
				});
				uploader.init();//初始化uploader
			});
			//关闭弹出页面
			var cancelFun = function(){
				window.parent.articleWindow.window('close');
			};
			//提交表单上传文件
			var submitForm = function(){
					if($("#articleForm").form('validate')){
						if (uploader.files.length > 0) {
							uploader.start();
							uploader.bind('UploadComplete',function(up,files){ 
								submitNow(); //附件上传完成提交表单
							}); 
						}else{
							submitNow(); //没有附件直接提交表单
						}
					}
				};
				var submitNow = function(){
					// alert($(":input[name='data.accUrl']").val());
					var url = easyui.contextPath+"/ws/articleAction!save.do";
					// alert($(":input[name='data.id']").val());
					if($(":input[name='data.id']").val().length>0){
						url = easyui.contextPath+"/ws/articleAction!update.do";
					}
					// alert(url);
					$("#articleForm").form('submit',{
							url:url,
							success:function(result){
								var rs = eval('(' + result + ')');  
								if(rs.success){
									window.parent.articleGrid.datagrid('reload');
									window.parent.articleWindow.window('close');
								}
								easyui.show(rs.msg);
							}
					});
				};
		</script>
	</body>
</html>
