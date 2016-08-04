package com.doadway.dwcom.manager.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcom.manager.biz.FrontConstants;
import com.doadway.dwcom.manager.biz.TopBiz;
import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;
@Service
public class TopBizImpl implements TopBiz {
	@Resource
	private ChannelBiz channelBiz;	
	
	public ChannelDTO findAboutUsById() {
		return channelBiz.findChannelById(FrontConstants.ABOUTUS_ID);
	}
	
	public ChannelDTO findCompanyProfileById() {
		return channelBiz.findChannelById(FrontConstants.COMPANY_PROFILE_ID);
	}

	public ChannelDTO findCasesById() {
		return channelBiz.findChannelById(FrontConstants.CASE_ID);
	}

	public List<ChannelDTO> findChildsByCasesId() {
		return channelBiz.findChannelsByParentId(FrontConstants.CASE_ID);
	}

	public ChannelDTO findNewsById() {
		return channelBiz.findChannelById(FrontConstants.NEWS_ID);
	}

	public ChannelDTO findRecruitmentById() {
		return channelBiz.findChannelById(FrontConstants.RECRUITMENT_ID);
	}

	public List<ChannelDTO> findChildsByAboutUsId() {
		return channelBiz.findChannelsByParentId(FrontConstants.ABOUTUS_ID);
	}

	
	
	public ChannelDTO findProductAndService() {
		return channelBiz.findChannelById(FrontConstants.PRODUCT_SERVICE_ID);
	}
	public List<ChannelDTO> findChildsByProductServiceId() {
		return channelBiz.findChannelsByParentId(FrontConstants.PRODUCT_SERVICE_ID);
	}
	public ChannelDTO findCmsProductById() {
		return  channelBiz.findChannelById(FrontConstants.CMSPRODUCT_ID);
	}
	public List<ChannelDTO> findChildsByDesignId() {
		return  channelBiz.findChannelsByParentId(FrontConstants.DESIGN_ID);
	}
	public ChannelDTO  findDesignById() {
		return  channelBiz.findChannelById(FrontConstants.DESIGN_ID);
	}
	public ChannelDTO findSolutionById() {
		return  channelBiz.findChannelById(FrontConstants.SOLUTION_ID);
	}
	public List<ChannelDTO> findChildsBySolutionId() {
		return  channelBiz.findChannelsByParentId(FrontConstants.SOLUTION_ID);
	}
	public ChannelDTO findAppById() {
		return   channelBiz.findChannelById(FrontConstants.APP_ID);
	}

	
	
	public ChannelDTO findOrgannizationById() {
		return channelBiz.findChannelById(FrontConstants.ORGANNIZE_ID);
	}
	public List<ChannelDTO> findChildsByOrgannizeId() {
		return channelBiz.findChannelsByParentId(FrontConstants.ORGANNIZE_ID);
	}

	
	
	public ChannelDTO findTechnologyStudyById() {
		return channelBiz.findChannelById(FrontConstants.TECHNOLOGY_STUDY_ID);
	}
	public List<ChannelDTO> findChildsByTechnologyStudyId() {
		return  channelBiz.findChannelsByParentId(FrontConstants.TECHNOLOGY_STUDY_ID);
	}

	
	
	public ChannelDTO findContactUsById() {
		return channelBiz.findChannelById(FrontConstants.CONTACT_US_ID);
	}

}
