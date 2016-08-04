package com.doadway.dwcms.core.channel.dao;

import com.doadway.dwcms.core.channel.pojo.ChannelTxt;
import com.doadway.dwcms.core.channel.pojo.ChannelTxtExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ChannelTxtMapper {
    int countByExample(ChannelTxtExample example);

    int deleteByExample(ChannelTxtExample example);

    int deleteByPrimaryKey(Integer channelId);

    int insert(ChannelTxt record);

    int insertSelective(ChannelTxt record);

    List<ChannelTxt> selectByExampleWithBLOBs(ChannelTxtExample example);

    List<ChannelTxt> selectByExample(ChannelTxtExample example);

    ChannelTxt selectByPrimaryKey(Integer channelId);

    int updateByExampleSelective(@Param("record") ChannelTxt record, @Param("example") ChannelTxtExample example);

    int updateByExampleWithBLOBs(@Param("record") ChannelTxt record, @Param("example") ChannelTxtExample example);

    int updateByExample(@Param("record") ChannelTxt record, @Param("example") ChannelTxtExample example);

    int updateByPrimaryKeySelective(ChannelTxt record);

    int updateByPrimaryKeyWithBLOBs(ChannelTxt record);
}