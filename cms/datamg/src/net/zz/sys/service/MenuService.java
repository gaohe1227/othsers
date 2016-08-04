package net.zz.sys.service;

import java.util.List;

import net.zz.sys.model.Menu;
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
public interface MenuService extends BaseServiceI<Menu> {

	/**
	 * 根据用户ID和菜单ID异步加载左边导航菜单
	 * @param userId
	 * @return
	 */
	public List<Tree> findMenus(String userId,String parentId);
	
	/**
	 * 获取菜单的下拉树
	 * @return
	 */
	public List<Tree> findMenus();
	
	/**
	 * 通过用户ID获取权限分配树菜单
	 * comment here
	 * @param userId
	 * @return
	 * @since datamg 1.0
	 */
	public List<Tree> findPrivileges(String userId); 
	
	/**
	 * 查询某个用户的菜单和权限
	 * comment here
	 * @param userId
	 * @return
	 * @since datamg 1.0
	 */
	public List<Tree> findMenuAndPrivilege(String userId);
	
	/**
	 * 保存权限分配
	 * comment here
	 * @param userId
	 * @param menuIds
	 * @since datamg 1.0
	 */
	public void savePrivileges(String userId,String[] menuIds);
}
