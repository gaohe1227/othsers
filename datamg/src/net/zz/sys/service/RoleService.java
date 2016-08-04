package net.zz.sys.service;

import java.util.List;

import net.zz.sys.model.Role;
import net.zz.utils.base.service.BaseServiceI;
import net.zz.utils.base.vo.Tree;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月11日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
public interface RoleService extends BaseServiceI<Role> {

	/**
	 * 设置角色菜单
	 * @param roleId
	 * @param menuIds
	 */
	public void saveRoleMenu(String roleId,String[] menuIds);
	
	/**
	 * 根据角色ID加载树并且选中
	 * @param roleId
	 */
	public List<Tree> findRoleMenu(String roleId);
}
