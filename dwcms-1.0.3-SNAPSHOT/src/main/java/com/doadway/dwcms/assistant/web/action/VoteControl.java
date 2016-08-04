package com.doadway.dwcms.assistant.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.assistant.biz.VoteBiz;
import com.doadway.dwcms.assistant.pojo.VoteItem;
import com.doadway.dwcms.assistant.pojo.dto.VoteDTO;
import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.user.biz.LogBiz;
@Controller
@RequestMapping("/admin/assistant/vote")
public class VoteControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private VoteBiz voteBiz;
	@Resource
	private SiteBiz siteBiz;
	
	VoteDTO voteDto=new VoteDTO();
	@RequestMapping("v_edit")
	public String findVote(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		voteDto=voteBiz.findVoteById(id);
		model.put("voteDto", voteDto);
		return "vote/vote_edit";
	}
	
	@RequestMapping("o_save")
	public String saveVote(HttpServletRequest request,VoteDTO newVoteDto,Map<String, Object> model){
		boolean flag =false;
		if(newVoteDto.getVotetopicId()==null||newVoteDto.getVotetopicId().equals("")){
			newVoteDto.setVotetopicId(voteBiz.findMaxId()+1);
		}
		if(newVoteDto.getSiteId()==null){
			newVoteDto.setSiteId(siteBiz.findAllSite().get(0).getSiteId());
		}

		String[] vItemTitles=request.getParameterValues("itemTitle");
		String[] vItemCounts=request.getParameterValues("itemVoteCount");
		String[] vItemPrioritys=request.getParameterValues("itemPriority");
		if(newVoteDto.getTotalCount()==null){
			Integer totalCount=0;
			for(String c:vItemCounts){
				totalCount+=Integer.parseInt(c);
			}
			newVoteDto.setTotalCount(totalCount);
		}
		
		List<String> noTrimvItemTitles=new ArrayList<String>();
		for(String t:vItemTitles){
			if(!"".equals(t)){
				noTrimvItemTitles.add(t);
			}
		}
		if(noTrimvItemTitles.size()>0){
			List<VoteItem> vItemList = new ArrayList<VoteItem>();
			for(int i=0;i<vItemTitles.length;i++){
				VoteItem voteItem = new VoteItem();
				voteItem.setPriority(Integer.parseInt(vItemPrioritys[i]));
				voteItem.setTitle(vItemTitles[i]);
				voteItem.setVoteCount(Integer.parseInt(vItemCounts[i]));
				voteItem.setVotetopicId(newVoteDto.getVotetopicId());
				vItemList.add(voteItem);
			}
			newVoteDto.setVoteItemList(vItemList);
		}
		
		if(newVoteDto.getVotetopicId()!=null&&!"".equals(newVoteDto.getVotetopicId())){
			flag = voteBiz.saveOrUpdateVote(newVoteDto);
			voteDto=voteBiz.findVoteById(newVoteDto.getVotetopicId());
			model.put("voteDto", voteDto);
			model.put("status",flag);
			logBiz.operating(request, "修改投票主题", "id="+newVoteDto.getVotetopicId()+";title="+newVoteDto.getTitle());			
		}else{
			flag = voteBiz.saveOrUpdateVote(newVoteDto);
			model.put("status",flag);
			logBiz.operating(request, "发布投票主题", "id="+newVoteDto.getVotetopicId()+";title="+newVoteDto.getTitle());			
			return "redirect:/admin/assistant/vote/v_add.do";
		}
		return "vote/vote_edit";
	}
	
	@RequestMapping("v_list")
	public String findAllVote(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
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
		model.put("voteDtoList", voteBiz.findVoteByPage(p, null));
		model.put("page", p);
		return "vote/vote_list";
	}
	
	@RequestMapping("v_add")
	public String showAddVote(Map<String, Object> model){
		return "vote/vote_edit";
	}
	
	@RequestMapping("o_del")
	public String delVote(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		String pageNo=request.getParameter("pageNo");
		if(pageNo==null||pageNo.equals("")){
			pageNo="1";
		}
		voteBiz.batchDeleteVote(ids);
		return "redirect:/admin/assistant/vote/v_list.do?pageNo="+pageNo+"";
		
		
	}
}
