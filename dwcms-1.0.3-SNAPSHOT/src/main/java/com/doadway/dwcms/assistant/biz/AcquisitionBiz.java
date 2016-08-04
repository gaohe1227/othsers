package com.doadway.dwcms.assistant.biz;

import java.util.List;

import com.doadway.dwcms.assistant.pojo.Acquisition;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;

public interface AcquisitionBiz {
	public boolean saveOrUpdateAcquisition(Acquisition acquisition);
	
	public boolean batchDeleteAcquisition(String[] advertisingIds);
	
	public Acquisition  queryAcquisitionById(Integer acquisitionId);
	/**获取数据库实时信息,不要走缓存,方法名改用query开头*/
	public List<Acquisition> queryAllAcquisition();
	
	public Acquisition startAcquisitionById(Integer acquisitionId);
	
	public void pauseAcquisitionById(Integer acquisitionId);
	
	public void stopAcquisitionById(Integer acquisitionId);
	
	public void endAcquisitionById(Integer acquisitionId);
	
	public boolean isNeedBreak(Integer id, int currNum, int currItem,
			int totalItem);
	public ContentDTO saveContent(String title, String txt, Integer acquId) ;
}
