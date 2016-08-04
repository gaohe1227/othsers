package net.zz.data.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.zz.data.model.BaseUnit;
import net.zz.data.service.BaseUnitService;
import net.zz.utils.base.service.impl.BaseServiceImpl;
import net.zz.utils.base.vo.Tree;

import org.springframework.stereotype.Service;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月25日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@Service
public class BaseUnitServiceImpl extends BaseServiceImpl<BaseUnit> implements
		BaseUnitService {

	@Override
	public List<Tree> findUnits() {
		List<BaseUnit> units = find();
		List<Tree> trees = new ArrayList<Tree>();
		Tree tree = null;
		for (BaseUnit unit : units) {
			if (null == unit.getParentId()) {
				tree = new Tree();
				tree.setId(unit.getId());
				tree.setText(unit.getName());
				tree.setState("open");
				trees.add(tree);
				recursionMenu(units, tree);
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
	private void recursionMenu(List<BaseUnit> units, Tree rootNode) {
		Tree tree = null;
		List<Tree> children = new ArrayList<Tree>();
		for (BaseUnit unit : units) {
			if (rootNode.getId().equals(unit.getParentId())) {
				tree = new Tree();
				tree.setId(unit.getId());
				tree.setText(unit.getName());
				tree.setState("open");
				children.add(tree);
				recursionMenu(units, tree); // 递归调用获取树的所有子节点
			}
		}
		rootNode.setChildren(children);
	}

	@Override
	public Serializable save(BaseUnit o) {
		BaseUnit parentUnit = getById(o.getParentUnit().getId());
		if (null == parentUnit) {
			o.setParentUnit(null);
		}
		return super.save(o);
	}

	@Override
	public void update(BaseUnit o) {
		BaseUnit parentUnit = getById(o.getParentUnit().getId());
		if (null == parentUnit) {
			o.setParentUnit(null);
		}
		super.update(o);
	}
	
	
}
