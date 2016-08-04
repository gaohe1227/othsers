package com.doadway.dwcms.assistant.web.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.assistant.biz.FriendlinkBiz;
import com.doadway.dwcms.assistant.pojo.Friendlink;
import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.user.biz.LogBiz;
@Controller
@RequestMapping("/admin/assistant/friendlink")
public class FriendlinkControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private FriendlinkBiz friendlinkBizBiz;
	@Resource
	private SiteBiz siteBiz;
	
	Friendlink friendlink=new Friendlink();
	@RequestMapping("v_edit")
	public String findFriendlink(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		friendlink=friendlinkBizBiz.findFriendlinkById(id);
		model.put("friendlink", friendlink);
		return "friendlink/friendlink_edit";
	}
	
	@RequestMapping("o_save")
	public String saveFriendlink(HttpServletRequest request,Friendlink newFriendlink,Map<String, Object> model){
		boolean flag =false;
		if(newFriendlink.getFriendlinkId()==null||newFriendlink.getFriendlinkId().equals("")){
			newFriendlink.setFriendlinkId(friendlinkBizBiz.findMaxId()+1);
		}
		if(newFriendlink.getSiteId()==null){
			newFriendlink.setSiteId(siteBiz.findAllSite().get(0).getSiteId());
		}
		if(newFriendlink.getIsEnabled()!=null&&newFriendlink.getIsEnabled().equals("true")){
			newFriendlink.setIsEnabled("1");
		}else{
			newFriendlink.setIsEnabled("0");
		}
		
		if(newFriendlink.getFriendlinkId()!=null&&!"".equals(newFriendlink.getFriendlinkId())){
			flag = friendlinkBizBiz.saveOrUpdateFriendlink(newFriendlink);
			friendlink=friendlinkBizBiz.findFriendlinkById(newFriendlink.getFriendlinkId());
			model.put("friendlink", friendlink);
			model.put("status",flag);
			logBiz.operating(request, "修改友情链接", "id="+newFriendlink.getFriendlinkId()+";linkname="+newFriendlink.getSiteName());			

		}else{
			flag = friendlinkBizBiz.saveOrUpdateFriendlink(newFriendlink);
			model.put("status",flag);
			logBiz.operating(request, "添加友情链接", "id="+newFriendlink.getFriendlinkId()+";linkname="+newFriendlink.getSiteName());			
			return "redirect:/admin/assistant/friendlink/v_add.do";
		}
		return "friendlink/friendlink_edit";
	}
	
	@RequestMapping("v_list")
	public String findAllFriendlink(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		Map<String, String> params = new HashMap<String,String>();
		if(request.getParameter("queryCtgId")!=null){
			params.put("queryCtgId", request.getParameter("queryCtgId"));
			model.put("queryCtgId", request.getParameter("queryCtgId"));
		}
		model.put("friendlinkList", friendlinkBizBiz.findAllFriendlinkByParams(params));
		return "friendlink/friendlink_list";
	}
	
	@RequestMapping("v_add")
	public String showAddFriendlink(Map<String, Object> model){
		return "friendlink/friendlink_edit";
	}
	
	@RequestMapping("o_del")
	public String delFriendlink(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		friendlinkBizBiz.batchDeleteFriendlink(ids);
		return "redirect:/admin/assistant/friendlink/v_list.do";
		
		
	}
	@RequestMapping("o_priority.do")
	public String savePriorityFriendlink(HttpServletRequest request){
		String[] ids = request.getParameterValues("wids");
		String[] prioritys=request.getParameterValues("priority");
		friendlinkBizBiz.batchSavePriority(ids, prioritys);
		return "redirect:/admin/assistant/friendlink/v_list.do";
		
		
	}
}
