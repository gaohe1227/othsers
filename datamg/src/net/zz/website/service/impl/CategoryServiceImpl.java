package net.zz.website.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.zz.utils.base.service.impl.BaseServiceImpl;
import net.zz.utils.base.vo.Tree;
import net.zz.website.model.Category;
import net.zz.website.service.CategoryService;

import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends BaseServiceImpl<Category> implements
		CategoryService {

	@Override
	public List<Tree> findCategroy() {
		List<Category> categorys = this.find("from Category");
		List<Tree> trees = new ArrayList<Tree>();
		Tree tree = null;
		for (Category category : categorys) {
			if (null == category.getParentId()) {
				tree = new Tree();
				tree.setId(category.getId());
				tree.setText(category.getName());
				tree.setState("open");
				trees.add(tree);
				recursionMenu(categorys, tree);
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
	private void recursionMenu(List<Category> categories, Tree rootTree) {
		Tree tree = null;
		List<Tree> children = new ArrayList<Tree>();
		for (Category category : categories) {
			if (rootTree.getId().equals(category.getParentId())) {
				tree = new Tree();
				tree.setId(category.getId());
				tree.setText(category.getName());
				tree.setState("open");
				children.add(tree);
				recursionMenu(categories, tree); // 递归调用获取树的所有子节点
			}
		}
		rootTree.setChildren(children);
	}

	@Override
	public Serializable save(Category o) {
		Category category = getById(o.getParentCategory().getId());
		if(null == category){
			o.setParentCategory(null);
		}
		return super.save(o);
	}

	
}
