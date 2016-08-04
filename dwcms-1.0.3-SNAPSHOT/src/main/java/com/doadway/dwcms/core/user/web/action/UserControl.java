package com.doadway.dwcms.core.user.web.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.page.Page;
import com.doadway.common.shiro.UserRealm.ShiroUser;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.core.user.biz.LogBiz;
import com.doadway.dwcms.core.user.biz.UserBiz;
import com.doadway.dwcms.core.user.pojo.dto.UserDTO;
@Controller
@RequestMapping("/admin/core/member/user")
public class UserControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private UserBiz userBiz;
	UserDTO userDto =new UserDTO();
	@RequestMapping("v_edit")
	public String findUser(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("userId")!=null?Integer.parseInt(request.getParameter("userId")):1;
		userDto=userBiz.findUserById(id);
		model.put("userInfo", userDto);
		return "member/member_edit";
	}
	@RequestMapping("o_save")
	public String saveUser(HttpServletRequest request,UserDTO userDto,Map<String, Object> model){
		boolean flag =false;

		if(userDto.getUserId()!=null&&!"".equals(userDto.getUserId())){
			flag = userBiz.saveOrUpdateUser(userDto);
			model.put("userInfo", userDto);
			model.put("status",flag);
			logBiz.operating(request, "修改用户", "id="+userDto.getUserId()+"username="+userDto.getUsername());
		}else{
			userDto.setRegisterIp(request.getLocalAddr());
			userDto.setLastLoginIp(request.getLocalAddr());
			userDto.setRegisterTime(new Date());
			userDto.setLastLoginTime(new Date());
			
			flag = userBiz.saveOrUpdateUser(userDto);
			model.put("status",flag);
			logBiz.operating(request, "添加用户", "id="+userDto.getUserId()+"username="+userDto.getUsername());
		}
		return "member/member_edit";
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
		Integer isAdmin=0;
		Map<String, Object> params =new HashMap<String,Object>();
		params.put("isAdmin", isAdmin);
		model.put("userList", userBiz.findUserByPage(p, params ));
		model.put("page", p);
		return "member/member_list";
	}
	@RequestMapping("v_add")
	public String showAddUser(Map<String, Object> model){
		return "member/member_edit";
	}
	
	@RequestMapping("o_del")
	public String delUser(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		userBiz.batchDeleteUserByIds(ids);
		return "redirect:/admin/core/member/user/v_list.do";
	}
	@RequestMapping("o_profile")
	public String saveProfile(HttpServletRequest request,UserDTO userDto,Map<String, Object> model){
		Subject currentUser = SecurityUtils.getSubject(); 
		ShiroUser user=(ShiroUser)currentUser.getPrincipal();
		 UserDTO orginUser=userBiz.findUserById(user.id);
		 String origPwd=request.getParameter("origPwd");
		 String newPwd=request.getParameter("newPwd");
		if(origPwd.equals(orginUser.getPassword())&&!newPwd.equals("")){
			orginUser.setPassword(newPwd);
			orginUser.setEmail(userDto.getEmail());
			orginUser.setRealname(userDto.getRealname());
			userBiz.saveOrUpdateUser(orginUser);
			logBiz.operating(request, "修改个人资料", "id="+orginUser.getUserId()+"username="+orginUser.getUsername());
		}
		return "redirect:/admin/profile.do";
	}		
}
