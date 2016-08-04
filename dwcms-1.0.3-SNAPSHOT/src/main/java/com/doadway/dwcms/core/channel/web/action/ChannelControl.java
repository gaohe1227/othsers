package com.doadway.dwcms.core.channel.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcms.core.channel.pojo.ChnlGroupContriKey;
import com.doadway.dwcms.core.channel.pojo.ChnlGroupViewKey;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;
import com.doadway.dwcms.core.config.biz.ModelBiz;
import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.config.pojo.Model;
import com.doadway.dwcms.core.user.biz.LogBiz;

@Controller
@RequestMapping("/admin/core/channel")
public class ChannelControl {
	@Resource
	LogBiz logBiz;		
	@Resource
	private ChannelBiz channelBiz;
	@Resource
	private ModelBiz   modelBiz;
	@Resource
	private SiteBiz   siteBiz;
	
	
	private ChannelDTO channelDto;
	@RequestMapping(value = "/c_channel_tree")
	public void createTree(HttpServletRequest request,
			HttpServletResponse response) {
		String parentId = request.getParameter("parentId") == null
				||"".equals(request.getParameter("parentId")) ? null: request
						.getParameter("parentId");
		JSONArray jsonArray = new JSONArray();
		jsonArray = JSONArray.fromObject(channelBiz.createChannelTree(parentId));
		
		Map<String,Object> node = new HashMap<String,Object>();
		node.put("id", 0);
		node.put("text", "根目录");
		node.put("state", "open");
		node.put("children", jsonArray);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(JSONArray.fromObject(node).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/v_ztree")
	public void createZTree(HttpServletRequest request,
			HttpServletResponse response) {
		String parentId = request.getParameter("parentId") == null
				||"".equals(request.getParameter("parentId")) ? null: request
						.getParameter("parentId");
		JSONArray jsonArray = new JSONArray();
		jsonArray = JSONArray.fromObject(channelBiz.createZTree(parentId));
		
		Map<String,Object> node = new HashMap<String,Object>();
		node.put("id", 0);
		node.put("pId", 0);
		node.put("name", "根目录");
		node.put("open", "true");
		node.put("children", jsonArray);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(JSONArray.fromObject(node).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/v_asyncZtree")
	public void createAsyncZtree(HttpServletRequest request,
			HttpServletResponse response) {
		String parentId = request.getParameter("parentId") == null
				||"".equals(request.getParameter("parentId")) ? null: request
						.getParameter("parentId");
		JSONArray jsonArray = new JSONArray();
		jsonArray = JSONArray.fromObject(channelBiz.createAsyncZtreeByParentId(parentId));
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(jsonArray.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	@RequestMapping(value = "/v_asyncEasyTree")
	public void createAsyncEasyTree(HttpServletRequest request,
			HttpServletResponse response) {
		String parentId = request.getParameter("parentId") == null
		||"".equals(request.getParameter("parentId")) ? null: request
				.getParameter("parentId");
		JSONArray jsonArray = new JSONArray();
		jsonArray = JSONArray.fromObject(channelBiz.createAsyncEasyTreeByParentId(parentId));
		response.setContentType("text/html;charset=utf-8");
		try {
			if(parentId==null){
				Map<String,Object> node = new HashMap<String,Object>();
				node.put("id", 0);
				node.put("pId", 0);
				node.put("text", "根目录");
				node.put("state", "open");
				node.put("children", jsonArray);	
				response.getWriter().println(JSONArray.fromObject(node).toString());
			}else{
				response.getWriter().println(jsonArray.toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	@RequestMapping("v_edit")
	public String findChannel(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("channelId")!=null&&!"".equals(request.getParameter("channelId"))?Integer.parseInt(request.getParameter("channelId")):null;
		channelDto=channelBiz.findChannelById(id);
		model.put("channelDto", channelDto);
		Integer modelId = request.getParameter("modelId")!=null&&!"".equals(request.getParameter("modelId"))?Integer.parseInt(request.getParameter("modelId")):null;
		model.put("model", modelBiz.findModelById(modelId));		
		return this.findChannelModelView(modelBiz.findModelById(modelId));
	}
	
	@RequestMapping("o_save")
	public String saveChannel(HttpServletRequest request,ChannelDTO newChannelDTO,Map<String, Object> model){
		boolean flag =false;
		if(newChannelDTO.getIsAccessByDir()!=null){
			if(newChannelDTO.getIsAccessByDir().equals("true")){
				newChannelDTO.setIsAccessByDir("1");
			}else{
				newChannelDTO.setIsAccessByDir("0");
			}
		}else{
			newChannelDTO.setIsAccessByDir("0");
		}
		
		if(newChannelDTO.getIsListChild()!=null){
			if(newChannelDTO.getIsListChild().equals("true")){
				newChannelDTO.setIsListChild("1");
			}else{
				newChannelDTO.setIsListChild("0");
			}	
		}else{
			newChannelDTO.setIsListChild("0");
		}
		
		if(newChannelDTO.getIsStaticChannel()!=null){
			if(newChannelDTO.getIsStaticChannel().equals("true")){
				newChannelDTO.setIsStaticChannel("1");
			}else{
				newChannelDTO.setIsStaticChannel("0");
			}
		}else{
			newChannelDTO.setIsStaticChannel("0");
		}
		
		if(newChannelDTO.getIsStaticContent()!=null){
			if(newChannelDTO.getIsStaticContent().equals("true")){
				newChannelDTO.setIsStaticContent("1");
			}else{
				newChannelDTO.setIsStaticContent("0");
			}
		}else{
			newChannelDTO.setIsStaticContent("0");
		}
		
		if(newChannelDTO.getSiteId()==null){
			newChannelDTO.setSiteId(siteBiz.findAllSite().get(0).getSiteId());
		}
		Integer newChannelId = channelBiz.findMaxId()+1;
		String[] viewGroupIds = request.getParameterValues("viewGroupIds");
		if(viewGroupIds!=null){
			List<ChnlGroupViewKey> chnlGroupViewList = new ArrayList<ChnlGroupViewKey>();
			for(String vgroupId:viewGroupIds){
				ChnlGroupViewKey tGroupViewKey = new ChnlGroupViewKey();
				tGroupViewKey.setChannelId(newChannelId);
				tGroupViewKey.setGroupId(Integer.parseInt(vgroupId));
				chnlGroupViewList.add(tGroupViewKey);
			}
			newChannelDTO.setChnlGroupViewList(chnlGroupViewList);
		}
		
		String[] groupContriIds =request.getParameterValues("groupContriIds");
		if(groupContriIds!=null){
			List<ChnlGroupContriKey> chnlContriGroupList = new ArrayList<ChnlGroupContriKey>();
			for(String gContriIds:groupContriIds){
				ChnlGroupContriKey tGroupContriKey = new ChnlGroupContriKey();
				tGroupContriKey.setChannelId(newChannelId);
				tGroupContriKey.setGroupId(Integer.parseInt(gContriIds));
				chnlContriGroupList.add(tGroupContriKey);
			}
			newChannelDTO.setChnlContriGroupList(chnlContriGroupList);
		}
		if(newChannelDTO.getChannelId()!=null&&!"".equals(newChannelDTO.getChannelId())){
			flag = channelBiz.saveOrUpdateChannel(newChannelDTO);
			model.put("channelDto", newChannelDTO);
			model.put("model", modelBiz.findModelById(newChannelDTO.getModelId()));
			model.put("status",flag);
			logBiz.operating(request, "修改栏目", "id="+newChannelDTO.getChannelId()+";channelname="+newChannelDTO.getChannelName());
			return this.findChannelModelView(modelBiz.findModelById(newChannelDTO.getModelId()));
		}else{
			newChannelDTO.setChannelId(newChannelId);
			flag = channelBiz.saveOrUpdateChannel(newChannelDTO);
			model.put("status",flag);
			logBiz.operating(request, "添加栏目", "id="+newChannelDTO.getChannelId()+";channelname="+newChannelDTO.getChannelName());
			return "redirect:/admin/core/channel/v_add.do?channelId="+newChannelDTO.getChannelId()+"&modelId="+newChannelDTO.getModelId()+"";
		}
	}
	
	@RequestMapping("v_list")
	public String findChannelsByChannelId(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		Integer id=0;
		if(request.getParameter("channelId")!=null&&!request.getParameter("channelId").equals("")){
			id= Integer.parseInt(request.getParameter("channelId"));
		}
		List<ChannelDTO> channelDtoList = new ArrayList<ChannelDTO>();
		if(channelBiz.isParentChannel(id)){
			channelDtoList=channelBiz.findChannelsByParentId(id);
		}else{
			if(channelBiz.findChannelById(id).getParentId()==0){
					channelDto=channelBiz.findChannelById(id);
					model.put("channelDto", channelDto);
					model.put("model", modelBiz.findModelById(channelDto.getModelId()));
					return this.findChannelModelView(modelBiz.findModelById(channelDto.getModelId()));
				
			}

				channelDto=channelBiz.findChannelById(id);
				model.put("channelDto", channelDto);
				model.put("model", modelBiz.findModelById(channelDto.getModelId()));					
				return this.findChannelModelView(modelBiz.findModelById(channelDto.getModelId()));
			
		}
		model.put("channelList", channelDtoList);
		model.put("channelDto.channelId", id);
		return "channel/channel_list";
	}
	
	@RequestMapping("v_add")
	public String showAddChannel(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("modelId")!=null||!"".equals(request.getParameter("modelId"))?Integer.parseInt(request.getParameter("modelId")):null;
		model.put("model", modelBiz.findModelById(id));
		model.put("channelDto.channelId", request.getParameter("channelId"));
		return this.findChannelModelView(modelBiz.findModelById(id));
	}
	
	@RequestMapping("o_del")
	public String delChannel(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		channelBiz.batchDeleteChannelByIds(ids);
		return "redirect:/admin/core/channel/v_list.do";
		
		
	}
	@RequestMapping("o_priority")
	public String savePrioritys(HttpServletRequest request, Map<String, Object> model){
		String[] wids = request.getParameterValues("wids");
		String[] prioritys = request.getParameterValues("priority");
		String root = request.getParameter("root");
		boolean flag = channelBiz.savePriority(wids, prioritys);
		if(flag){
			model.put("status",flag);
		}
		return "redirect:/admin/core/channel/v_list.do?channelId="+root+"";
	}	
	
	@RequestMapping(value = "/o_groupcontri")
	public void findChnlContriGroup(HttpServletRequest request,
			HttpServletResponse response) {
		Integer id = request.getParameter("channelId")!=null||!"".equals(request.getParameter("channelId"))?Integer.parseInt(request.getParameter("channelId")):null;
		JSONArray jsonObject = new JSONArray();
		jsonObject = JSONArray.fromObject(channelBiz.findChnlContriGroup(id));
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	@RequestMapping(value = "/o_groupview")
	public void findChnlContriView(HttpServletRequest request,
			HttpServletResponse response) {
		Integer id = request.getParameter("channelId")!=null||!"".equals(request.getParameter("channelId"))?Integer.parseInt(request.getParameter("channelId")):null;
		JSONArray jsonObject = new JSONArray();
		jsonObject = JSONArray.fromObject(channelBiz.findChnlGroupView(id));
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String findChannelModelView(Model model){
		String chnlModelView ="";
		if(model.getModelName().equals("新闻")){
			chnlModelView="channel/channel_news";
		}else if(model.getModelName().equals("单页")){
			chnlModelView="channel/channel_single";
		}else if(model.getModelName().equals("作品")){
			chnlModelView="channel/channel_production";
		}else if(model.getModelName().equals("下载")){
			chnlModelView="channel/channel_download";
		}
		return chnlModelView;
	}
}
