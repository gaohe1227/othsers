package net.zz.website.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import net.zz.utils.base.action.BaseAction;
import net.zz.website.model.Article;
import net.zz.website.service.ArticleService;

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
@Namespace("/ws")
@Action(value="articleAction")
@SuppressWarnings("serial")
public class ArticleAction extends BaseAction<Article> {
	
	@Autowired
	public void setService(ArticleService service){
		this.service= service;
		this.serviceName = "文章管理";
	}
}
