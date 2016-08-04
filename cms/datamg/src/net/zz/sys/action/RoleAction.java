package net.zz.sys.action;

import java.util.List;

import net.zz.sys.model.Role;
import net.zz.sys.service.RoleService;
import net.zz.utils.JSONUtils;
import net.zz.utils.StringUtils;
import net.zz.utils.base.action.BaseAction;
import net.zz.utils.base.vo.Json;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月11日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@SuppressWarnings("serial")
@Namespace("/sys")
@Action(value="roleAction")
public class RoleAction extends BaseAction<Role> {
	
	@Autowired
	public void setService(RoleService service){
		this.service =service;
		this.serviceName = "角色管理";
	}
	
	/**
	 * 保存角色菜单
	 */
	public void setRoleMenus(){
		Json json = new Json();
		json.setMsg("设置角色菜单失败!");
		if(!StringUtils.isEmpty(this.id) && !StringUtils.isEmpty(this.ids)){
			RoleService service = (RoleService)this.service;
			service.saveRoleMenu(this.id, this.ids.split(","));
			json.setSuccess(true);
			json.setMsg("设置角色菜单成功!");
		}
		this.addSysLog(Opt.角色授权, json.getMsg()+"ID:"+this.id);
		WriteJSON(JSONUtils.ObjectToJson(json));
	}
	
	/**
	 * 获取带checkbox的Tree
	 */
	public void doNotSecurityCheckboxTree(){
		RoleService roleService = (RoleService)this.service;
		WriteJSON(JSONUtils.ObjectToJson(roleService.findRoleMenu(this.id)));
	}
	
	/**
	 * 生成角色的下拉
	 */
	public void doNotSecurityCombobox(){
		List<Role> roles = service.find();
		WriteJSON(JSONUtils.ObjectToJson(roles));
	}
}
