package net.zz.cms.model;

import java.util.Date;

/**
 * 
 * @author Dong
 *
 */
public class ContentInfo {
	
	private String title;//标题
	
	private String secTitle;//副标题
	
	private String content;//正文
	
	private Date creatTime;//创建时间
	
	private String creater;//创建者
	
	private String formUrl;//原文链接
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSecTitle() {
		return secTitle;
	}

	public void setSecTitle(String secTitle) {
		this.secTitle = secTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getFormUrl() {
		return formUrl;
	}

	public void setFormUrl(String formUrl) {
		this.formUrl = formUrl;
	}
}
