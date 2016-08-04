package com.doadway.dwcms.assistant.biz;

import java.util.List;

import com.doadway.dwcms.assistant.pojo.AdvertisingSpace;
public interface AdvertisingSpaceBiz {
	public boolean saveOrUpdateAdvertisingSpace(AdvertisingSpace advertisingSpace);
	public AdvertisingSpace findAdvertisingSpaceById(Integer advertisingSpaceId);
	public List<AdvertisingSpace> findAllAdvertisingSpace();
	public boolean batchDeleteAdvertisingSpace(String[] advertisingSpaceIds);
}
