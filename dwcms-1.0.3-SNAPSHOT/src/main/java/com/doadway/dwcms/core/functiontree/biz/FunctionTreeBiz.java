package com.doadway.dwcms.core.functiontree.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.functiontree.pojo.FunctionTree;

public interface FunctionTreeBiz {
	public static final String ROOT_ID = "-1";
	public List<FunctionTree> findRootFunctionTree();
	public List<FunctionTree> findFunctionTreeByParentId(String parentId);
	public FunctionTree findFunctionTreeById(String id);
	public boolean saveOrUpdateFunctionTree(FunctionTree functionTree);
	public boolean ifHaveChildren(String parentId);
	public List<Map<String,Object>> findChildren(String parentId);
	public List<FunctionTree> findFunctionTreeByPage(Page page);
	public List<FunctionTree> findSubFunctionTreeByParentId(String parentId);
}
