package com.doadway.dwcms.core.functiontree.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.functiontree.biz.FunctionTreeBiz;
import com.doadway.dwcms.core.functiontree.pojo.FunctionTree;

@Controller
@RequestMapping("/admin/core/functiontree")
public class FunctionTreeControl {
	@Resource
	private FunctionTreeBiz functionTreeBiz;
	@RequestMapping(value = "/createtree")
	public void createTree(HttpServletRequest request,
			HttpServletResponse response) {
		String parentId = request.getParameter("parentId") != null
				&& !"".equals(request.getParameter("parentId")) ? request
				.getParameter("parentId") : "-1";
		JSONArray jsonObject = new JSONArray();
		jsonObject = JSONArray.fromObject(functionTreeBiz.findChildren(parentId));
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/create_main_menu")
	public String createRootMenu(Map<String, Object> model){
		List<FunctionTree> functionTreeList =functionTreeBiz.findRootFunctionTree();
		model.put("rootMenu", functionTreeList);
		return "top";
	}
	@RequestMapping(value="/create_sub_menu")
	public String createSubMenu(HttpServletRequest request,Map<String, Object> model){
		String parentId =request.getParameter("id");
		List<Map<String,Object>> menuItemList = new ArrayList<Map<String,Object>>();
		
		List<FunctionTree> functionTreeList =functionTreeBiz.findSubFunctionTreeByParentId(parentId);
		for(FunctionTree functionTree:functionTreeList){
			Map<String,Object> menuItem = new HashMap<String,Object>();
			menuItem.put("menu", functionTree);
			menuItem.put("menuItems",functionTreeBiz.findFunctionTreeByParentId(functionTree.getId()));
			menuItemList.add(menuItem);
		}
		model.put("subMenu", menuItemList);		
		return "left";
	}
	
}
