package com.doadway.dwcms.core.content.biz;

import java.util.Map;

import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;



/**
 * 内容修改监听器
 * 
 * @author zhoutanxin
 * 
 */
public interface ContentListener {
	/**
	 * 保存之前执行
	 * 
	 * @param content
	 */
	public void preSave(ContentDTO content);

	/**
	 * 保存之后执行
	 * 
	 * @param content
	 */
	public void afterSave(ContentDTO content);

	/**
	 * 修改之前执行
	 * 
	 * @param content
	 *            修改前的Content
	 * @return 获取一些需要在afterChange中使用的值。
	 */
	public Map<String, Object> preChange(ContentDTO content);

	/**
	 * 修改之后执行
	 * 
	 * @param content
	 *            修改后的Content
	 * @param map
	 *            从{@link #preChange(Content)}方法返回的值。
	 */
	public void afterChange(ContentDTO content, Map<String, Object> map);

	/**
	 * 删除之前执行
	 * 
	 * @param content
	 */
	public void preDelete(ContentDTO content);

	/**
	 * 删除之后执行
	 * 
	 * @param content
	 */
	public void afterDelete(ContentDTO content);
}
