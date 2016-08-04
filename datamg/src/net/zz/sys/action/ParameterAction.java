package net.zz.sys.action;

import net.zz.sys.model.Parameter;
import net.zz.sys.service.ParameterService;
import net.zz.utils.JSONUtils;
import net.zz.utils.StringUtils;
import net.zz.utils.base.action.BaseAction;
import net.zz.utils.filter.HqlFilter;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月31日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@SuppressWarnings("serial")
@Namespace("/sys")
@Action(value="parameterAction")
public class ParameterAction extends BaseAction<Parameter> {
		
	/**
	 * 
	 * comment here
	 * @param service
	 * @since datamg 1.0
	 */
	@Autowired
	public void setService(ParameterService service){
		this.service = service;
		this.serviceName = "系统参数管理";
	}
	
	/**
	 * 没有权限控制的下拉树
	 */
	public void doNotSecurityComboTree(){
		ParameterService service = (ParameterService)this.service;
		WriteJSON(JSONUtils.ObjectToJson(service.findParameters()));
	}
	
	/**
	 * 根据父节点code来查询可选项
	 * comment here
	 * @since datamg 1.0
	 */
	public void doNotSecurityComboBox(){
		HqlFilter hqlFilter = new HqlFilter();
		if(!StringUtils.isEmpty(id)){
			hqlFilter.addFilter("QUERY_t#parentParameter.code_S_EQ", id);
		}
		WriteJSON(JSONUtils.ObjectToJson(service.findByFilter(hqlFilter)));
	}
}
