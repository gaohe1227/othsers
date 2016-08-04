package com.daodway.dwcms.core.config;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.doadway.dwcms.core.config.biz.ModelBiz;
import com.doadway.dwcms.core.config.pojo.Model;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/config/dwcms-servlet-admin.xml" })
public class TestModel {
	  @Resource
	  private ModelBiz modelBiz;
	  
	  @Test
	  public void testFindRootFuncationTree(){
		  Model model = new Model();
		  model.setModelId(2);
		  model.setTitleImgHeight(230);
		  model.setTitleImgWidth(230);
		  model.setModelName("内容模型");
		  System.out.println("操作结果:"+modelBiz.saveModel(model));
	  }
	  
}
