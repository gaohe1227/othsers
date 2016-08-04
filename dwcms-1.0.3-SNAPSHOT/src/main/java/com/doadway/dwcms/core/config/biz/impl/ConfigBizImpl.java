package com.doadway.dwcms.core.config.biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.config.biz.ConfigBiz;
import com.doadway.dwcms.core.config.dao.ConfigMapper;
import com.doadway.dwcms.core.config.pojo.Config;
@Service
public class ConfigBizImpl implements ConfigBiz{
	@Resource
	private ConfigMapper configDAO;
	public Config findConfigById(Integer id) {
		// TODO Auto-generated method stub
		return configDAO.selectByPrimaryKey(id);
	}

	public boolean setConfig(Config configInfo) {
		// TODO Auto-generated method stub
		return configDAO.updateByPrimaryKeySelective(configInfo)>0;
	}

}
