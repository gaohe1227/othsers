package com.doadway.dwcms.maintain.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.core.user.biz.LogBiz;
import com.doadway.dwcms.maintain.biz.TopicBiz;
import com.doadway.dwcms.maintain.pojo.Topic;

@Controller
@RequestMapping("/admin/maintain/topic")
public class TopicControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private TopicBiz topicBiz;
	Topic topic =new Topic();
	@RequestMapping("v_edit")
	public String findTopic(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		topic=topicBiz.findTopicById(id);
		model.put("topic", topic);
		return "topic/topic_edit";
	}
	
	@RequestMapping("o_save")
	public String saveGroup(HttpServletRequest request,Topic newTopic,Map<String, Object> model){
		boolean flag =false;

		if(newTopic.getTopicId()!=null&&!"".equals(newTopic.getTopicId())){
			flag = topicBiz.saveOrUpdateTopic(newTopic);
			model.put("topic", newTopic);
			model.put("status",flag);
			logBiz.operating(request, "修改主题", "id="+newTopic.getTopicId()+";topicname="+newTopic.getTopicName());
		}else{
			flag = topicBiz.saveOrUpdateTopic(newTopic);
			model.put("status",flag);
			logBiz.operating(request, "添加主题", "id="+newTopic.getTopicId()+";topicname="+newTopic.getTopicName());
			return "redirect:/admin/maintain/topic/v_add.do";
		}
		return "topic/topic_edit";
	}
	
	@RequestMapping("v_list")
	public String findAllGroup(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
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
		model.put("topicList", topicBiz.findTopicByPage(p, null));
		model.put("page", p);
		return "topic/topic_list";
	}
	
	@RequestMapping("v_add")
	public String showAddUser(Map<String, Object> model){
		return "topic/topic_edit";
	}
	
	@RequestMapping("o_del")
	public String delUser(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		topicBiz.batchDeleteTopic(ids);
		return "redirect:/admin/maintain/topic/v_list.do";
		
		
	}
	@RequestMapping("o_priority")
	public String savePrioritys(HttpServletRequest request, Map<String, Object> model){
		String[] wids = request.getParameterValues("wids");
		String[] prioritys = request.getParameterValues("priority");
		
		boolean flag = topicBiz.savePriority(wids, prioritys);
		if(flag){
			model.put("status",flag);
		}
		return "redirect:/admin/maintain/topic/v_list.do";
	}	
}
