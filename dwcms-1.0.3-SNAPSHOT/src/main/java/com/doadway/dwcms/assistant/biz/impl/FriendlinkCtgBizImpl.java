package com.doadway.dwcms.assistant.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.assistant.biz.FriendlinkCtgBiz;
import com.doadway.dwcms.assistant.dao.FriendlinkCtgMapper;
import com.doadway.dwcms.assistant.pojo.FriendlinkCtg;
import com.doadway.dwcms.assistant.pojo.FriendlinkCtgExample;
@Service
public class FriendlinkCtgBizImpl implements FriendlinkCtgBiz {
	@Resource
	FriendlinkCtgMapper friendlinkCtgDAO;
	public boolean batchDeleteFriendlinkCtg(String[] friendlinkctgIds) {
		Integer flag=0;
		for(String id:friendlinkctgIds){
			friendlinkCtgDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==friendlinkctgIds.length){
			return true;
		}
		return false;
	}

	public boolean batchUpdate(List<FriendlinkCtg> newFriendlinkCtgList) {
		Integer flag=0;
		for(FriendlinkCtg fctg:newFriendlinkCtgList){
			friendlinkCtgDAO.updateByPrimaryKeySelective(fctg);
			flag++;			
		}
		if(flag==newFriendlinkCtgList.size()){
			return true;
		}
		return false;		
	}

	public List<FriendlinkCtg> findAllFriendlinkCtg() {
		FriendlinkCtgExample example=new FriendlinkCtgExample();
		example.setOrderByClause("friendlinkctg_id");
		FriendlinkCtgExample.Criteria friendlinkCtgCri=example.createCriteria();
		friendlinkCtgCri.andFriendlinkctgIdIsNotNull();
		return friendlinkCtgDAO.selectByExample(example);
	}

	public boolean saveFriendlinkCtg(FriendlinkCtg friendlinkCtg) {
		return friendlinkCtgDAO.insert(friendlinkCtg)>0;
	}

	public FriendlinkCtg findFriendlinkCtgById(Integer friendlinkctgId) {
		return friendlinkCtgDAO.selectByPrimaryKey(friendlinkctgId);
	}

}
