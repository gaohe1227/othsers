package net.zz.sys.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import net.zz.sys.model.Log;
import net.zz.sys.service.LogService;
import net.zz.utils.base.action.BaseAction;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月23日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@SuppressWarnings("serial")
@Namespace("/sys")
@Action(value="logAction")
public class LogAction extends BaseAction<Log> {
	
	@Autowired
	public void setService(LogService service){
		this.service = service;
		this.serviceName = "日志管理";
	}
}
