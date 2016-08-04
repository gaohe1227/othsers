package com.doadway.dwcms.assistant.biz.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.common.util.HtmlUtils;
import com.doadway.dwcms.assistant.biz.AcquisitionBiz;
import com.doadway.dwcms.assistant.dao.AcquisitionMapper;
import com.doadway.dwcms.assistant.pojo.Acquisition;
import com.doadway.dwcms.assistant.pojo.AcquisitionExample;
import com.doadway.dwcms.assistant.pojo.AcquisitionExample.Criteria;
import com.doadway.dwcms.core.content.biz.ContentBiz;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;
@Service
public class AcquisitionBizImpl implements AcquisitionBiz {
	@Resource
	AcquisitionMapper acquisitionDAO;
	@Resource
	ContentBiz contentBiz;
	@Override
	public boolean saveOrUpdateAcquisition(Acquisition acquisition) {
		if(acquisition==null){return false;}
		if(queryAcquisitionById(acquisition.getAcquisitionId())!=null){
			return acquisitionDAO.updateByPrimaryKey(acquisition)>0;
		}else{
			return acquisitionDAO.insert(acquisition)>0;
		}
	}

	@Override
	public boolean batchDeleteAcquisition(String[] advertisingIds) {
		Integer flag=0;
		for(String id:advertisingIds){
			acquisitionDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==advertisingIds.length){
			return true;
		}
		return false;
	}

	@Override
	public Acquisition queryAcquisitionById(Integer acquisitionId) {
		return acquisitionDAO.selectByPrimaryKey(acquisitionId);
	}

	@Override
	public List<Acquisition> queryAllAcquisition() {
		AcquisitionExample example =new AcquisitionExample();
		example.setOrderByClause("ACQUISITION_ID");
		Criteria acqCri=example.createCriteria();
		acqCri.andAcquisitionIdIsNotNull();
		return acquisitionDAO.selectByExample(example );
	}

	@Override
	public Acquisition startAcquisitionById(Integer acquisitionId) {
		Acquisition acqu = queryAcquisitionById(acquisitionId);
		if (acqu == null) {
			return acqu;
		}
		acqu.setStatus(Acquisition.START);
		acqu.setStartTime(new Date());
		acqu.setEndTime(null);
		if (acqu.getCurrNum() <= 0) {
			acqu.setCurrNum(1);
		}
		if (acqu.getCurrItem() <= 0) {
			acqu.setCurrItem(1);
		}
		acqu.setTotalItem(0);
		saveOrUpdateAcquisition(acqu);
		return acqu;
		
	}

	@Override
	public void pauseAcquisitionById(Integer acquisitionId) {
		Acquisition acqu = queryAcquisitionById(acquisitionId);
		if (acqu == null) {
			return;
		}
		if (acqu.getStatus() == Acquisition.START) {
			acqu.setStatus(Acquisition.PAUSE);
		}
		saveOrUpdateAcquisition(acqu);
	}

	@Override
	public void stopAcquisitionById(Integer acquisitionId) {
		Acquisition acqu = queryAcquisitionById(acquisitionId);
		if (acqu == null) {
			return;
		}
		if (acqu.getStatus() == Acquisition.START) {
			acqu.setStatus(Acquisition.STOP);
		} else if (acqu.getStatus() == Acquisition.PAUSE) {
			acqu.setCurrNum(0);
			acqu.setCurrItem(0);
			acqu.setTotalItem(0);
		}
		saveOrUpdateAcquisition(acqu);
	}

	@Override
	public void endAcquisitionById(Integer acquisitionId) {
		Acquisition acqu = queryAcquisitionById(acquisitionId);
		if (acqu == null) {
			return;
		}
		acqu.setStatus(Acquisition.STOP);
		acqu.setEndTime(new Date());
		acqu.setCurrNum(0);
		acqu.setCurrItem(0);
		acqu.setTotalItem(0);
		acqu.setTotalItem(0);
		saveOrUpdateAcquisition(acqu);
	}

	@Override
	public boolean isNeedBreak(Integer id, int currNum, int currItem,
			int totalItem) {
		Acquisition acqu = queryAcquisitionById(id);
		if (acqu == null) {
			return true;
		} else if (acqu.isPuase()) {
			acqu.setCurrNum(currNum);
			acqu.setCurrItem(currItem);
			acqu.setTotalItem(totalItem);
			acqu.setEndTime(new Date());
			saveOrUpdateAcquisition(acqu);
			return true;
		} else if (acqu.isStop()) {
			acqu.setCurrNum(0);
			acqu.setCurrItem(0);
			acqu.setTotalItem(0);
			acqu.setEndTime(new Date());
			saveOrUpdateAcquisition(acqu);
			return true;
		} else {
			acqu.setCurrNum(currNum);
			acqu.setCurrItem(currItem);
			acqu.setTotalItem(totalItem);
			saveOrUpdateAcquisition(acqu);
			return false;
		}
		
	}

	@Override
	public ContentDTO saveContent(String title, String txt, Integer acquId) {
		boolean flag = false;
		
		Acquisition acqu = queryAcquisitionById(acquId);
		ContentDTO contentDTO = new ContentDTO();
		contentDTO.setContentId(contentBiz.findMaxId()+1);
		contentDTO.setChannelId(acqu.getChannelId());
		contentDTO.setTitle(title);
		contentDTO.setTxt(txt);
		String noHtmlTagTxt=HtmlUtils.delHTMLTag(txt);
		if(noHtmlTagTxt.length()>100){
			contentDTO.setDescription(noHtmlTagTxt.substring(0, 100));
		}else{
			contentDTO.setDescription(noHtmlTagTxt.substring(0, noHtmlTagTxt.length()));
		}
		contentDTO.setSiteId(acqu.getSiteId());
		contentDTO.setTypeId(acqu.getTypeId());
		contentDTO.setUserId(acqu.getUserId());
		contentDTO.setIsRejected(false);
		contentDTO.setSortDate(new Date(System.currentTimeMillis()));
		contentDTO.setReleaseDate(new Date(System.currentTimeMillis()) );
		flag=contentBiz.saveOrUpdateContents(contentDTO);
		if(flag){
			return contentDTO;
		}
		return null;
	}
	
	

}
