package com.doadway.dwcms.core.content.biz;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.content.enums.ContentStatusEnum;
import com.doadway.dwcms.core.content.pojo.ContentGroupViewKey;
import com.doadway.dwcms.core.content.pojo.ContentTopicKey;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;

public interface ContentBiz {
	public List<ContentDTO> findContentByPage(Page page,Map<String, Object> params);
	
	public List<ContentDTO>  findListForIndex(@Param("siteId") Integer siteId,@Param("channelId")  Integer channelId,
			   @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("startId") Integer startId, @Param("max") Integer max);	    

	public ContentDTO findContentById(String contentId);
	public boolean batchUpdateContentStatus(String[] contentIds,ContentStatusEnum statusEnum);
	public boolean batchReject(String[] contentIds, Integer isReject);
	public boolean batchDeleteContents(String[] contentIds);
	public boolean saveOrUpdateContents(ContentDTO contentDto);
	public Integer findMaxId();
	public Integer findMaxPriorityForPic();
	public String  findTagString(String contentId);
	public List<ContentGroupViewKey> findContentGroupView(Integer contentId);	
	public List<ContentTopicKey> findContentTopicKey(Integer contentId);	
}
