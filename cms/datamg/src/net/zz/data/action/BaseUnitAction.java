package net.zz.data.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import net.zz.data.model.BaseUnit;
import net.zz.data.service.BaseUnitService;
import net.zz.utils.JSONUtils;
import net.zz.utils.base.action.BaseAction;

/***
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月25日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@SuppressWarnings("serial")
@Namespace("/data")
@Action(value="baseUnitAction")
public class BaseUnitAction extends BaseAction<BaseUnit> {
	
	/**
	 * 设置注入service
	 * comment here
	 * @param service
	 * @since datamg 1.0
	 */
	@Autowired
	public void setService(BaseUnitService service){
		this.service = service;
		this.serviceName = "机构管理";
	}
	
	/**
	 * 没有权限的机构树
	 * comment here
	 * @since datamg 1.0
	 */
	public void doNotSecurityTree(){
		BaseUnitService service = (BaseUnitService)this.service;
		WriteJSON(JSONUtils.ObjectToJson(service.findUnits()));
	}
}
