package net.zz.cms.action;

import net.zz.cms.service.ICmsService;
import net.zz.utils.base.action.BaseAction;
import net.zz.website.model.Article;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

@SuppressWarnings("serial")
@Namespace("/cms")
@Action(value = "cmsAction")
public class CMSAction extends BaseAction<Article> {

	@Autowired
	public void setService(ICmsService service){
		this.service= service;
		this.serviceName = "内容管理";
	}
}
