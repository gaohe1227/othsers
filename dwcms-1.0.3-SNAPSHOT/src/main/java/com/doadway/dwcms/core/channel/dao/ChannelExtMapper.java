package com.doadway.dwcms.core.channel.dao;

import com.doadway.dwcms.core.channel.pojo.ChannelExt;
import com.doadway.dwcms.core.channel.pojo.ChannelExtExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ChannelExtMapper {
    int countByExample(ChannelExtExample example);

    int deleteByExample(ChannelExtExample example);

    int deleteByPrimaryKey(Integer channelId);

    int insert(ChannelExt record);

    int insertSelective(ChannelExt record);

    List<ChannelExt> selectByExample(ChannelExtExample example);

    ChannelExt selectByPrimaryKey(Integer channelId);

    int updateByExampleSelective(@Param("record") ChannelExt record, @Param("example") ChannelExtExample example);

    int updateByExample(@Param("record") ChannelExt record, @Param("example") ChannelExtExample example);

    int updateByPrimaryKeySelective(ChannelExt record);

    int updateByPrimaryKey(ChannelExt record);
}