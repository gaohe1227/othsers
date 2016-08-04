package com.doadway.dwcms.core.channel.biz;

import java.util.List;
import java.util.Map;

import com.doadway.dwcms.core.channel.pojo.ChnlGroupContriKey;
import com.doadway.dwcms.core.channel.pojo.ChnlGroupViewKey;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;
import com.doadway.dwcms.core.config.pojo.Model;

public interface ChannelBiz {
	public boolean batchDeleteChannelByIds(String[] ids);
	public boolean savePriority(String[] ids,String[] prioritys);
	public boolean ifHaveContentsByChannelId(Integer id);
	public boolean isParentChannel(Integer id);
	public boolean saveOrUpdateChannel(ChannelDTO channelDto);
	public ChannelDTO findChannelById(Integer id);
	public List<ChannelDTO> findChannelsByParentId(Integer id);
	public ChannelDTO findParentChannelByParentId(Integer parentId);
	public Model findChannelModelById(Integer id);
	public Integer findMaxId();
	
	public List<Map<String,Object>> createChannelTree(String parentId);
	public List<Map<String,Object>> createZTree(String parentId);
	public List<Map<String,Object>> createAsyncZtreeByParentId(String parentId);
	public List<Map<String,Object>> createAsyncEasyTreeByParentId(String parentId);
	
	public List<ChnlGroupContriKey> findChnlContriGroup(Integer channelId);
	
	public List<ChnlGroupViewKey> findChnlGroupView(Integer channelId);
}
