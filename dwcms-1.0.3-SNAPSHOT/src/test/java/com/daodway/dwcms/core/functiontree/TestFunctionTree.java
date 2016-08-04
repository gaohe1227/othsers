package com.daodway.dwcms.core.functiontree;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.functiontree.biz.FunctionTreeBiz;
import com.doadway.dwcms.core.functiontree.pojo.FunctionTree;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/config/dwcms-servlet-admin.xml" })
public class TestFunctionTree {
	  @Resource
	  private FunctionTreeBiz functionTreeBiz;
	  
//	  @Test
	  public void testFindRootFuncationTree(){
		  List<FunctionTree> functionTreeList =functionTreeBiz.findRootFunctionTree();
		  System.out.println("长度:"+functionTreeList.size());
		  System.out.println("根目录菜单:");
		  for(FunctionTree functionTree:functionTreeList){
			  System.out.println(functionTree.getName());
		  }
	  }

	  @Test
	  public void testFindFuncationTreeByPage(){
		  Page p = new Page();
		  p.setCurrentPage(1);
		  p.setShowCount(5);
		  p.setEntityOrField(true);
		  List<FunctionTree> list = functionTreeBiz.findFunctionTreeByPage(p);
		  for(FunctionTree fnTree:list){
			  System.out.println("名字:"+fnTree.getName());
		  }
		  System.out.println(p.getTotalPage());
	  }
//	  @Test
	  public void testFindTopLevelFunctionTreeByParentId(){
		  String parentId="ftree_dwcms_sys_index";
		  List<FunctionTree> functionTreeList =functionTreeBiz.findSubFunctionTreeByParentId(parentId);
		  System.out.println("级别为1的菜单:");
		  for(FunctionTree functionTree:functionTreeList){
			  System.out.println(functionTree.getName());
			  List<FunctionTree> fnTreeList =functionTreeBiz.findFunctionTreeByParentId(functionTree.getId());
			  System.out.println("\t级别为2的菜单:");
			  for(FunctionTree fnTree:fnTreeList){
				  System.out.println("\t\t"+fnTree.getName());
			  }
		  }
		  
	  }
//	  @Test
	  public void testFindFunctionTreeByParentId(){
		  String parentId="ftree_dwcms_sys_welcome_index";
		  List<FunctionTree> functionTreeList =functionTreeBiz.findFunctionTreeByParentId(parentId);
		  System.out.println("测试父级菜单:");
		  for(FunctionTree functionTree:functionTreeList){
			  System.out.println(functionTree.getName());
		  }
	  }
}
