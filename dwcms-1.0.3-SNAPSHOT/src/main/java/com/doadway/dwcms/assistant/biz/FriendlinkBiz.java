package com.doadway.dwcms.assistant.biz;

import java.util.List;
import java.util.Map;

import com.doadway.dwcms.assistant.pojo.Friendlink;

public interface FriendlinkBiz {
	public boolean saveOrUpdateFriendlink(Friendlink friendlink);
	
	public boolean batchDeleteFriendlink(String[] friendlinkIds);
	
	public List<Friendlink> findAllFriendlinkByParams(Map<String,String> params);
	
	public Friendlink  findFriendlinkById(Integer friendlinkId);
	
	public Integer  findMaxId();
	
	public boolean batchSavePriority(String ids[],String[] prioritys);
}
