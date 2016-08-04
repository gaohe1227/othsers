package com.doadway.dwcms.core.user.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.user.pojo.dto.UserDTO;

public interface UserBiz {
	public boolean saveOrUpdateUser(UserDTO userDto);
	public boolean deleteUserById(Integer id);
	public boolean batchDeleteUserByIds(String[] ids);
	public UserDTO findUserById(Integer id);
	public UserDTO findUserByUserName(String userName);
	public List<UserDTO> findUserByPage(Page page,Map<String,Object> params);
	public int findMaxId();
}
