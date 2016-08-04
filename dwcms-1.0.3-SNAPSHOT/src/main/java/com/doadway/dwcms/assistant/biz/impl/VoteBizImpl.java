package com.doadway.dwcms.assistant.biz.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.biz.VoteBiz;
import com.doadway.dwcms.assistant.dao.VoteItemMapper;
import com.doadway.dwcms.assistant.dao.VoteTopicMapper;
import com.doadway.dwcms.assistant.pojo.VoteItem;
import com.doadway.dwcms.assistant.pojo.VoteItemExample;
import com.doadway.dwcms.assistant.pojo.VoteTopic;
import com.doadway.dwcms.assistant.pojo.dto.VoteDTO;
@Service
public class VoteBizImpl implements VoteBiz {
	@Resource
	VoteTopicMapper voteTopicDAO;
	@Resource
	VoteItemMapper voteItemDAO;
	public boolean batchDeleteVote(String[] voteTopicIds) {
		Integer flag=0;
		for(String id:voteTopicIds){
			VoteItemExample example=new VoteItemExample();
			VoteItemExample.Criteria commentExtCri = example.createCriteria();
			commentExtCri.andVotetopicIdEqualTo(Integer.parseInt(id));
			voteItemDAO.deleteByExample(example);
			
			voteTopicDAO.deleteByPrimaryKey(Integer.parseInt(id));
			
			flag++;
		}
		if(flag==voteTopicIds.length){
			return true;
		}
		return false;
	}

	public VoteDTO findVoteById(Integer voteTopicId) {
		VoteDTO voteDto = new VoteDTO();
		VoteTopic voteTopic=voteTopicDAO.selectByPrimaryKey(voteTopicId);
		if(voteTopic!=null){
			BeanUtils.copyProperties(voteTopic, voteDto);
			
			VoteItemExample example=new VoteItemExample();
			VoteItemExample.Criteria commentExtCri = example.createCriteria();
			commentExtCri.andVotetopicIdEqualTo(voteTopic.getVotetopicId());
			List<VoteItem> voteItemList=voteItemDAO.selectByExample(example);
			if(voteItemList!=null){
				voteDto.setVoteItemList(voteItemList);
			}
			return voteDto;
		}
		return null;
	}

	public List<VoteDTO> findVoteByPage(Page page, Map<String, Object> params) {
		List<VoteDTO> voteDtoList = new ArrayList<VoteDTO>();
		List<VoteTopic> voteTopicList=voteTopicDAO.selectByPage(page, params);
		if(voteTopicList.size()>0){
			for(VoteTopic vTopic:voteTopicList){
				VoteDTO voteDto=new VoteDTO();
				BeanUtils.copyProperties(vTopic, voteDto);
				voteDtoList.add(voteDto);
			}
		}
		return voteDtoList;
	}

	public boolean saveOrUpdateVote(VoteDTO voteDto) {
		if(voteDto==null){return false;}
		if(findVoteById(voteDto.getVotetopicId())!=null){
			VoteTopic vTopic = new VoteTopic();
			BeanUtils.copyProperties(voteDto, vTopic);
			voteTopicDAO.updateByPrimaryKeySelective(vTopic);
			

			
			if(voteDto.getVoteItemList().size()>0){
				VoteItemExample example=new VoteItemExample();
				VoteItemExample.Criteria commentExtCri = example.createCriteria();
				commentExtCri.andVotetopicIdEqualTo(voteDto.getVotetopicId());
				voteItemDAO.deleteByExample(example);
				for(VoteItem vItem:voteDto.getVoteItemList()){
					voteItemDAO.insert(vItem);
				}
			}
			return true;
		}else{
			VoteTopic vTopic = new VoteTopic();
			BeanUtils.copyProperties(voteDto, vTopic);
			voteTopicDAO.insert(vTopic);
				
			if(voteDto.getVoteItemList().size()>0){
				VoteItemExample example=new VoteItemExample();
				VoteItemExample.Criteria commentExtCri = example.createCriteria();
				commentExtCri.andVotetopicIdEqualTo(voteDto.getVotetopicId());
				voteItemDAO.deleteByExample(example);
				for(VoteItem vItem:voteDto.getVoteItemList()){
					voteItemDAO.insert(vItem);
				}
			}
			return true;
		}
	}

	public Integer findMaxId() {
		return voteTopicDAO.selectMaxId();
	}

}
