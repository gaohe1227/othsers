package com.doadway.dwcms.assistant.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.assistant.biz.AdvertisingSpaceBiz;
import com.doadway.dwcms.assistant.dao.AdvertisingSpaceMapper;
import com.doadway.dwcms.assistant.pojo.AdvertisingSpace;
import com.doadway.dwcms.assistant.pojo.AdvertisingSpaceExample;
@Service
public class AdvertisingSpaceBizImpl implements AdvertisingSpaceBiz {
	@Resource
	AdvertisingSpaceMapper advertisingSpaceDAO;

	public boolean batchDeleteAdvertisingSpace(String[] advertisingSpaceIds) {
		Integer flag=0;
		for(String id:advertisingSpaceIds){
			advertisingSpaceDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==advertisingSpaceIds.length){
			return true;
		}
		return false;
	}

	public AdvertisingSpace findAdvertisingSpaceById(Integer advertisingSpaceId) {
		return advertisingSpaceDAO.selectByPrimaryKey(advertisingSpaceId);
	}

	public List<AdvertisingSpace> findAllAdvertisingSpace() {
		AdvertisingSpaceExample example=new AdvertisingSpaceExample();
		example.setOrderByClause("adspace_id");
		AdvertisingSpaceExample.Criteria advertisingSpaceCri=example.createCriteria();
		advertisingSpaceCri.andAdspaceIdIsNotNull();
		return advertisingSpaceDAO.selectByExample(example);
	}

	public boolean saveOrUpdateAdvertisingSpace(
			AdvertisingSpace advertisingSpace) {
		if(findAdvertisingSpaceById(advertisingSpace.getAdspaceId())!=null){
			return advertisingSpaceDAO.updateByPrimaryKeySelective(advertisingSpace)>0;
		}else{
			return advertisingSpaceDAO.insert(advertisingSpace)>0;
		}
	}

}
