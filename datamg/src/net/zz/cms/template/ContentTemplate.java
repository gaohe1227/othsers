package net.zz.cms.template;

import java.util.List;

import net.zz.cms.model.ContentInfo;

/**
 * 内容页模板
 * 
 * @author Dong
 *
 */
public class ContentTemplate extends AbstractTemplate {
	
	private List<ContentInfo> data;
	
	public List<ContentInfo> getData() {
		return data;
	}

	public void setData(List<ContentInfo> data) {
		this.data = data;
	}
}
