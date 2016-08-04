package com.doadway.dwcms.assistant.biz;

import java.util.List;

import com.doadway.dwcms.assistant.pojo.FriendlinkCtg;
public interface FriendlinkCtgBiz {
	public boolean saveFriendlinkCtg(FriendlinkCtg friendlinkCtg);
	public FriendlinkCtg findFriendlinkCtgById(Integer friendlinkctgId);
	public List<FriendlinkCtg> findAllFriendlinkCtg();
	public boolean batchDeleteFriendlinkCtg(String[] friendlinkCtgIds);
	public boolean batchUpdate(List<FriendlinkCtg> newFriendlinkCtgList);
}
