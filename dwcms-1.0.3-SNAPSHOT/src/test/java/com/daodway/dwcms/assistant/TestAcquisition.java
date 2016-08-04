package com.daodway.dwcms.assistant;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.doadway.dwcms.assistant.dao.AcquisitionMapper;
import com.doadway.dwcms.assistant.pojo.Acquisition;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/config/dwcms-servlet-admin.xml" })
public class TestAcquisition {
	  @Resource
	  private AcquisitionMapper acquisitionDAO;
	  
	  @Test
	  public void testFindAcquisitionById(){
		  Acquisition acq=acquisitionDAO.selectByPrimaryKey(1);
		  Assert.assertNotNull(acq);
		  
	  }

	  
}
