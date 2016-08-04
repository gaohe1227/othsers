package net.zz.sys.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.zz.sys.model.Parameter;
import net.zz.sys.service.ParameterService;
import net.zz.utils.base.service.impl.BaseServiceImpl;
import net.zz.utils.base.vo.Tree;

import org.springframework.stereotype.Service;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月31日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@Service
public class ParameterServiceImpl extends BaseServiceImpl<Parameter> implements
		ParameterService {

	@Override
	public Serializable save(Parameter o) {
		Parameter parentParameter = getById(o.getParentParameter().getId());
		if(null==parentParameter){
			o.setParentParameter(null);
		}
		return super.save(o);
	}

	@Override
	public void update(Parameter o) {
		Parameter parentParameter = getById(o.getParentParameter().getId());
		if(null==parentParameter){
			o.setParentParameter(null);
		}
		super.update(o);
	}

	@Override
	public List<Tree> findParameters(){
		List<Parameter> paramters = find();
		List<Tree> trees = new ArrayList<Tree>();
		Tree tree = null;
		for (Parameter paramter : paramters) {
			if (null == paramter.getParentId()) {
				tree = new Tree();
				tree.setId(paramter.getId());
				tree.setText(paramter.getName());
				tree.setState("open");
				trees.add(tree);
				recursionParameter(paramters, tree);
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
	private void recursionParameter(List<Parameter> parameters, Tree rootTree) {
		Tree tree = null;
		List<Tree> children = new ArrayList<Tree>();
		for (Parameter paramter : parameters) {
			if (rootTree.getId().equals(paramter.getParentId())) {
				tree = new Tree();
				tree.setId(paramter.getId());
				tree.setText(paramter.getName());
				tree.setState("open");
				children.add(tree);
				recursionParameter(parameters, tree); // 递归调用获取树的所有子节点
			}
		}
		rootTree.setChildren(children);
	}
}
