package com.doadway.dwcms.maintain.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcms.maintain.biz.TopicBiz;
import com.doadway.dwcms.maintain.dao.TopicMapper;
import com.doadway.dwcms.maintain.pojo.Topic;
@Service
public class TopicBizImpl implements TopicBiz{
	@Resource
	TopicMapper topicDAO;
	public boolean batchDeleteTopic(String[] topicId) {
		Integer flag=0;
		for(String id:topicId){
			topicDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==topicId.length){
			return true;
		}
		return false;
	}

	public Topic findTopicById(Integer topicId) {
		return topicDAO.selectByPrimaryKey(topicId);
	}

	public List<Topic> findTopicByPage(Page page, Map<String, Object> params) {
		return topicDAO.selectByPage(page,params);
	}

	public boolean saveOrUpdateTopic(Topic topic) {
		if(topic.getTopicId()!=null&&!"".equals(topic.getTopicId())){
			return topicDAO.updateByPrimaryKeySelective(topic)>0;
		}else{
			return topicDAO.insert(topic)>0;
		}
	}

	public boolean savePriority(String[] topicIds, String[] prioritys) {
		Integer flag = 0;
		for(String id:topicIds){
			Topic topic = this.findTopicById(Integer.parseInt(id));
			topic.setPriority(Integer.parseInt(prioritys[flag]));
			this.saveOrUpdateTopic(topic);
			if(flag==topicIds.length-1){
				return true;
			}			
			flag++;
		}
		return false;
	}

}
