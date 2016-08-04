package com.doadway.dwcms.assistant.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.assistant.biz.FriendlinkCtgBiz;
import com.doadway.dwcms.assistant.pojo.FriendlinkCtg;
import com.doadway.dwcms.core.config.biz.SiteBiz;
@Controller
@RequestMapping("/admin/assistant/friendlink_ctg")
public class FriendlinkCtgControl {
	@Resource
	private FriendlinkCtgBiz friendlinkCtgBiz;
	@Resource
	private SiteBiz siteBiz;	
	FriendlinkCtg friendlinkCtg=new FriendlinkCtg();	
	@RequestMapping("o_save")
	public String saveFriendlinkCtg(HttpServletRequest request,FriendlinkCtg friendlinkCtg,Map<String, Object> model){
		if(friendlinkCtg.getSiteId()==null){
			friendlinkCtg.setSiteId(siteBiz.findAllSite().get(0).getSiteId());
		}
		friendlinkCtgBiz.saveFriendlinkCtg(friendlinkCtg);
		return "redirect:/admin/assistant/friendlink_ctg/v_list.do";
	}
	
	@RequestMapping("v_list")
	public String findAllFriendlinkCtg(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		model.put("friendlinkCtgList", friendlinkCtgBiz.findAllFriendlinkCtg());
		return "friendlink_ctg/friendlink_ctg_list";
	}
	
	@RequestMapping("o_del")
	public String delFriendlinkCtg(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		friendlinkCtgBiz.batchDeleteFriendlinkCtg(ids);
		return "redirect:/admin/assistant/friendlink_ctg/v_list.do";
		
	}
	@RequestMapping("o_update")
	public String updateFriendlinkCtg(HttpServletRequest request){
		String[] ids = request.getParameterValues("wids");
		String[] friendlinkctgNames  = request.getParameterValues("name");
		String[] prioritys  = request.getParameterValues("priority");
		List<FriendlinkCtg> friendlinkCtgList= new ArrayList<FriendlinkCtg>();
		for(int i=0;i<ids.length;i++){
			FriendlinkCtg friendlinkctg=friendlinkCtgBiz.findFriendlinkCtgById(Integer.parseInt(ids[i]));
			friendlinkctg.setFriendlinkctgName(friendlinkctgNames[i]);
			friendlinkctg.setPriority(Integer.parseInt(prioritys[i]));
			friendlinkCtgList.add(friendlinkctg);
			
		}
		friendlinkCtgBiz.batchUpdate(friendlinkCtgList);
		return "redirect:/admin/assistant/friendlink_ctg/v_list.do";
	}
	
}
