package net.zz.website.service;

import java.util.List;


import net.zz.utils.base.service.BaseServiceI;
import net.zz.utils.base.vo.Tree;
import net.zz.website.model.Category;

public interface CategoryService extends BaseServiceI<Category> {
	
	/**
	 * 获取所有分类
	 * @return
	 */
	public List<Tree> findCategroy();
}
