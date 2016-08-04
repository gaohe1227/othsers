package com.doadway.dwcms.assistant.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.pojo.dto.VoteDTO;

public interface VoteBiz {
	public boolean saveOrUpdateVote(VoteDTO voteDto);
	
	public boolean batchDeleteVote(String[] voteTopicIds);
	
	
	public List<VoteDTO> findVoteByPage(Page page,Map<String,Object> params);
	
	public VoteDTO  findVoteById(Integer voteTopicId);
	public Integer  findMaxId();
}
