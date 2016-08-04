package com.daodway.dwcms.core.util;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.doadway.common.util.DBConnection;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/config/dwcms-servlet-admin.xml" })
public class TestDB {
	  private DBConnection dbConnection =DBConnection.DB_CONNECTION;
	  
	  @Test
	  public void testExecute(){
		  dbConnection.showColumnsFromChannelTxt();
	  }
	  
}
