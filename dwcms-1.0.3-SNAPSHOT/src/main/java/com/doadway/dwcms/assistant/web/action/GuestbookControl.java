package com.doadway.dwcms.assistant.web.action;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.assistant.biz.GuestbookBiz;
import com.doadway.dwcms.assistant.pojo.dto.GuestbookDTO;
import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.user.biz.LogBiz;
@Controller
@RequestMapping("/admin/assistant/guestbook")
public class GuestbookControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private GuestbookBiz guestbookBiz;
	@Resource
	private SiteBiz siteBiz;
	
	GuestbookDTO guestbookDto=new GuestbookDTO();
	@RequestMapping("v_edit")
	public String findVote(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		guestbookDto=guestbookBiz.findGuestbookById(id);
		model.put("guestbookDto", guestbookDto);
		return "guestbook/guestbook_edit";
	}
	
	@RequestMapping("o_save")
	public String saveVote(HttpServletRequest request,GuestbookDTO newGuestbookDto,Map<String, Object> model){
		boolean flag =false;
		if(newGuestbookDto.getGuestbookId()==null||newGuestbookDto.getGuestbookId().equals("")){
			newGuestbookDto.setGuestbookId(guestbookBiz.findMaxId()+1);
		}

		if(newGuestbookDto.getSiteId()==null){
			newGuestbookDto.setSiteId(siteBiz.findAllSite().get(0).getSiteId());
		}		
		if(newGuestbookDto.getIp()==null){
			newGuestbookDto.setIp(request.getLocalAddr());
		}		
		if(newGuestbookDto.getCreateTime()==null){
			newGuestbookDto.setCreateTime(new Date(System.currentTimeMillis()));
		}		
		if(newGuestbookDto.getGuestbookId()!=null&&!"".equals(newGuestbookDto.getGuestbookId())){
			flag = guestbookBiz.saveOrUpdateGuestbook(newGuestbookDto);
			guestbookDto=guestbookBiz.findGuestbookById(newGuestbookDto.getGuestbookId());
			model.put("guestbookDto", guestbookDto);
			model.put("status",flag);
			logBiz.operating(request, "修改留言", "id="+newGuestbookDto.getGuestbookId());			
		}else{
			flag = guestbookBiz.saveOrUpdateGuestbook(newGuestbookDto);
			model.put("status",flag);
			logBiz.operating(request, "添加留言", "id="+newGuestbookDto.getGuestbookId());			
			return "redirect:/admin/assistant/guestbook/v_add.do";
		}
		return "guestbook/guestbook_edit";
	}
	
	@RequestMapping("v_list")
	public String findAllVote(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		Integer currentPage = 1;
		if(request.getParameter("showCount")!=null){
			CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 30, "/admin/assistant/guestbook");
		}
		Integer showCount =CookieUtils.getPageSize(request);
		if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
			currentPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p=new Page();
		p.setCurrentPage(currentPage);
		p.setShowCount(showCount);
		model.put("guestbookDtoList", guestbookBiz.findGuestbookByPage(p, null));
		model.put("page", p);
		return "guestbook/guestbook_list";
	}
	
	@RequestMapping("v_add")
	public String showAddVote(Map<String, Object> model){
		return "guestbook/guestbook_edit";
	}
	
	@RequestMapping("o_del")
	public String delVote(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		String pageNo=request.getParameter("pageNo");
		if(pageNo==null||pageNo.equals("")){
			pageNo="1";
		}
		guestbookBiz.batchDeleteGuestbook(ids);
		return "redirect:/admin/assistant/guestbook/v_list.do?pageNo="+pageNo+"";
		
		
	}
}
