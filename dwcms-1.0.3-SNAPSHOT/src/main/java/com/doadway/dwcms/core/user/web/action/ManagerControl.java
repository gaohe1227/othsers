package com.doadway.dwcms.core.user.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.core.user.biz.LogBiz;
import com.doadway.dwcms.core.user.biz.ManagerBiz;
import com.doadway.dwcms.core.user.pojo.UserRoleKey;
import com.doadway.dwcms.core.user.pojo.dto.ManagerDTO;
@Controller
@RequestMapping("/admin/core/member/manager")
public class ManagerControl {
	@Resource
	LogBiz logBiz;		
	@Resource
	private ManagerBiz managerBiz;
	ManagerDTO managerDto =new ManagerDTO();
	@RequestMapping("v_edit")
	public String findManager(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("managerId")!=null?Integer.parseInt(request.getParameter("managerId")):1;
		managerDto=managerBiz.findManagerById(id);
		model.put("managerInfo", managerDto);
		return "member/manager_edit";
	}
	@RequestMapping("o_save")
	public String saveManager(HttpServletRequest request,ManagerDTO newManagerDto,Map<String, Object> model){
		boolean flag =false;
		//添加用户角色到列表;
		String[] roleIds  =request.getParameterValues("roleIds");
		List<UserRoleKey> userRoleKeyList = new ArrayList<UserRoleKey>();
		if(newManagerDto.getUserId()!=null&&!"".equals(newManagerDto.getUserId())){
			if(roleIds!=null){
				for(String roleId:roleIds){
					UserRoleKey tempUserRole = new UserRoleKey();
					tempUserRole.setRoleId(Integer.parseInt(roleId));
					tempUserRole.setUserId(newManagerDto.getUserId());
					userRoleKeyList.add(tempUserRole);
				}
			}
			newManagerDto.setUserRoleList(userRoleKeyList);
			
			flag = managerBiz.saveOrUpdateManager(newManagerDto);
			model.put("managerInfo", newManagerDto);
			model.put("status",flag);
			logBiz.operating(request, "修改管理员", "id="+newManagerDto.getUserId()+";username="+newManagerDto.getUsername());	
			return "member/manager_edit";
		}else{
			newManagerDto.setRegisterIp(request.getLocalAddr());
			newManagerDto.setLastLoginIp(request.getLocalAddr());
			newManagerDto.setRegisterTime(new Date());
			newManagerDto.setLastLoginTime(new Date());
			newManagerDto.setIsAdmin(true);
			if(roleIds!=null){
				for(String roleId:roleIds){
					UserRoleKey tempUserRole = new UserRoleKey();
					tempUserRole.setRoleId(Integer.parseInt(roleId));
					userRoleKeyList.add(tempUserRole);
				}
			}
			newManagerDto.setUserRoleList(userRoleKeyList);
			
			flag = managerBiz.saveOrUpdateManager(newManagerDto);
			model.put("status",flag);
			logBiz.operating(request, "添加管理员", "id="+newManagerDto.getUserId()+";username="+newManagerDto.getUsername());	
			return "redirect:/admin/core/member/manager/v_add.do";
		}
	}
	@RequestMapping("v_list")
	public String findAllUserByPage(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		Integer currentPage = 1;
		if(request.getParameter("showCount")!=null){
			CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 30, "/admin/core/member/user");
		}
		Integer showCount =CookieUtils.getPageSize(request);
		if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
			currentPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p=new Page();
		p.setCurrentPage(currentPage);
		p.setShowCount(showCount);
		Integer isAdmin=1;
		Map<String, Object> params =new HashMap<String,Object>();
		params.put("isAdmin", isAdmin);
		model.put("managerList", managerBiz.findManagerByPage(p, params));
		model.put("page", p);
		return "member/manager_list";
	}
	
	@RequestMapping("v_add")
	public String showAddUser(Map<String, Object> model){
		return "member/manager_edit";
	}
	
	@RequestMapping("o_del")
	public String delUser(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		managerBiz.batchDeleteManagerByIds(ids);
		return "redirect:/admin/core/member/manager/v_list.do";
	}
	
	@RequestMapping(value = "/o_roleCheck")
	public void findPerm(HttpServletRequest request,
			HttpServletResponse response) {
		String userId = request.getParameter("userId") != null
				&& !"".equals(request.getParameter("userId")) ? request
				.getParameter("userId") : "-1";
		JSONArray jsonObject = new JSONArray();
		jsonObject = JSONArray.fromObject(managerBiz.findAllUserRoleByUserId(Integer.parseInt(userId)));
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
