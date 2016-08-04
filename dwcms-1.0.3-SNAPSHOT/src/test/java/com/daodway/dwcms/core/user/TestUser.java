package com.daodway.dwcms.core.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.user.biz.RoleBiz;
import com.doadway.dwcms.core.user.biz.UserBiz;
import com.doadway.dwcms.core.user.pojo.dto.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/config/dwcms-servlet-admin.xml" })
public class TestUser {
	  @Resource
	  private UserBiz userBiz;
	  @Resource
	  private RoleBiz roleBiz;
	  
//	  @Test
	  public void testExecute(){
		Page p = new Page();
		p.setCurrentPage(1);
		p.setShowCount(5);
		p.setEntityOrField(true);
		Integer isAdmin=1;
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("isAdmin", isAdmin);
		params.put("loginCount", 0);
		List<UserDTO> userDtolist =userBiz.findUserByPage(p,params);
		System.out.println("查询出来的长度:"+userDtolist.get(0).getUsername());
	  }
	  @Test
	  public void testFindByName(){
		  UserDTO userDto =userBiz.findUserByUserName("admin");
		  System.out.println("查询出来的密码:"+userDto.getPassword());
		  userBiz.findUserById(1);
	  }
	  
//	  @Test
	  public void testRole(){
		  List<String> perms=roleBiz.getPermissionByRoleId(4);
		  for(String s:perms){
			  System.out.println(s);
		  }
	  }
	  
}
