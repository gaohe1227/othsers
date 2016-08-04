package com.doadway.dwcom.manager.biz.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcom.manager.biz.FrontConstants;
import com.doadway.dwcom.manager.biz.IndexBiz;
import com.doadway.dwcms.assistant.biz.AdvertisingBiz;
import com.doadway.dwcms.assistant.pojo.dto.AdvertisingDTO;
import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;
import com.doadway.dwcms.core.content.biz.ContentBiz;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;
@Service
public class IndexBizImpl implements IndexBiz {
	@Resource
	private ChannelBiz channelBiz;	
	@Resource
	private AdvertisingBiz  advertisingBiz;	
	@Resource
	private ContentBiz  contentBiz;	
	public List<AdvertisingDTO> findIndexAdvertisingByAdSpaceId() {
		return advertisingBiz.findAdvertisingByAdSpaceId(FrontConstants.INDEX_AD_SPACE_ID);
	}

	public ChannelDTO findDesignById() {
		return  channelBiz.findChannelById(FrontConstants.DESIGN_ID);
	}

	public List<ChannelDTO> findChildsByDesignId() {
		return  channelBiz.findChannelsByParentId(FrontConstants.DESIGN_ID);
	}

	public ChannelDTO findSolutionById() {
		return  channelBiz.findChannelById(FrontConstants.SOLUTION_ID);
	}

	public List<ChannelDTO> findChildsBySolutionId() {
		return  channelBiz.findChannelsByParentId(FrontConstants.SOLUTION_ID);
	}

	public ChannelDTO findCmsProductById() {
		return  channelBiz.findChannelById(FrontConstants.CMSPRODUCT_ID);
	}

	public ChannelDTO findAppById() {
		return   channelBiz.findChannelById(FrontConstants.APP_ID);
	}

	public ChannelDTO findCompanyProfileById() {
		return   channelBiz.findChannelById(FrontConstants.COMPANY_PROFILE_ID);
	}

	public List<ContentDTO> findUpToDateCase() {
		Page p=new Page();
		p.setCurrentPage(1);
		p.setShowCount(12);
		Map<String, Object> params=new HashMap<String,Object>();
		List<ContentDTO> contentDtoList=new ArrayList<ContentDTO>();
		List<ChannelDTO> channelDtoList=channelBiz.findChannelsByParentId(FrontConstants.CASE_ID);
		for(ChannelDTO channelDto:channelDtoList){
			params.put("channelId", channelDto.getChannelId());
			contentDtoList.addAll(contentBiz.findContentByPage(p, params ));
		}
		p.setTotalResult(contentDtoList.size());
		p.setTotalPage(contentDtoList.size()%p.getShowCount()==0?contentDtoList.size()/p.getShowCount():contentDtoList.size()/p.getShowCount()+1);
		Integer startIndex=p.getCurrentResult();
		Integer toIndex=p.getCurrentPage()*p.getShowCount();
		if(toIndex>contentDtoList.size()){
			toIndex=contentDtoList.size();
		}
		return contentDtoList.subList(startIndex,toIndex);
	}

}
