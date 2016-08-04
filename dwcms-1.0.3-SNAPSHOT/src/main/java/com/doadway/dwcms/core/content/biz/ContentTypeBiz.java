package com.doadway.dwcms.core.content.biz;

import java.util.List;

import com.doadway.dwcms.core.content.pojo.ContentType;

public interface ContentTypeBiz {
	public List<ContentType> findAllContentType();
	public boolean saveContentType(ContentType ContentType);
	public boolean deleteContentTypeById(Integer id);
	public boolean updateContentType(ContentType contentType);
	public boolean batchDeleteContentTypeByIds(String ids[]);
	public ContentType findContentTypeById(Integer id);
	public Integer findMaxId();
}
