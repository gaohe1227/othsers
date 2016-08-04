package com.doadway.dwcms.assistant.biz.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.biz.AdvertisingBiz;
import com.doadway.dwcms.assistant.dao.AdvertisingAttrMapper;
import com.doadway.dwcms.assistant.dao.AdvertisingMapper;
import com.doadway.dwcms.assistant.dao.AdvertisingSpaceMapper;
import com.doadway.dwcms.assistant.pojo.Advertising;
import com.doadway.dwcms.assistant.pojo.AdvertisingAttr;
import com.doadway.dwcms.assistant.pojo.AdvertisingAttrExample;
import com.doadway.dwcms.assistant.pojo.AdvertisingExample;
import com.doadway.dwcms.assistant.pojo.AdvertisingExample.Criteria;
import com.doadway.dwcms.assistant.pojo.dto.AdvertisingDTO;
@Service
public class AdvertisingBizImpl implements AdvertisingBiz {
	@Resource
	AdvertisingMapper advertisingDAO; 
	@Resource
	AdvertisingAttrMapper advertisingAttrDAO;
	@Resource
	AdvertisingSpaceMapper advertisingSpaceDAO;
	public boolean batchDeleteAdvertising(String[] advertisingIds) {
		Integer flag=0;
		for(String id:advertisingIds){
			AdvertisingAttrExample example=new AdvertisingAttrExample();
			AdvertisingAttrExample.Criteria advertisingAttrCri = example.createCriteria();
			advertisingAttrCri.andAdvertisingIdEqualTo(Integer.parseInt(id));
			advertisingAttrDAO.deleteByExample(example);
			
			advertisingDAO.deleteByPrimaryKey(Integer.parseInt(id));
			
			flag++;
		}
		if(flag==advertisingIds.length){
			return true;
		}
		return false;
	}

	public AdvertisingDTO findAdvertisingById(Integer advertisingId) {
		AdvertisingDTO advertisingDto = new AdvertisingDTO();
		Advertising advertising=advertisingDAO.selectByPrimaryKey(advertisingId);
		if(advertising!=null){
			BeanUtils.copyProperties(advertising, advertisingDto);
			advertisingDto.setAdspaceName(advertisingSpaceDAO.selectByPrimaryKey(advertising.getAdspaceId()).getAdName());
			AdvertisingAttrExample example=new AdvertisingAttrExample();
			AdvertisingAttrExample.Criteria advertisingAttrCri = example.createCriteria();
			advertisingAttrCri.andAdvertisingIdEqualTo(advertisingId);
			List<AdvertisingAttr> advertisingAttrList=advertisingAttrDAO.selectByExample(example);
			if(advertisingAttrList.size()>0){
				advertisingDto.setAdvertisingAttrList(advertisingAttrList);
			}
			return advertisingDto;
		}
		return null;
	}

	public List<AdvertisingDTO> findAdvertisingByAdSpaceId(Integer adSpaceId) {
		List<AdvertisingDTO> advertisingDtoList = new ArrayList<AdvertisingDTO>();
		AdvertisingExample example=new AdvertisingExample() ;
		Criteria adCri=example.createCriteria();
		adCri.andAdspaceIdEqualTo(adSpaceId);
		List<Advertising> advertisingList=advertisingDAO.selectByExample(example);
		if(advertisingList.size()>0){
			for(Advertising advertising:advertisingList){
				advertisingDtoList.add(findAdvertisingById(advertising.getAdvertisingId()));
			}
		}		
		return advertisingDtoList;
	}

	public List<AdvertisingDTO> findAdvertisingByPage(Page page,
			Map<String, String> params) {
		List<AdvertisingDTO> advertisingDtoList = new ArrayList<AdvertisingDTO>();
		List<Advertising> advertisingList=advertisingDAO.selectByPage(page, params);
		if(advertisingList.size()>0){
			for(Advertising advertising:advertisingList){
				advertisingDtoList.add(findAdvertisingById(advertising.getAdvertisingId()));
			}
		}
		return advertisingDtoList;
	}

	public Integer findMaxId() {
		return advertisingDAO.selectMaxId();
	}

	public boolean saveOrUpdateAdvertising(AdvertisingDTO advertisingDto) {
		if(advertisingDto==null){return false;}
		if(findAdvertisingById(advertisingDto.getAdvertisingId())!=null){
			Advertising advertising = new Advertising();
			BeanUtils.copyProperties(advertisingDto, advertising);
			advertisingDAO.updateByPrimaryKeySelective(advertising);
			
			List<AdvertisingAttr> advertisingAttrList=advertisingDto.getAdvertisingAttrList();
			if(advertisingAttrList.size()>0){
				AdvertisingAttrExample example=new AdvertisingAttrExample();
				AdvertisingAttrExample.Criteria advertisingAttrCri = example.createCriteria();
				advertisingAttrCri.andAdvertisingIdEqualTo(advertisingDto.getAdvertisingId());
				advertisingAttrDAO.deleteByExample(example);
				
				for(AdvertisingAttr adAttr:advertisingAttrList){
					adAttr.setAdvertisingId(advertising.getAdvertisingId());
					advertisingAttrDAO.insert(adAttr);
				};
			}
			
			return true;
		}else{
			Advertising advertising = new Advertising();
			BeanUtils.copyProperties(advertisingDto, advertising);
			advertisingDAO.insert(advertising);
				
			List<AdvertisingAttr> advertisingAttrList=advertisingDto.getAdvertisingAttrList();
			if(advertisingAttrList.size()>0){
				AdvertisingAttrExample example=new AdvertisingAttrExample();
				AdvertisingAttrExample.Criteria advertisingAttrCri = example.createCriteria();
				advertisingAttrCri.andAdvertisingIdEqualTo(advertisingDto.getAdvertisingId());
				advertisingAttrDAO.deleteByExample(example);
				
				for(AdvertisingAttr adAttr:advertisingAttrList){
					adAttr.setAdvertisingId(advertising.getAdvertisingId());
					advertisingAttrDAO.insert(adAttr);
				};
			}
			return true;
		}
	}

}
