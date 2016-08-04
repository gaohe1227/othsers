package net.zz.data.action;

import net.zz.data.model.BaseUser;
import net.zz.data.service.BaseUserService;
import net.zz.utils.base.action.BaseAction;

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
@Namespace("/data")
@Action(value="baseUserAction")
public class BaseUserAction extends BaseAction<BaseUser> {
	/**
	 * 设置注入service
	 * comment here
	 * @param service
	 * @since datamg 1.0
	 */
	@Autowired
	public void setService(BaseUserService service){
		this.service = service;
		this.serviceName = "机构用户管理";
	}
}
