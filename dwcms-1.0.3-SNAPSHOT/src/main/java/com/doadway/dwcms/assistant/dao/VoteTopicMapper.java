package com.doadway.dwcms.assistant.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.pojo.VoteTopic;
import com.doadway.dwcms.assistant.pojo.VoteTopicExample;
@Repository
public interface VoteTopicMapper {
    int countByExample(VoteTopicExample example);

    int deleteByExample(VoteTopicExample example);

    int deleteByPrimaryKey(Integer votetopicId);

    int insert(VoteTopic record);

    int insertSelective(VoteTopic record);

    List<VoteTopic> selectByExample(VoteTopicExample example);

    VoteTopic selectByPrimaryKey(Integer votetopicId);

    int updateByExampleSelective(@Param("record") VoteTopic record, @Param("example") VoteTopicExample example);

    int updateByExample(@Param("record") VoteTopic record, @Param("example") VoteTopicExample example);

    int updateByPrimaryKeySelective(VoteTopic record);

    int updateByPrimaryKey(VoteTopic record);
    
    List<VoteTopic> selectByPage(@Param("page")Page page,@Param("params")Map<String,Object> params);
    int selectMaxId();
}