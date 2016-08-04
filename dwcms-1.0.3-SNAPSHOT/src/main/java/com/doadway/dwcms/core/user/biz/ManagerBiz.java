package com.doadway.dwcms.core.user.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.user.pojo.UserRoleKey;
import com.doadway.dwcms.core.user.pojo.dto.ManagerDTO;

public interface ManagerBiz {
	public boolean saveOrUpdateManager(ManagerDTO managerDto);
	
	public boolean batchDeleteManagerByIds(String[] ids);
	
	public ManagerDTO findManagerById(Integer id);
	
	public List<ManagerDTO> findManagerByPage(Page page,Map<String,Object> params);
	
	public List<UserRoleKey> findAllUserRoleByUserId(Integer userId);
	
	public int findMaxId();
}
