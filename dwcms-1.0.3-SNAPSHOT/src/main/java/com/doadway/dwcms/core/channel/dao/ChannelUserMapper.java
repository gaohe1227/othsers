package com.doadway.dwcms.core.channel.dao;

import com.doadway.dwcms.core.channel.pojo.ChannelUserExample;
import com.doadway.dwcms.core.channel.pojo.ChannelUserKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ChannelUserMapper {
    int countByExample(ChannelUserExample example);

    int deleteByExample(ChannelUserExample example);

    int deleteByPrimaryKey(ChannelUserKey key);

    int insert(ChannelUserKey record);

    int insertSelective(ChannelUserKey record);

    List<ChannelUserKey> selectByExample(ChannelUserExample example);

    int updateByExampleSelective(@Param("record") ChannelUserKey record, @Param("example") ChannelUserExample example);

    int updateByExample(@Param("record") ChannelUserKey record, @Param("example") ChannelUserExample example);
}