package com.doadway.dwcms.assistant.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.assistant.biz.GuestbookCtgBiz;
import com.doadway.dwcms.assistant.dao.GuestbookCtgMapper;
import com.doadway.dwcms.assistant.pojo.GuestbookCtg;
import com.doadway.dwcms.assistant.pojo.GuestbookCtgExample;
@Service
public class GuestbookCtgBizImpl implements GuestbookCtgBiz {
	@Resource
	GuestbookCtgMapper guestbookCtgDAO;
	public boolean batchDeleteGuestbookCtg(String[] guestbookCtgIds) {
		Integer flag=0;
		for(String id:guestbookCtgIds){
			guestbookCtgDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==guestbookCtgIds.length){
			return true;
		}
		return false;
	}

	public List<GuestbookCtg> findAllGuestbookCtg() {
		GuestbookCtgExample example=new GuestbookCtgExample();
		example.setOrderByClause("guestbookctg_id");
		GuestbookCtgExample.Criteria guestbookCri = example.createCriteria();
		guestbookCri.andGuestbookctgIdIsNotNull();
		List<GuestbookCtg> guestbookCtgList=guestbookCtgDAO.selectByExample(example);
		return guestbookCtgList;
	}

	public GuestbookCtg findGuestbookCtgById(Integer guestbookCtgId) {
		return guestbookCtgDAO.selectByPrimaryKey(guestbookCtgId);
	}

	public boolean saveOrUpdateGuestbookCtg(GuestbookCtg guestbookCtg) {
		boolean flag = false;
		if(findGuestbookCtgById(guestbookCtg.getGuestbookctgId())!=null){
			flag=guestbookCtgDAO.updateByPrimaryKeySelective(guestbookCtg)>0;
		}else{
			flag=guestbookCtgDAO.insert(guestbookCtg)>0;
		}
		return flag;
	}

	public Integer findMaxId() {
		// TODO Auto-generated method stub
		return guestbookCtgDAO.selectMaxId();
	}

}
