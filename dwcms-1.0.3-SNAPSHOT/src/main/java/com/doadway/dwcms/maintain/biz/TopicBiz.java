package com.doadway.dwcms.maintain.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcms.maintain.pojo.Topic;

public interface TopicBiz {
	public boolean saveOrUpdateTopic(Topic topic);
	
	public boolean batchDeleteTopic(String[] topicId);
	
	public boolean savePriority(String[] topicIds ,String[] prioritys);
	
	public List<Topic> findTopicByPage(Page page,Map<String,Object> params);
	
	public Topic  findTopicById(Integer topicId);
}
