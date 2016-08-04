package com.doadway.dwcms.assistant.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.assistant.biz.FriendlinkBiz;
import com.doadway.dwcms.assistant.dao.FriendlinkMapper;
import com.doadway.dwcms.assistant.pojo.Friendlink;
import com.doadway.dwcms.assistant.pojo.FriendlinkExample;
@Service
public class FriendlinkBizImpl implements FriendlinkBiz {
	@Resource
	FriendlinkMapper friendlinkDAO;
	public boolean batchDeleteFriendlink(String[] friendlinkIds) {
		Integer flag=0;
		for(String id:friendlinkIds){
			friendlinkDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==friendlinkIds.length){
			return true;
		}
		return false;
	}

	public boolean batchSavePriority(String[] ids, String[] prioritys) {
		Integer flag=0;
		for(int i=0;i<ids.length;i++){
			Friendlink friendlink=findFriendlinkById(Integer.parseInt(ids[i]));
			if(friendlink!=null){
				friendlink.setPriority(Integer.parseInt(prioritys[i]));
				friendlinkDAO.updateByPrimaryKeySelective(friendlink);
				flag++;
			}
		}
		if(flag==ids.length){
			return true;
		}
		return false;
	}

	public List<Friendlink> findAllFriendlinkByParams(Map<String, String> params) {
		FriendlinkExample example =new FriendlinkExample();
		if(params.get("queryCtgId")!=null&&!params.get("queryCtgId").equals("")){
			FriendlinkExample.Criteria friendlinkCri=example.createCriteria();
			friendlinkCri.andFriendlinkctgIdEqualTo(Integer.parseInt(params.get("queryCtgId")));
		}
		return friendlinkDAO.selectByExample(example );
	}

	public Friendlink findFriendlinkById(Integer friendlinkId) {
		return friendlinkDAO.selectByPrimaryKey(friendlinkId);
	}

	public Integer findMaxId() {
		return friendlinkDAO.selectMaxId();
	}

	public boolean saveOrUpdateFriendlink(Friendlink friendlink) {
		if(findFriendlinkById(friendlink.getFriendlinkId())!=null){
			return friendlinkDAO.updateByPrimaryKeySelective(friendlink)>0;
		}else{
			return friendlinkDAO.insert(friendlink)>0;
		}
	}

}
