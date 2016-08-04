package com.doadway.dwcms.assistant.biz.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.biz.GuestbookBiz;
import com.doadway.dwcms.assistant.dao.GuestbookExtMapper;
import com.doadway.dwcms.assistant.dao.GuestbookMapper;
import com.doadway.dwcms.assistant.pojo.Guestbook;
import com.doadway.dwcms.assistant.pojo.GuestbookExtExample;
import com.doadway.dwcms.assistant.pojo.GuestbookExtWithBLOBs;
import com.doadway.dwcms.assistant.pojo.dto.GuestbookDTO;
@Service
public class GuestbookBizImpl implements GuestbookBiz {
	@Resource
	GuestbookMapper guestbookDAO;
	@Resource
	GuestbookExtMapper guestbookExtDAO;
	public boolean batchDeleteGuestbook(String[] guestbookIds) {
		Integer flag=0;
		for(String id:guestbookIds){
			GuestbookExtExample example=new GuestbookExtExample();
			GuestbookExtExample.Criteria guestbookExtCri = example.createCriteria();
			guestbookExtCri.andGuestbookIdEqualTo(Integer.parseInt(id));
			guestbookExtDAO.deleteByExample(example);
			
			guestbookDAO.deleteByPrimaryKey(Integer.parseInt(id));
			
			flag++;
		}
		if(flag==guestbookIds.length){
			return true;
		}
		return false;
	}

	public GuestbookDTO findGuestbookById(Integer guestbookId) {
		GuestbookDTO guestbookDto = new GuestbookDTO();
		Guestbook guestbook=guestbookDAO.selectByPrimaryKey(guestbookId);
		if(guestbook!=null){
			BeanUtils.copyProperties(guestbook, guestbookDto);
			
			GuestbookExtExample example=new GuestbookExtExample();
			GuestbookExtExample.Criteria guestbookExtCri = example.createCriteria();
			guestbookExtCri.andGuestbookIdEqualTo(guestbookId);
			List<GuestbookExtWithBLOBs> guestbookExtList=guestbookExtDAO.selectByExampleWithBLOBs(example);
			if(guestbookExtList.size()>0){
				GuestbookExtWithBLOBs guestbookExt = guestbookExtList.get(0);
				BeanUtils.copyProperties(guestbookExt, guestbookDto);
			}
			return guestbookDto;
		}
		return null;
	}

	public List<GuestbookDTO> findGuestbookByPage(Page page,
			Map<String, Object> params) {
		List<GuestbookDTO> guestbookDtoList = new ArrayList<GuestbookDTO>();
		List<Guestbook> guestbookList=guestbookDAO.selectByPage(page, params);
		if(guestbookList.size()>0){
			for(Guestbook guestbook:guestbookList){
				guestbookDtoList.add(findGuestbookById(guestbook.getGuestbookId()));
			}
		}
		return guestbookDtoList;
	}

	public Integer findMaxId() {
		return guestbookDAO.selectMaxId();
	}

	public boolean saveOrUpdateGuestbook(GuestbookDTO guestbookDTO) {
		if(guestbookDTO==null){return false;}
		if(findGuestbookById(guestbookDTO.getGuestbookId())!=null){
			Guestbook guestbook = new Guestbook();
			BeanUtils.copyProperties(guestbookDTO, guestbook);
			guestbookDAO.updateByPrimaryKeySelective(guestbook);
			
			GuestbookExtWithBLOBs guestbookExtWithBLOBs=new GuestbookExtWithBLOBs();
			BeanUtils.copyProperties(guestbookDTO, guestbookExtWithBLOBs);
			GuestbookExtExample example=new GuestbookExtExample();
			GuestbookExtExample.Criteria guestbookExtCri = example.createCriteria();
			guestbookExtCri.andGuestbookIdEqualTo(guestbookDTO.getGuestbookId());
			guestbookExtDAO.updateByExampleSelective(guestbookExtWithBLOBs, example);
			return true;
		}else{
			Guestbook guestbook = new Guestbook();
			BeanUtils.copyProperties(guestbookDTO, guestbook);
			guestbookDAO.insert(guestbook);
				
			GuestbookExtWithBLOBs guestbookExtWithBLOBs=new GuestbookExtWithBLOBs();
			BeanUtils.copyProperties(guestbookDTO, guestbookExtWithBLOBs);
			guestbookExtDAO.insert(guestbookExtWithBLOBs);
			return true;
		}
	}

}
