package net.zz.sys.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import net.zz.sys.model.Menu;
import net.zz.sys.model.Role;
import net.zz.sys.service.RoleService;
import net.zz.utils.StringUtils;
import net.zz.utils.base.dao.BaseDaoI;
import net.zz.utils.base.service.impl.BaseServiceImpl;
import net.zz.utils.base.vo.Tree;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements
		RoleService {
	@Autowired
	private BaseDaoI<Menu> menuDao = null;

	@Override
	public void saveRoleMenu(String roleId, String[] menuIds) {
		Role role = getById(roleId);
		Set<Menu> menus = new HashSet<Menu>();
		Menu menu = null;
		for (String menuId : menuIds) {
			menu = menuDao.getById(Menu.class, menuId);
			menus.add(menu);
		}
		role.setMenus(menus);
		super.update(role);
	}

	@Override
	public List<Tree> findRoleMenu(String roleId) {
		List<Menu> menus = menuDao.find("from Menu where type = 1");
		Set<Menu> roleMenus = null;
		if(!StringUtils.isEmpty(roleId)){
			Role role = getById(roleId);
			roleMenus = role.getMenus(); // 当前角色已经选中的菜单
		}
		List<Tree> trees = new ArrayList<Tree>();
		Tree tree = null;
		for (Menu menu : menus) {
			if (null == menu.getParentId()) {
				tree = new Tree();
				tree.setId(menu.getId());
				tree.setText(menu.getName());
				tree.setState("open");
				tree.setChecked(this.isCheck(roleMenus, menu.getId()));
				trees.add(tree);
				recursionMenu(menus, tree, roleMenus);
			}
		}
		return trees;
	}

	/**
	 * 判断节点是否选中
	 * 
	 * @param menus
	 * @param menuId
	 * @return
	 */
	private boolean isCheck(Set<Menu> menus, String menuId) {
		if (null != menus && menus.size() > 0) {
			Iterator<Menu> it = menus.iterator();
			while (it.hasNext()) {
				Menu menu = it.next();
				if (menuId.equals(menu.getId())&&menu.getIsleaf()) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 递归获取所有树节点
	 * 
	 * @param menus
	 * @param rootTree
	 */
	private void recursionMenu(List<Menu> menus, Tree rootTree,
			Set<Menu> roleMenus) {
		Tree tree = null;
		List<Tree> children = new ArrayList<Tree>();
		for (Menu menu : menus) {
			if (rootTree.getId().equals(menu.getParentId())) {
				tree = new Tree();
				tree.setId(menu.getId());
				tree.setText(menu.getName());
				tree.setState("open");
				tree.setChecked(this.isCheck(roleMenus, menu.getId()));
				children.add(tree);
				recursionMenu(menus, tree, roleMenus); // 递归调用获取树的所有子节点
			}
		}
		rootTree.setChildren(children);
	}
}
