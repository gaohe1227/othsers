package com.doadway.dwcms.core.config.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.config.biz.ConfigAttrBiz;
import com.doadway.dwcms.core.config.dao.ConfigAttrMapper;
import com.doadway.dwcms.core.config.pojo.ConfigAttr;
import com.doadway.dwcms.core.config.pojo.ConfigAttrExample;
import com.doadway.dwcms.core.config.pojo.ConfigAttrExample.Criteria;
@Service
public class ConfigAttrBizImpl implements ConfigAttrBiz {
	@Resource
	private ConfigAttrMapper configAttrDAO;
	public Map<String, Object> findAllByConfigId(Integer configId) {
		// TODO Auto-generated method stub
		Map<String, Object> configAttrMap = new HashMap<String,Object>();
		ConfigAttrExample example=new ConfigAttrExample();
		com.doadway.dwcms.core.config.pojo.ConfigAttrExample.Criteria  cri = example.createCriteria();
		cri.andConfigIdEqualTo(configId);
		List<ConfigAttr> configAttrList =configAttrDAO.selectByExample(example);
		for(ConfigAttr configAttr:configAttrList){
			configAttrMap.put(configAttr.getAttrName(), configAttr.getAttrValue());
			configAttrMap.put(""+ConfigAttrBiz.CONFIG_ID+"",configAttr.getConfigId() );
		}
		
		return configAttrMap;
	}

	public boolean saveConfigAttr(List<ConfigAttr> configAttrList) {
		Integer flag=0 ;
		// TODO Auto-generated method stub
		for(ConfigAttr configAttr:configAttrList){
				ConfigAttrExample example = new ConfigAttrExample();
				Criteria cri = example.createCriteria();
				cri.andAttrNameEqualTo(configAttr.getAttrName());
				configAttrDAO.updateByExampleSelective(configAttr, example);
				flag++;
		}
		if(flag==configAttrList.size()) return true;
		return false;
	}


	
}
