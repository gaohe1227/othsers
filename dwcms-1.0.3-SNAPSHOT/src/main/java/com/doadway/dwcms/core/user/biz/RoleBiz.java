package com.doadway.dwcms.core.user.biz;

import java.util.List;

import com.doadway.dwcms.core.user.pojo.Role;

public interface RoleBiz {
	public boolean saveOrUpdateRole(Role role,String[] perms);
	public boolean deleteRoleById(Integer id);
	public boolean batchDeleteRoleByIds(String[] ids);
	public Role findRoleById(Integer id);
	public List<Role> findAllRole();
	public List<String>   getPermissionByRoleId(Integer roleId);
}
