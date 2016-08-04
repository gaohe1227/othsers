package com.doadway.dwcms.maintain.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.maintain.biz.SensitivityBiz;
import com.doadway.dwcms.maintain.dao.SensitivityMapper;
import com.doadway.dwcms.maintain.pojo.Sensitivity;
import com.doadway.dwcms.maintain.pojo.SensitivityExample;
@Service
public class SensitivityBizImpl implements SensitivityBiz {
	@Resource
	SensitivityMapper sensitivityDAO;
	public boolean batchDeleteSensitivity(String[] sensitivityIds) {
		Integer flag=0;
		for(String id:sensitivityIds){
			sensitivityDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==sensitivityIds.length){
			return true;
		}
		return false;
	}

	public boolean batchUpdateSensitivity(List<Sensitivity> sensitivityList) {
		Integer flag=0;
		for(Sensitivity sensitivity:sensitivityList){
			sensitivityDAO.updateByPrimaryKey(sensitivity);
			flag++;
		}
		if(flag==sensitivityList.size()){
			return true;
		}
		return false;
	}

	public List<Sensitivity> findAllSensitivity() {
		SensitivityExample example =new SensitivityExample();
		SensitivityExample.Criteria sensitivityCri= example.createCriteria();
		sensitivityCri.andSensitivityIdIsNotNull();
		return sensitivityDAO.selectByExample(example);
	}

	public boolean saveSensitivity(Sensitivity sensitivity) {
		return sensitivityDAO.insert(sensitivity)>0;
	}

}
