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
import com.doadway.dwcms.core.content.biz.ContentBiz;
import com.doadway.dwcms.core.content.dao.ContentTagRelateMapper;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/config/dwcms-servlet-admin.xml" })
public class ContentBizTest {
	  @Resource
	  private ContentBiz contentBiz;
	  @Resource
	  private ContentTagRelateMapper tagRelateDAO;
	  
	  @Test
	  public void testFindContentByPage(){
		  Page page = new Page();
		  page.setCurrentPage(1);
		  page.setShowCount(20);
		  page.setEntityOrField(true);
		  Map<String,Object> params=new HashMap<String,Object>();
		  params.put("title", "%寒潮天气%");
		  List<ContentDTO> contentDtoList= contentBiz.findContentByPage(page,params);
		  System.out.println("标题:"+contentDtoList.get(0).getTitle());
		  contentBiz.findContentByPage(page,params);
		  Assert.notNull(contentDtoList.size());
	  }
	  @Test
	  public void testFindContentCache(){
		  testFindContentByPage();
	  }	  
//	  @Test
	  public void testCountDocs(){
		  int docs=tagRelateDAO.countDocNumbersByTagId(9);
		  Assert.isTrue(docs==2);
	  }
	  
}
