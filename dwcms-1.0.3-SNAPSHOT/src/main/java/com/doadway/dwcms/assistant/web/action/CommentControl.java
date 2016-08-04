package com.doadway.dwcms.assistant.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.assistant.biz.CommentBiz;
import com.doadway.dwcms.assistant.pojo.dto.CommentDTO;
@Controller
@RequestMapping("/admin/assistant/comment")
public class CommentControl {
	@Resource
	private CommentBiz commentBiz;
	CommentDTO commentDto=new CommentDTO();
	@RequestMapping("v_edit")
	public String findComment(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		commentDto=commentBiz.findCommentById(id);
		model.put("commentDto", commentDto);
		return "comment/comment_edit";
	}
	
	@RequestMapping("o_save")
	public String saveComment(HttpServletRequest request,CommentDTO newCommentDTO,Map<String, Object> model){
		boolean flag =false;

		if(newCommentDTO.getCommentId()!=null&&!"".equals(newCommentDTO.getCommentId())){
			flag = commentBiz.saveOrUpdateComment(newCommentDTO);
			commentDto=commentBiz.findCommentById(newCommentDTO.getCommentId());
			model.put("commentDto", commentDto);
			model.put("status",flag);
		}else{
			flag = commentBiz.saveOrUpdateComment(newCommentDTO);
			model.put("status",flag);
			return "redirect:/admin/assistant/comment/v_add.do";
		}
		return "comment/comment_edit";
	}
	
	@RequestMapping("v_list")
	public String findAllComment(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		Integer currentPage = 1;
		if(request.getParameter("showCount")!=null){
			CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 30, "/admin/assistant/comment");
		}
		Integer showCount =CookieUtils.getPageSize(request);
		if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
			currentPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p=new Page();
		p.setCurrentPage(currentPage);
		p.setShowCount(showCount);
		model.put("commentDtoList", commentBiz.findCommentByPage(p, null));
		model.put("page", p);
		return "comment/comment_list";
	}
	
	@RequestMapping("v_add")
	public String showAddComment(Map<String, Object> model){
		return "comment/comment_edit";
	}
	
	@RequestMapping("o_del")
	public String delComment(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		String pageNo=request.getParameter("pageNo");
		if(pageNo==null||pageNo.equals("")){
			pageNo="1";
		}
		commentBiz.batchDeleteComment(ids);
		return "redirect:/admin/assistant/comment/v_list.do?pageNo="+pageNo+"";
		
		
	}
}
