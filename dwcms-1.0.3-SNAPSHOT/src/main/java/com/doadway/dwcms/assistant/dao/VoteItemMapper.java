package com.doadway.dwcms.assistant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.dwcms.assistant.pojo.VoteItem;
import com.doadway.dwcms.assistant.pojo.VoteItemExample;
@Repository
public interface VoteItemMapper {
    int countByExample(VoteItemExample example);

    int deleteByExample(VoteItemExample example);

    int deleteByPrimaryKey(Integer voteitemId);

    int insert(VoteItem record);

    int insertSelective(VoteItem record);

    List<VoteItem> selectByExample(VoteItemExample example);

    VoteItem selectByPrimaryKey(Integer voteitemId);

    int updateByExampleSelective(@Param("record") VoteItem record, @Param("example") VoteItemExample example);

    int updateByExample(@Param("record") VoteItem record, @Param("example") VoteItemExample example);

    int updateByPrimaryKeySelective(VoteItem record);

    int updateByPrimaryKey(VoteItem record);
}