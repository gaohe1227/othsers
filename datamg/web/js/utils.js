var easyui = {};
/**
 * easyui show提示框
 */
easyui.show = function(msg,title){
	$.messager.show({
		title:undefined!=title?title:"提示",
		msg:msg,
		timeout:3000,
		showType:'slide',
		style:{
			right:'',
			top:document.body.scrollTop+document.documentElement.scrollTop,
			bottom:''
		}
	}); 
};
/**
 * easyui window对话框
 */
easyui.window = function(options){
	var opts = $.extend({
		width : 700,
		height : 450,
		modal : true,
		iconCls:'icon-edit', //默认编辑图标
		autoVCenter: true,
        autoHCenter: true,
        maximizable: true,
        minimizable: true,
        autoRestore: true,
        autoDestroy: true,
        collapsible: true,
        resizable: true,
        enableCloseButton: true,
        topMost: false,
		onClose : function() {
			$(this).window('destroy');
		}
	}, options);
	opts.modal = true;// 强制此window为模式化，无视传递过来的modal参数
	return $('<div/>').window(opts);
};
/**
 * 处理ajax数据加载失败的提示
 * easyui-form
 * easyui-combobox
 * easyui-combotree
 * easyui-combogrid
 * easyui-datagrid
 * easyui-tree
 * easyui-treegrid
 * jQuery ajax
 */
easyui.ajaxError = function (callback) {
    $.fn.form.defaults.onLoadError = callback;
    $.fn.combobox.defaults.onLoadError = callback;
    $.fn.combotree.defaults.onLoadError = callback;
    $.fn.combogrid.defaults.onLoadError = callback;
    $.fn.datagrid.defaults.onLoadError = callback;
    $.fn.tree.defaults.onLoadError = callback;
    $.fn.treegrid.defaults.onLoadError = callback;
    $.ajaxSetup({ error: callback });
};
var onLoadError = function(XMLHttpRequest, textStatus, errorThrown) {
	var msg = "系统出现了一个未指明的错误，如果该问题重复出现，请联系您的系统管理员并反馈该故障。";
	if(XMLHttpRequest && $.trim(XMLHttpRequest.responseText).length>0){
		msg = "如果该问题重复出现，请联系您的系统管理员并反馈该故障。<br />" +
        "错误号：" + XMLHttpRequest.status + "(" + XMLHttpRequest.statusText + ")；<hr />" + XMLHttpRequest.responseText;
	}
    $.messager.alert("错误提醒", msg, "error");
};
easyui.ajaxError(onLoadError);


/**
 * treegrid 展开节点的公共方法
 * @param treeGrid
 */
easyui.treeGridUndoFun = function(treeGrid){
	var node = treeGrid.treegrid('getSelected');
	if (node) {
		treeGrid.treegrid('expandAll', node.id);
	} else {
		treeGrid.treegrid('expandAll');
	}
};
/**
 * treegrid 折叠节点的公共方法
 * @param treeGrid
 */
easyui.treeGridRedoFun =function (treeGrid){
	var node = treeGrid.treegrid('getSelected');
	if (node) {
		treeGrid.treegrid('collapseAll', node.id);
	} else {
		treeGrid.treegrid('collapseAll');
	}
};
/**
 * 序列化搜索条件(input)的值
 * 
 */
easyui.serializeObject = function(targetId){
	var search={};
	$("#"+targetId).find("input").each(function(){
		if (this['value'] != undefined && this['value'].length > 0) {// 如果值非空，才封装对象
			if (search[this['name']]) {
				search[this['name']] = search[this['name']] + "," + this['value'];
			} else {
				search[this['name']] = this['value'];
			}
		}
	});
	return search;
};
/**
 * 返回当前时间以及星期
 */
easyui.currDate = function(showWeek){
	var now = new Date();
    var month = (((now.getMonth() + 1) < 10) ? "0" : "") + (now.getMonth() + 1);
    var date = ((now.getDate() < 10) ? "0" : "") + now.getDate();
    var hour = (now.getHours()<10?"0":"")+now.getHours();
    var min = (now.getMinutes()<10?"0":"")+now.getMinutes();
    var sec = (now.getSeconds()<10?"0":"")+now.getSeconds();
    var dateNow = now.getFullYear() + "-" + month + "-" + date + " "+hour+":"+min+":"+sec;
	if (showWeek) {
		var Week = [ '日', '一', '二', '三', '四', '五', '六' ];
		dateNow += ' 星期' + Week[now.getDay()];
	}
	return dateNow;
};
/**
 * 根据图片名称返回图片路径
 * 作用:行后面的修改|删除图标
 * iconName:add|edit|delete
 */
easyui.getIcon = function(contextPath,iconName){
	if('add'==iconName){
		return contextPath+"/js/easyui/themes/icons/note_add.png";
	}else if('edit'==iconName){
		return contextPath+"/js/easyui/themes/icons/note_edit.png";
	}else if('delete'==iconName){
		return contextPath+"/js/easyui/themes/icons/note_delete.png";
	}else{
		return contextPath+"/js/easyui/themes/icons/note.png";
	}
};
/**
 * 增加formatString功能
 * @example easyui.formatString('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
 * @returns 格式化后的字符串
 */
easyui.formatString = function(str) {
	for (var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
};
/**
 * 超过长度字符串显示"..."
 * @param value 字符串
 * @param len 显示字符串长度
 */
easyui.divTooltip = function(value, len) {
	if (!len)
		len = 17;
	if (!value)
		return "";
	var abValue = "";
	if (value.length >= len) {
		abValue = value.substring(0, len - 3) + "...";
	} else {
		return value;
	}
	var content = "<div style='color:blue' title='" + value + "' class='easyui-tooltip'>" + abValue + "</div>";
	return content;
};