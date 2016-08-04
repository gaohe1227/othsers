package com.doadway.dwcms.assistant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.dwcms.assistant.pojo.VoteRecord;
import com.doadway.dwcms.assistant.pojo.VoteRecordExample;
@Repository
public interface VoteRecordMapper {
    int countByExample(VoteRecordExample example);

    int deleteByExample(VoteRecordExample example);

    int deleteByPrimaryKey(Integer voterecoredId);

    int insert(VoteRecord record);

    int insertSelective(VoteRecord record);

    List<VoteRecord> selectByExample(VoteRecordExample example);

    VoteRecord selectByPrimaryKey(Integer voterecoredId);

    int updateByExampleSelective(@Param("record") VoteRecord record, @Param("example") VoteRecordExample example);

    int updateByExample(@Param("record") VoteRecord record, @Param("example") VoteRecordExample example);

    int updateByPrimaryKeySelective(VoteRecord record);

    int updateByPrimaryKey(VoteRecord record);
}