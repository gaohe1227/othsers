package com.doadway.dwcms.core.user.web.action;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.user.biz.LogBiz;
import com.doadway.dwcms.core.user.biz.RoleBiz;
import com.doadway.dwcms.core.user.pojo.Role;

@Controller
@RequestMapping("/admin/core/member/role")
public class RoleControl {
	@Resource
	LogBiz logBiz;		
	@Resource
	private RoleBiz roleBiz;
	Role role =new Role();
	@RequestMapping("v_edit")
	public String findRole(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("roleId")!=null?Integer.parseInt(request.getParameter("roleId")):1;
		role=roleBiz.findRoleById(id);
		model.put("role", role);
		return "role/role_edit";
	}
	
	@RequestMapping("o_save")
	public String saveRole(HttpServletRequest request,Role newRole,Map<String, Object> model){
		boolean flag =false;
		String[] perms =request.getParameterValues("perms");
		if(newRole.getRoleId()!=null&&!"".equals(newRole.getRoleId())){
			flag = roleBiz.saveOrUpdateRole(newRole,perms);
			model.put("role", newRole);
			model.put("status",flag);
			logBiz.operating(request, "修改角色", "id="+newRole.getRoleId()+";rolename="+newRole.getRoleName());			
			return "role/role_edit";
		}else{
			flag = roleBiz.saveOrUpdateRole(newRole,perms);
			model.put("status",flag);
			logBiz.operating(request, "添加角色", "id="+newRole.getRoleId()+";rolename="+newRole.getRoleName());	
			return "redirect:/admin/core/member/role/v_add.do";
		}
		
	}
	
	@RequestMapping("v_list")
	public String findAllRole(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		model.put("roleList", roleBiz.findAllRole());
		return "role/role_list";
	}
	
	@RequestMapping("v_add")
	public String showAddRole(Map<String, Object> model){
		return "role/role_edit";
	}
	
	@RequestMapping("o_del")
	public String delRole(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		roleBiz.batchDeleteRoleByIds(ids);
		return "redirect:/admin/core/member/role/v_list.do";
	}
	
	@RequestMapping(value = "/o_perm")
	public void findPerm(HttpServletRequest request,
			HttpServletResponse response) {
		String roleId = request.getParameter("roleId") != null
				&& !"".equals(request.getParameter("roleId")) ? request
				.getParameter("roleId") : "-1";
		JSONArray jsonObject = new JSONArray();
		jsonObject = JSONArray.fromObject(roleBiz.getPermissionByRoleId(Integer.parseInt(roleId)));
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
