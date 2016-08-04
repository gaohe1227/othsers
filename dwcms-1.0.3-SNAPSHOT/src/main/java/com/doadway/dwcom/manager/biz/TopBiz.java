package com.doadway.dwcom.manager.biz;

import java.util.List;

import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;

public interface TopBiz {
	public ChannelDTO findAboutUsById();
	public ChannelDTO findCompanyProfileById();
	public ChannelDTO findCasesById();
	public List<ChannelDTO> findChildsByCasesId();
	public ChannelDTO findNewsById();
	public ChannelDTO findRecruitmentById();
	public List<ChannelDTO> findChildsByAboutUsId();
	
	
	public ChannelDTO findProductAndService();
	public List<ChannelDTO> findChildsByProductServiceId();
	public ChannelDTO findCmsProductById();
	public ChannelDTO findDesignById();
	public List<ChannelDTO> findChildsByDesignId();
	public ChannelDTO findSolutionById();
	public List<ChannelDTO> findChildsBySolutionId();
	public ChannelDTO findAppById();
	
	public ChannelDTO findOrgannizationById();
	public List<ChannelDTO> findChildsByOrgannizeId();
	
	public ChannelDTO findTechnologyStudyById();
	public List<ChannelDTO> findChildsByTechnologyStudyId();
	
	public ChannelDTO findContactUsById();
}
