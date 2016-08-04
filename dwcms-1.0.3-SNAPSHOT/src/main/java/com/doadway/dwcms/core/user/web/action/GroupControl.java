package com.doadway.dwcms.core.user.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.user.biz.GroupBiz;
import com.doadway.dwcms.core.user.biz.LogBiz;
import com.doadway.dwcms.core.user.pojo.Group;

@Controller
@RequestMapping("/admin/core/member/group")
public class GroupControl {
	@Resource
	LogBiz logBiz;		
	@Resource
	private GroupBiz groupBiz;
	Group group =new Group();
	@RequestMapping("v_edit")
	public String findGroup(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("groupId")!=null?Integer.parseInt(request.getParameter("groupId")):1;
		group=groupBiz.findGroupById(id);
		model.put("group", group);
		return "group/group_edit";
	}
	
	@RequestMapping("o_save")
	public String saveGroup(HttpServletRequest request,Group newGroup,Map<String, Object> model){
		boolean flag =false;

		if(newGroup.getGroupId()!=null&&!"".equals(newGroup.getGroupId())){
			flag = groupBiz.saveOrUpdateGroup(newGroup);
			model.put("group", newGroup);
			model.put("status",flag);
			logBiz.operating(request, "修改用户组", "id="+newGroup.getGroupId()+";groupname="+newGroup.getGroupName());
		}else{
			flag = groupBiz.saveOrUpdateGroup(newGroup);
			model.put("status",flag);
			logBiz.operating(request, "添加用户组", "id="+newGroup.getGroupId()+";groupname="+newGroup.getGroupName());
			return "redirect:/admin/core/member/group/v_add.do";
		}
		return "group/group_edit";
	}
	
	@RequestMapping("v_list")
	public String findAllGroup(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		model.put("groupList", groupBiz.findAllGroup());
		return "group/group_list";
	}
	
	@RequestMapping("v_add")
	public String showAddUser(Map<String, Object> model){
		return "group/group_edit";
	}
	
	@RequestMapping("o_del")
	public String delUser(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		groupBiz.batchDeleteGroup(ids);
		return "redirect:/admin/core/member/group/v_list.do";
		
		
	}
	@RequestMapping("o_priority")
	public String savePrioritys(HttpServletRequest request, Map<String, Object> model){
		String[] wids = request.getParameterValues("wids");
		String[] prioritys = request.getParameterValues("priority");
		
		String 	 regDef = request.getParameter("isRegDef");
		boolean sFlag=groupBiz.setupDefaultGroup(Integer.parseInt(regDef));
		
		
		boolean flag = groupBiz.savePriority(wids, prioritys);
		if(sFlag&&flag){
			model.put("status",flag);
		}
		return "redirect:/admin/core/member/group/v_list.do";
	}	
}
