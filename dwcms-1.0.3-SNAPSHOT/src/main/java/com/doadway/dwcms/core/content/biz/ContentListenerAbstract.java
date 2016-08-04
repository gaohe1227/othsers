package com.doadway.dwcms.core.content.biz;

import java.util.Map;

import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;


/**
 * ContentListener的抽象实现
 * 
 * @author zhoutanxin
 * 
 */
public class ContentListenerAbstract implements ContentListener {
	public void afterChange(ContentDTO content, Map<String, Object> map) {
	}

	public void afterDelete(ContentDTO content) {
	}

	public void afterSave(ContentDTO content) {
	}

	public Map<String, Object> preChange(ContentDTO content) {
		return null;
	}

	public void preDelete(ContentDTO content) {
	}

	public void preSave(ContentDTO content) {
	}
}
