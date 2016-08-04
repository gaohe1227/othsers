package com.doadway.dwcms.core.user.biz;

import java.util.List;

import com.doadway.dwcms.core.user.pojo.Group;

public interface GroupBiz {
	
	public boolean saveOrUpdateGroup(Group group);
	
	public boolean deleteGroup(Integer groupId);
	
	public boolean batchDeleteGroup(String[] groupIds);
	
	public boolean savePriority(String[] groupIds ,String[] prioritys);
	
	public boolean setupDefaultGroup(Integer groupId);
	
	public List<Group> findAllGroup();
	
	public Group  findGroupById(Integer groupId);
	
}
