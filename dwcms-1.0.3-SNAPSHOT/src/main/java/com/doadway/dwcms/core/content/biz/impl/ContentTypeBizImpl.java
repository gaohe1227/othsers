package com.doadway.dwcms.core.content.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.content.biz.ContentTypeBiz;
import com.doadway.dwcms.core.content.dao.ContentTypeMapper;
import com.doadway.dwcms.core.content.pojo.ContentType;
import com.doadway.dwcms.core.content.pojo.ContentTypeExample;
@Service
public class ContentTypeBizImpl implements ContentTypeBiz {
	@Resource
	private ContentTypeMapper contentTypeDAO;
	public boolean batchDeleteContentTypeByIds(String[] ids) {
		// TODO Auto-generated method stub
		Integer flag = 0;
		for(String id:ids){
			this.deleteContentTypeById(Integer.parseInt(id));
			flag++;
		}
		if(flag==ids.length-1){
			return true;
		}
		return false;
	}

	public boolean deleteContentTypeById(Integer id) {
		// TODO Auto-generated method stub
		return contentTypeDAO.deleteByPrimaryKey(id)>0;
	}

	public List<ContentType> findAllContentType() {
		// TODO Auto-generated method stub
		ContentTypeExample example =new ContentTypeExample();
		example.createCriteria().andTypeIdIsNotNull();
		return contentTypeDAO.selectByExample(example);
	}

	public boolean saveContentType(ContentType ContentType) {
		// TODO Auto-generated method stub
		return contentTypeDAO.insert(ContentType)>0;
	}

	public boolean updateContentType(ContentType contentType) {
		// TODO Auto-generated method stub
		return contentTypeDAO.updateByPrimaryKey(contentType)>0;
	}

	public ContentType findContentTypeById(Integer id) {
		// TODO Auto-generated method stub
		return contentTypeDAO.selectByPrimaryKey(id);
	}

	public Integer findMaxId() {
		// TODO Auto-generated method stub
		return contentTypeDAO.selectMaxId();
	}

}
