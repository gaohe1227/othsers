package com.doadway.dwcms.assistant.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.pojo.dto.AdvertisingDTO;

public interface AdvertisingBiz {
	public boolean saveOrUpdateAdvertising(AdvertisingDTO advertisingDto);
	
	public boolean batchDeleteAdvertising(String[] advertisingIds);
	
	public List<AdvertisingDTO> findAdvertisingByPage(Page page,Map<String,String> params);
	
	public AdvertisingDTO  findAdvertisingById(Integer advertisingId);
	
	public List<AdvertisingDTO>  findAdvertisingByAdSpaceId(Integer adSpaceId);
	
	public Integer  findMaxId();
	
}
