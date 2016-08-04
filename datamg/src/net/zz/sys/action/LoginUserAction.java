package net.zz.sys.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.zz.sys.model.LoginUser;
import net.zz.sys.model.Menu;
import net.zz.sys.service.LoginUserService;
import net.zz.utils.JSONUtils;
import net.zz.utils.StringUtils;
import net.zz.utils.base.action.BaseAction;
import net.zz.utils.base.vo.Json;
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
 * <b>Creation Time:</b> 2014年5月11日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@SuppressWarnings("serial")
@Namespace("/sys")
@Action(value = "loginUserAction")
public class LoginUserAction extends BaseAction<LoginUser> {

	@Autowired
	public void setService(LoginUserService service) {
		this.service = service;
		this.serviceName = "登录用户管理";
	}

	/**
	 * 重置密码:123456
	 */
	public void resetPassword() {
		Json json = new Json();
		json.setMsg("重置密码失败!");
		if (null != this.id) {
			LoginUser t = service.getById(this.id);
			if(0!=t.getType()){
				t.setPassword(StringUtils.encodePassword("123456", "MD5"));
				service.update(t);
				json.setSuccess(true);
				json.setMsg("重置密码成功!");
			}else{
				json.setMsg("超级管理员密码不能重置!");
			}
		}
		this.addSysLog(Opt.重置登录密码, "ID:"+this.id);
		WriteJSON(JSONUtils.ObjectToJson(json));
	}
	
	/**
	 * 自己修改登录密码
	 * comment here
	 * @since datamg 1.0
	 */
	public void doNotSecurityPassword(){
		Json json = new Json();
		json.setMsg("修改密码失败!");
		if (null != this.data) {
			String userId = (String)getSession().getAttribute("userId");
			LoginUser t = service.getById(userId);
			t.setPassword(StringUtils.encodePassword(this.data.getPassword(), "MD5"));
			service.update(t);
			json.setMsg("修改密码成功!");
			json.setSuccess(true);
		}
		this.addSysLog(Opt.修改密码, json.getMsg());
		WriteJSON(JSONUtils.ObjectToJson(json));
	}
	
	/**
	 * 查看个人信息
	 * comment here
	 * @since datamg 1.0
	 */
	public void doNotSecurityInfomation(){
		String userId = (String)getSession().getAttribute("userId");
		if(!StringUtils.isEmpty(userId)){
			this.data = service.getById(userId);
			this.addSysLog(Opt.查询一条记录, "ID:"+userId);
			WriteJSON(JSONUtils.ObjectToJson(this.data));
		}else{
			Json json = new Json();
			json.setMsg("用户ID不可为空!");
			this.addSysLog(Opt.查询一条记录, "ID:"+json.getMsg());
			WriteJSON(JSONUtils.ObjectToJson(json));
		}
	}

	@Override
	public void save() {
		Json json = new Json();
		json.setMsg("新建用户失败!");
		if(null!=this.data){
			HqlFilter hqlFilter = new HqlFilter();
			hqlFilter.addFilter("QUERY_t#loginName_S_EQ", data.getLoginName());
			if(service.countByFilter(hqlFilter)==0){
				Integer type =Integer.parseInt(this.getSession().getAttribute("type").toString());
				if(0==type){//超级管理员无权限验证添加用户
					this.service.save(this.data);
					json.setSuccess(true);
					json.setMsg("新建用户成功!");
				}else{
					if(0!=this.data.getType()){
						this.service.save(this.data);
						json.setSuccess(true);
						json.setMsg("新建用户成功!");
					}else{
						json.setMsg("超级管理员用户类型只有超级管理员才能添加");
					}
				}
			}else{
				json.setMsg("登录名["+data.getLoginName()+"]已经存在!");
			}
		}
		this.addSysLog(Opt.添加一条记录, json.getMsg());
		WriteJSON(JSONUtils.ObjectToJson(json));
	}

	@Override
	public void delete() {
		Json json = new Json();
		json.setMsg("删除失败!");
		if (!StringUtils.isEmpty(id)) {
			LoginUser t = service.getById(this.id);
			if(0!=t.getType()){
				service.delete(t);
				json.setSuccess(true);
				json.setMsg("删除成功!");
			}else{
				json.setMsg("超级管理员不能被删除!");
			}
		}
		this.addSysLog(Opt.删除一条记录, json.getMsg()+" ID:"+this.id);
		WriteJSON(JSONUtils.ObjectToJson(json));
	}

	@Override
	public void deleteAll() {
		Json json = new Json();
		json.setMsg("批量删除失败!");
		if (!StringUtils.isEmpty(ids)) {
			List<LoginUser> pos = new ArrayList<LoginUser>();
			for(String id:ids.split(",")){
				LoginUser t = service.getById(id);
				if(0!=t.getType()){
					pos.add(t);
				}
			}
			service.deleteBatch(pos);
			json.setSuccess(true);
			json.setMsg("批量删除成功!");
		}
		this.addSysLog(Opt.批量删除, json.getMsg()+" IDS:"+this.ids);
		WriteJSON(JSONUtils.ObjectToJson(json));
	}

	/**
	 * 用户登录
	 */
	public void doNotSecurityLogin() {
		Json json = new Json();
		json.setMsg("登录失败!");
		if (null != this.data) {
			HqlFilter hqlFilter = new HqlFilter();
			hqlFilter.addFilter("QUERY_t#loginName_S_EQ", this.data.getLoginName());
			//hqlFilter.addFilter("QUERY_t#password_S_EQ", StringUtils.encodePassword(this.data.getPassword(), "MD5"));
			List<LoginUser> loginUsers = service.findByFilter(hqlFilter);
			if(null!=loginUsers&&loginUsers.size()>0){
				LoginUser loginUser = loginUsers.get(0);
				if(0 == loginUser.getType()){  //超级管理员则无条件登录
					this.initLoginUser(loginUser);
					json.setSuccess(true);
					json.setMsg("登录成功!");
				}else{
					if(!loginUser.getIsLock()){
						//初始化用户权限
						this.initLoginUser(loginUser);
						json.setSuccess(true);
						json.setMsg("登录成功!");
					}else{
						json.setMsg("用户已经被锁定,请与管理员关系!");
					}
				}
			}else{
				json.setMsg("用户名或者密码错误!");
			}
		}
		this.addSysLog(Opt.登录系统, json.getMsg());
		WriteJSON(JSONUtils.ObjectToJson(json));
	}
	
	/**
	 * 用户退出
	 * comment here
	 * @since datamg 1.0
	 */
	public void doNotSecurityLoginout(){
		Json json = new Json();
		json.setMsg("退出系统失败!");
		if(null!=getSession().getAttribute("userId")){
			json.setMsg("退出成功!");
			json.setSuccess(true);
			this.addSysLog(Opt.退出系统, json.getMsg());
			getSession().invalidate();
		}
		WriteJSON(JSONUtils.ObjectToJson(json));
	}
	
	/**
	 * 设置Session
	 * comment here
	 * @param user
	 * @since datamg 1.0
	 */
	private void initLoginUser(LoginUser user){
		//设置用户
		this.getSession().setAttribute("userId", user.getId()); //用户 ID
		this.getSession().setAttribute("loginName", user.getLoginName()); //登录名
		this.getSession().setAttribute("type", user.getType()); //用户类型
		//初始化用户权限
		if(null!=user.getType()&&0!=user.getType()){
			Iterator<Menu> iterator = user.getMenus().iterator();
			Map<String,String> privileges = new HashMap<String, String>();
			while(iterator.hasNext()){
				Menu menu = iterator.next();
				privileges.put(menu.getHref(), menu.getName());
			}
			this.getSession().setAttribute("privileges", privileges);
		}
	}
}
