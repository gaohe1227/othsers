package net.zz.sys.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.zz.sys.model.LoginUser;
import net.zz.sys.model.Menu;
import net.zz.sys.service.MenuService;
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
 * 
 * @author ZhangZhen
 * @version 1.0
 * 
 * @since datamg 1.0
 */
@Service
public class MenuServiceImpl extends BaseServiceImpl<Menu> implements
		MenuService {
	
	@Autowired
	private BaseDaoI<LoginUser> userDao;

	@Override
	public List<Tree> findMenus(String userId, String parentId) {
		List<Menu> menus = null;
		if(null!=userId){ //加载非超级管理员用户
			if (StringUtils.isEmpty(parentId)) {
				menus = find("select m from Menu m join m.roles r join r.users u where u.id = :userId and m.type = 1 and m.parentMenu.id is null order by m.sort asc","userId",userId);
			} else {
				menus = find("select m from Menu m join m.roles r join r.users u where u.id = :userId and m.parentMenu.id = :parentId and m.type = 1 order by m.sort asc",new String[]{"userId","parentId"}, new Object[]{userId,parentId});
			}
		}else{
			if (StringUtils.isEmpty(parentId)) {
				menus = find("from Menu where type = 1 and parentMenu.id is null order by sort asc");
			} else {
				menus = find("from Menu where type =1 and parentMenu.id = :parentId order by sort asc","parentId", parentId);
			}
		}
		List<Tree> treeList = new ArrayList<Tree>();
		Tree tree = null;
		for (Menu menu : menus) {
			tree = new Tree();
			tree.setId(menu.getId());
			tree.setText(menu.getName());
			if (null != menu.getParentMenu()) {
				tree.setPid(menu.getParentMenu().getId());
			} else {
				tree.setPid(null);
			}
			tree.setState(menu.getIsleaf() ? "open" : "closed");
			if(menu.getIsleaf()){
				Map<String,String> attr = new HashMap<String, String>();
				attr.put("href", menu.getHref());
				attr.put("skipType", menu.getSkipType());
				tree.setAttributes(attr);
			}
			treeList.add(tree);
		}
		return treeList;
	}

	@Override
	public List<Tree> findMenus() {
		List<Menu> menus = super.find("from Menu where type = 1");
		List<Tree> trees = new ArrayList<Tree>();
		Tree tree = null;
		for (Menu menu : menus) {
			if (null == menu.getParentId()) {
				tree = new Tree();
				tree.setId(menu.getId());
				tree.setText(menu.getName());
				tree.setState("open");
				trees.add(tree);
				recursionMenu(menus, tree,null);
			}
		}
		return trees;
	}
	
	/**
	 * 递归获取所有树节点
	 * 
	 * @param menus
	 * @param rootTree
	 */
	private void recursionMenu(List<Menu> menus, Tree rootTree,Set<Menu> alreadyMenus) {
		Tree tree = null;
		List<Tree> children = new ArrayList<Tree>();
		for (Menu menu : menus) {
			if (rootTree.getId().equals(menu.getParentId())) {
				tree = new Tree();
				tree.setId(menu.getId());
				tree.setText(menu.getName());
				tree.setState("open");
				tree.setChecked(this.isCheck(alreadyMenus, menu.getId()));
				children.add(tree);
				recursionMenu(menus, tree,alreadyMenus); // 递归调用获取树的所有子节点
			}
		}
		rootTree.setChildren(children);
	}

	@Override
	public Serializable save(Menu o) {
		Menu parentMenu = getById(o.getParentMenu().getId());
		if (null == parentMenu) {
			o.setParentMenu(null);
		}
		return super.save(o);
	}

	@Override
	public List<Tree> findPrivileges(String userId) {
			LoginUser user = userDao.getById(LoginUser.class, userId);
			Set<Menu> menus = user.getMenus();
			List<Menu> roleMenus = find("select m from Menu m join m.roles r join r.users u where u.id = :userId","userId", userId);
			Set<Menu> privileges = new HashSet<Menu>();
			for (Menu menu : roleMenus) {
				if (menu.getIsleaf()) { // 是导航菜单节点
					privileges.addAll(menu.getSubMenus());
				}
			}
			roleMenus.addAll(privileges); // 加载该角色可选的所有权限节点
			List<Tree> trees = new ArrayList<Tree>();
			Tree tree = null;
			for (Menu menu : roleMenus) {
				if (null == menu.getParentId()) {
					tree = new Tree();
					tree.setId(menu.getId());
					tree.setText(menu.getName());
					tree.setState("open");
					trees.add(tree);
					recursionMenu(roleMenus, tree,menus);
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
				if (menuId.equals(menu.getId())) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public void savePrivileges(String userId, String[] menuIds) {
		LoginUser user = userDao.getById(LoginUser.class, userId);
		user.setMenus(null);  //清空权限分配
		if(null!=menuIds&&menuIds.length>0){
			Menu menu = null;
			Set<Menu> privileges = new HashSet<Menu>();
			for(String menuId:menuIds){
				menu = getById(menuId);
				privileges.add(menu);
			}
			user.setMenus(privileges);
		}
		userDao.update(user); //更新用户
	}

	@Override
	public List<Tree> findMenuAndPrivilege(String userId) {
		List<Menu> menus = null;
		if(null!=userId){
			String hql = "select m from Menu m join roles r join r.users ur join m.users up where ur.id = :userId or up.id = :userId1"; //所有菜单
			menus = find(hql, new String[]{"userId","userId1"}, new Object[]{userId,userId});
		}else{
			menus = find();
		}
		List<Tree> trees = new ArrayList<Tree>();
		Tree tree = null;
		for (Menu menu : menus) {
			if (null == menu.getParentId()) {
				tree = new Tree();
				tree.setId(menu.getId());
				tree.setText(menu.getName());
				tree.setState("open");
				trees.add(tree);
				recursionMenu(menus, tree,null);
			}
		}
		return trees;
	}

}
