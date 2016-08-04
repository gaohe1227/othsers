package com.doadway.dwcms.core.user.web.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.core.user.biz.LogBiz;
import com.doadway.dwcms.core.user.biz.UserBiz;
import com.doadway.dwcms.core.user.pojo.dto.UserDTO;
@Controller
@RequestMapping("/admin/core/member/log")
public class LogControl {
	@Resource
	private LogBiz logBiz;
	@Resource
	private UserBiz userBiz;
	
	
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
		Map<String, Object> params =new HashMap<String,Object>();
		if(request.getParameter("queryTitle")!=null&&!"".equals(request.getParameter("queryTitle"))){
			params.put("title", request.getParameter("queryTitle"));
			model.put("queryTitle", request.getParameter("queryTitle"));
		}
		if(request.getParameter("queryIp")!=null&&!"".equals(request.getParameter("queryIp"))){
			params.put("ip", request.getParameter("queryIp"));
			model.put("queryIp", request.getParameter("queryIp"));
		}
		if(request.getParameter("queryUsername")!=null&&!"".equals(request.getParameter("queryUsername"))){
			UserDTO userDto = userBiz.findUserByUserName(request.getParameter("queryUsername"));
			if(userDto.getUserId()!=null){
				params.put("userId", userDto.getUserId());
				model.put("queryUsername", request.getParameter("queryUsername"));
			}else{
				params.put("userId", -1);
			}
		}
		
		model.put("logList", logBiz.findLogByPage(p, params ));
		model.put("page", p);
		return "log/log_list";
	}
	
	@RequestMapping("o_del")
	public String delLog(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		String pageNo=request.getParameter("pageNo");
		logBiz.batchDeleteByIds(ids);
		return "redirect:/admin/core/member/log/v_list.do?pageNo="+pageNo+"";
	}
	@RequestMapping("o_delete_operating_batch")
	public String batchDelLog(HttpServletRequest request){
		String days = request.getParameter("days");
		String pageNo=request.getParameter("pageNo")!=null?request.getParameter("pageNo"):"1";
		switch(Integer.parseInt(days)){
			case 365:
				logBiz.batchDeleteInterValOneYear();
				break;
			case 90:
				logBiz.batchDeleteInterValOneYear();
				break;
			case 30:
				logBiz.batchDeleteInterValOneMonth();
				break;
			case 7:
				logBiz.batchDeleteInterValOneWeek();
				break;	
			case 0:
				logBiz.batchDeleteAll();
				break;
			default:
				return "redirect:/admin/core/member/log/v_list.do?pageNo="+pageNo+"";
		}
		return "redirect:/admin/core/member/log/v_list.do?pageNo="+pageNo+"";
	}
	
	


	
	
}
