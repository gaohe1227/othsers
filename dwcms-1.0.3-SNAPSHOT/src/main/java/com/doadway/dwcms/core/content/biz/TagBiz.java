package com.doadway.dwcms.core.content.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.content.pojo.ContentTag;

public interface TagBiz {
	public List<ContentTag> findContentTagByPage(Page page,Map<String, Object> params);
	public boolean saveOrUpdateContentTag(ContentTag contentTag);
	public boolean batchDeleteContentTag(String[] tagIds);
	public ContentTag findContentTagById(Integer tagId);
	public ContentTag findByTagName(String tagName);
}
