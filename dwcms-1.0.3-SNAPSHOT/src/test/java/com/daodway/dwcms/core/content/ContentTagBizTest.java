package com.daodway.dwcms.core.content;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.content.biz.TagBiz;
import com.doadway.dwcms.core.content.pojo.ContentTag;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/config/dwcms-servlet-admin.xml" })
public class ContentTagBizTest {
	  @Resource
	  private TagBiz tagBiz;
	  
	  @Test
	  public void testFindRootFuncationTree(){
		  Page page = new Page();
		  page.setCurrentPage(1);
		  page.setShowCount(20);
		  page.setEntityOrField(true);
		  Map<String,Object> params=new HashMap<String,Object>();
		  params.put("tagName", "%机构%");
		  List<ContentTag> contentTagList= tagBiz.findContentTagByPage(page, params);
		  System.out.println("文档数:"+contentTagList.get(0).getRefCounter());
		  Assert.notNull(contentTagList.size());
	  }
	  
}
