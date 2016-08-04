package com.doadway.dwcms.assistant.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.assistant.biz.GuestbookCtgBiz;
import com.doadway.dwcms.assistant.pojo.GuestbookCtg;
import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.user.biz.LogBiz;
@Controller
@RequestMapping("/admin/assistant/guestbook_ctg")
public class GuestbookCtgControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private GuestbookCtgBiz guestbookCtgBiz;	
	@Resource
	private SiteBiz siteBiz;	
	GuestbookCtg guestbookCtg = new GuestbookCtg();
	@RequestMapping("v_edit")
	public String findVote(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		guestbookCtg=guestbookCtgBiz.findGuestbookCtgById(id);
		model.put("guestbookCtg", guestbookCtg);
		return "guestbook_ctg/guestbook_ctg_edit";
	}
	
	@RequestMapping("o_save")
	public String saveVote(HttpServletRequest request,GuestbookCtg newGuestbookCtg,Map<String, Object> model){
		boolean flag =false;
		if(newGuestbookCtg.getSiteId()==null){
			newGuestbookCtg.setSiteId(siteBiz.findAllSite().get(0).getSiteId());
		}		
		if(newGuestbookCtg.getGuestbookctgId()!=null&&!"".equals(newGuestbookCtg.getGuestbookctgId())){
			flag=guestbookCtgBiz.saveOrUpdateGuestbookCtg(newGuestbookCtg);
			guestbookCtg=guestbookCtgBiz.findGuestbookCtgById(newGuestbookCtg.getGuestbookctgId());
			model.put("guestbookCtg", guestbookCtg);
			model.put("status",flag);
			logBiz.operating(request, "修改留言类别", "id="+newGuestbookCtg.getGuestbookctgId()+";ctgname="+newGuestbookCtg.getCtgName());			
		}else{
			newGuestbookCtg.setGuestbookctgId(guestbookCtgBiz.findMaxId()+1);
			flag=guestbookCtgBiz.saveOrUpdateGuestbookCtg(newGuestbookCtg);
			model.put("status",flag);
			logBiz.operating(request, "添加留言类别", "id="+newGuestbookCtg.getGuestbookctgId()+";ctgname="+newGuestbookCtg.getCtgName());			
			return "redirect:/admin/assistant/guestbook_ctg/v_list.do";			
		}
		return "guestbook_ctg/guestbook_ctg_edit";
	}
	
	@RequestMapping("v_list")
	public String findAllVote(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		model.put("guestbookCtgList", guestbookCtgBiz.findAllGuestbookCtg());
		return "guestbook_ctg/guestbook_ctg_list";
	}
	
	@RequestMapping("v_add")
	public String showAddVote(Map<String, Object> model){
		return "guestbook_ctg/guestbook_ctg_edit";
	}
	
	@RequestMapping("o_del")
	public String delVote(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		guestbookCtgBiz.batchDeleteGuestbookCtg(ids);
		return "redirect:/admin/assistant/guestbook_ctg/v_list.do";
		
		
	}
}
