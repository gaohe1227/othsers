package net.zz.sys.action;

import java.util.List;

import net.zz.sys.model.Menu;
import net.zz.sys.service.MenuService;
import net.zz.utils.JSONUtils;
import net.zz.utils.StringUtils;
import net.zz.utils.base.action.BaseAction;
import net.zz.utils.base.vo.Json;
import net.zz.utils.base.vo.Tree;

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
@Action(value="menuAction")
public class MenuAction extends BaseAction<Menu> {

	@Autowired
	public void setService(MenuService service){
		this.service =service;
		this.serviceName = "菜单管理";
	}
	
	/**
	 * 异步加载左边导航树菜单
	 */
	public void doNotSecurityTreeMenu(){
		Integer type = Integer.parseInt(this.getSession().getAttribute("type").toString());
		MenuService menuService = (MenuService)this.service;
		if(0==type){
			WriteJSON(JSONUtils.ObjectToJson(menuService.findMenus(null, this.id)));
		}else{
			String userId = (String)this.getSession().getAttribute("userId");
			WriteJSON(JSONUtils.ObjectToJson(menuService.findMenus(userId, this.id)));
		}
	}
	
	/**
	 * 没有权限控制的下拉树
	 */
	public void doNotSecurityComboTree(){
		MenuService menuService = (MenuService)this.service;
		WriteJSON(JSONUtils.ObjectToJson(menuService.findMenus()));
	}
	
	/**
	 * 获取没有权限的Tree
	 * comment here
	 * @since datamg 1.0
	 */
	public void doNotSecurityPrivilegeTree(){
		MenuService menuService = (MenuService)this.service;
		WriteJSON(JSONUtils.ObjectToJson(menuService.findPrivileges(this.id)));
	}
	
	/**
	 * 查看我的信息显示菜单和权限
	 * comment here
	 * @since datamg 1.0
	 */
	public void doNotSecurityMenuAndPrivilegeTree(){
		List<Tree> tree = null; 
		String userId = (String)this.getSession().getAttribute("userId");
		if(null!=userId){
			Integer type = Integer.parseInt(this.getSession().getAttribute("type").toString());
			MenuService menuService = (MenuService)this.service;
			if(0==type){ //超级管理员系统所有权限
				tree = menuService.findMenuAndPrivilege(null);
			}else{
				tree = menuService.findMenuAndPrivilege(userId);
			}
		}
		this.addSysLog(Opt.查询树列表, "个人查看我的菜单和权限!ID:"+userId);
		WriteJSON(JSONUtils.ObjectToJson(tree));
	}
	
	/**
	 * 用户授权
	 * comment here
	 * @since datamg 1.0
	 */
	public void userGrant(){
		Json json = new Json();
		json.setMsg("用户授权失败!");
		if(!StringUtils.isEmpty(this.id)){
			MenuService menuService = (MenuService)this.service;
			if(!StringUtils.isEmpty(this.ids)){
				if(this.ids.indexOf(",")>-1){
					menuService.savePrivileges(this.id, this.ids.split(","));
				}else{
					menuService.savePrivileges(this.id, new String[]{this.ids});
				}
			}else{
				menuService.savePrivileges(this.id, null);
			}
			json.setSuccess(true);
			json.setMsg("用户授权成功!");
		}
		this.addSysLog(Opt.用户授权, json.getMsg()+"ID:"+this.id);
		WriteJSON(JSONUtils.ObjectToJson(json));
	}
}
