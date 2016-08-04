package com.doadway.dwcms.assistant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.dwcms.assistant.pojo.FriendlinkCtg;
import com.doadway.dwcms.assistant.pojo.FriendlinkCtgExample;
@Repository
public interface FriendlinkCtgMapper {
    int countByExample(FriendlinkCtgExample example);

    int deleteByExample(FriendlinkCtgExample example);

    int deleteByPrimaryKey(Integer friendlinkctgId);

    int insert(FriendlinkCtg record);

    int insertSelective(FriendlinkCtg record);

    List<FriendlinkCtg> selectByExample(FriendlinkCtgExample example);

    FriendlinkCtg selectByPrimaryKey(Integer friendlinkctgId);

    int updateByExampleSelective(@Param("record") FriendlinkCtg record, @Param("example") FriendlinkCtgExample example);

    int updateByExample(@Param("record") FriendlinkCtg record, @Param("example") FriendlinkCtgExample example);

    int updateByPrimaryKeySelective(FriendlinkCtg record);

    int updateByPrimaryKey(FriendlinkCtg record);
}