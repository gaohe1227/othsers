package net.zz.website.action;

import net.zz.utils.JSONUtils;
import net.zz.utils.base.action.BaseAction;
import net.zz.website.model.Category;
import net.zz.website.service.CategoryService;

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
@Namespace("/ws")
@Action(value="categoryAction")
public class CategoryAction extends BaseAction<Category> {
	
	@Autowired
	public void setService(CategoryService service){
		this.service = service;
		this.serviceName = "文章类型管理";
	}
	
	/**
	 * 没有权限控制的文章类型树菜单
	 * comment here
	 * @since datamg 1.0
	 */
	public void doNotSecurityComboTree(){
		CategoryService categoryService = (CategoryService)this.service;
		this.addSysLog(Opt.查询树列表, "查询分类的树列表!");
		WriteJSON(JSONUtils.ObjectToJson(categoryService.findCategroy()));
	}
}
