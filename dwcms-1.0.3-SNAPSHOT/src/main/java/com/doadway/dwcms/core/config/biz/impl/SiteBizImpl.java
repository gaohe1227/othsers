package com.doadway.dwcms.core.config.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.config.dao.SiteMapper;
import com.doadway.dwcms.core.config.pojo.Site;
import com.doadway.dwcms.core.config.pojo.SiteExample;
@Service
public class SiteBizImpl implements SiteBiz {
	@Resource
	private SiteMapper siteDAO;
	public Site findSiteById(Integer id) {
		// TODO Auto-generated method stub
		return siteDAO.selectByPrimaryKey(id);
	}

	public boolean setSite(Site siteInfo) {
		// TODO Auto-generated method stub
		return siteDAO.updateByPrimaryKeySelective(siteInfo)>0;
	}

	public List<Site> findAllSite() {
		SiteExample example =new SiteExample();
		example.setOrderByClause("SITE_NAME");
		return siteDAO.selectByExample(example);
	}

	public boolean deleteSiteById(Integer id) {
		// TODO Auto-generated method stub
		return siteDAO.deleteByPrimaryKey(id)>0;
	}

	public boolean saveSite(Site siteInfo) {
		// TODO Auto-generated method stub
		return siteDAO.insertSelective(siteInfo)>0;
	}

	public Integer findMaxId() {
		// TODO Auto-generated method stub
		return siteDAO.selectMaxId();
	}

}
