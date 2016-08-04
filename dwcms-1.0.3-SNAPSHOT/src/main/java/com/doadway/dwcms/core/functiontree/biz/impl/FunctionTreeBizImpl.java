package com.doadway.dwcms.core.functiontree.biz.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.functiontree.biz.FunctionTreeBiz;
import com.doadway.dwcms.core.functiontree.dao.FunctionTreeMapper;
import com.doadway.dwcms.core.functiontree.pojo.FunctionTree;
import com.doadway.dwcms.core.functiontree.pojo.FunctionTreeExample;
import com.doadway.dwcms.core.functiontree.pojo.FunctionTreeExample.Criteria;
@Service
public class FunctionTreeBizImpl implements FunctionTreeBiz {
	@Resource
	private FunctionTreeMapper functionTreeDAO;
	
	public List<FunctionTree> findRootFunctionTree() {
		// TODO Auto-generated method stub
		List<FunctionTree> funcationTreeList = new ArrayList<FunctionTree>();
		FunctionTreeExample funcationTreeExample =new FunctionTreeExample();
		Criteria funcTreeCri=funcationTreeExample.createCriteria();
		funcTreeCri.andParentIdEqualTo(FunctionTreeBiz.ROOT_ID);
		funcationTreeExample.setOrderByClause("CURRENT_INDEX");
		funcationTreeList =functionTreeDAO.selectByExample(funcationTreeExample);
		return funcationTreeList;
	}
	public FunctionTree findFunctionTreeById(String id) {
		// TODO Auto-generated method stub
		return functionTreeDAO.selectByPrimaryKey(id);
	}
	public List<FunctionTree> findFunctionTreeByParentId(String parentId) {
		// TODO Auto-generated method stub
		List<FunctionTree> funcationTreeList = new ArrayList<FunctionTree>();
		FunctionTreeExample funcationTreeExample =new FunctionTreeExample();
		Criteria funcTreeCri=funcationTreeExample.createCriteria();
		funcTreeCri.andParentIdEqualTo(parentId);
		funcationTreeExample.setOrderByClause("CURRENT_INDEX");
		funcationTreeList =functionTreeDAO.selectByExample(funcationTreeExample);
		return funcationTreeList;
	}
	
	public boolean ifHaveChildren(String parentId) {
		// TODO Auto-generated method stub
		List<FunctionTree> funcationTreeList = new ArrayList<FunctionTree>();
		FunctionTreeExample funcationTreeExample =new FunctionTreeExample();
		Criteria funcTreeCri=funcationTreeExample.createCriteria();
		funcTreeCri.andParentIdEqualTo(parentId);
		funcationTreeList =functionTreeDAO.selectByExample(funcationTreeExample);
		return funcationTreeList.size()>0?true:false;
	}
	public boolean saveOrUpdateFunctionTree(FunctionTree functionTree) {
		// TODO Auto-generated method stub
		if(functionTree.getId()!=null&&!"".equals(functionTree.getId())){
			int flag = functionTreeDAO.updateByPrimaryKey(functionTree);
			if(flag>0){
				return true;
			}
		}else{
			//默认保存到根菜单;
			functionTree.setId("-1");
			int flag = functionTreeDAO.insert(functionTree);
			if(flag>0){
				return true;
			}
		}
		return false;
	}
	public List<Map<String, Object>> findChildren(String parentId) {
		List<FunctionTree> list = this.findFunctionTreeByParentId(parentId);
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		for(FunctionTree functionTree:list){
			Map<String,Object> node = new HashMap<String,Object>();
			node.put("id", functionTree.getId());
			node.put("text", functionTree.getName());
			node.put("state", this.ifHaveChildren(functionTree.getId())?"closed":"open");
			if(this.ifHaveChildren(functionTree.getId())){
				node.put("children", findChildren(functionTree.getId()));
			}
			result.add(node);
		}
		
		return result;
	}
	
	public List<FunctionTree> findFunctionTreeByPage(Page page) {
		// TODO Auto-generated method stub
		return functionTreeDAO.selectFunctionTreeByPage(page);
	}
	public List<FunctionTree> findSubFunctionTreeByParentId(String parentId) {
		List<FunctionTree> funcationTreeList = new ArrayList<FunctionTree>();
		FunctionTreeExample funcationTreeExample =new FunctionTreeExample();
		Criteria funcTreeCri=funcationTreeExample.createCriteria();
		funcTreeCri.andParentIdEqualTo(parentId);
		funcTreeCri.andLevelEqualTo(1);
		funcationTreeExample.setOrderByClause("CURRENT_INDEX");
		funcationTreeList =functionTreeDAO.selectByExample(funcationTreeExample);
		return funcationTreeList;
	}

	
	
}
