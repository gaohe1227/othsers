package com.doadway.dwcms.core.config.biz;

import java.util.List;

import com.doadway.dwcms.core.config.pojo.Site;

public interface SiteBiz {
	public boolean setSite(Site siteInfo);
	public Site findSiteById(Integer id);
	public List<Site> findAllSite();
	public boolean deleteSiteById(Integer id);
	public boolean saveSite(Site siteInfo);
	public Integer findMaxId();
}
