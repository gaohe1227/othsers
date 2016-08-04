package com.doadway.dwcms.core.config.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.config.biz.DoConfigBiz;
import com.doadway.dwcms.core.config.dao.DoConfigMapper;
import com.doadway.dwcms.core.config.pojo.DoConfig;
import com.doadway.dwcms.core.config.pojo.DoConfigExample;
import com.doadway.dwcms.core.config.pojo.DoConfigExample.Criteria;
@Service
public class DoConfigBizImpl implements DoConfigBiz {
	@Resource
	private DoConfigMapper doConfigDAO;
	public Map<String, Object> findAllDoConfig() {
		// TODO Auto-generated method stub
		Map<String, Object> doConfigMap = new HashMap<String,Object>();
		DoConfigExample example=new DoConfigExample();
		Criteria  cri = example.createCriteria();
		cri.andCfgKeyIsNotNull();
		List<DoConfig> doConfigList =doConfigDAO.selectByExample(example);
		for(DoConfig doConfig:doConfigList){
			doConfigMap.put(doConfig.getCfgKey(), doConfig.getCfgValue());
		}
		return doConfigMap;
	}

	public boolean saveDoConfig(Map<String, Object> doConfig) {
		Integer flag=0 ;
		// TODO Auto-generated method stub
		for(String cfgKey:doConfig.keySet()){
			DoConfig tDoConfig = doConfigDAO.selectByPrimaryKey(cfgKey);
			if(tDoConfig!=null){
				tDoConfig.setCfgValue((String)doConfig.get(cfgKey));
				doConfigDAO.updateByPrimaryKeySelective(tDoConfig);
				flag++;
			}
		}
		if(flag==doConfig.size()) return true;
		return false;
	}

}
