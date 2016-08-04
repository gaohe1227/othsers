package com.doadway.dwcms.core.content.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.content.biz.TagBiz;
import com.doadway.dwcms.core.content.dao.ContentTagMapper;
import com.doadway.dwcms.core.content.dao.ContentTagRelateMapper;
import com.doadway.dwcms.core.content.pojo.ContentTag;
import com.doadway.dwcms.core.content.pojo.ContentTagExample;
import com.doadway.dwcms.core.content.pojo.ContentTagRelateExample;
@Service
public class TagBizImpl implements TagBiz {
	@Resource
	ContentTagMapper contentTagDAO;
	@Resource
	ContentTagRelateMapper contentTagRelateDAO;
	public boolean batchDeleteContentTag(String[] tagIds) {
		Integer flag = 0;
		for(String tId:tagIds){
			Integer tagId = Integer.parseInt(tId);
			
			ContentTagRelateExample tagRelateExample=new ContentTagRelateExample();
			ContentTagRelateExample.Criteria tagRelateCri=tagRelateExample.createCriteria();
			tagRelateCri.andTagIdEqualTo(tagId);	
			contentTagRelateDAO.deleteByExample(tagRelateExample);
			
			contentTagDAO.deleteByPrimaryKey(tagId);
			if(flag==tagIds.length){
				return true;
			}
			flag++;			
		}
		return false;
	}

	public List<ContentTag> findContentTagByPage(Page page,
			Map<String, Object> params) {
		return contentTagDAO.selectByPage(page, params);
	}
	
	public boolean saveOrUpdateContentTag(ContentTag contentTag) {
		boolean flag=false;
		if(contentTag.getTagId()!=null&&!"".equals(contentTag.getTagId())&&this.findByTagName(contentTag.getTagName())==null){
			contentTagDAO.updateByPrimaryKey(contentTag);
			flag=true;
		}else if(this.findByTagName(contentTag.getTagName())==null){
			contentTagDAO.insert(contentTag);
			flag=true;
		}
		return flag;
	}

	public ContentTag findContentTagById(Integer tagId) {
		return contentTagDAO.selectByPrimaryKey(tagId);
	}

	public ContentTag findByTagName(String tagName) {
		ContentTagExample example=new ContentTagExample();
		ContentTagExample.Criteria tagCri=example.createCriteria();
		tagCri.andTagNameEqualTo(tagName);
		if(contentTagDAO.selectByExample(example).size()>0){
			return contentTagDAO.selectByExample(example).get(0);
		}
		return null;
	}

}
