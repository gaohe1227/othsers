package com.doadway.dwcom.manager.biz;

import java.util.List;

import com.doadway.dwcms.assistant.pojo.dto.AdvertisingDTO;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;

public interface IndexBiz {
	
	public List<AdvertisingDTO> findIndexAdvertisingByAdSpaceId();
	
	
	
	public ChannelDTO findDesignById();
	public List<ChannelDTO> findChildsByDesignId();
	
	public ChannelDTO findSolutionById();
	public List<ChannelDTO> findChildsBySolutionId();
	
	public ChannelDTO findCmsProductById();
	
	public ChannelDTO findAppById();
	
	public ChannelDTO findCompanyProfileById();
	
	
	
	public List<ContentDTO> findUpToDateCase();
	
	
}
