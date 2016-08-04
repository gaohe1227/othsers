package com.doadway.dwcms.core.channel.dao;

import com.doadway.dwcms.core.channel.pojo.ChannelAttr;
import com.doadway.dwcms.core.channel.pojo.ChannelAttrExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ChannelAttrMapper {
    int countByExample(ChannelAttrExample example);

    int deleteByExample(ChannelAttrExample example);

    int insert(ChannelAttr record);

    int insertSelective(ChannelAttr record);

    List<ChannelAttr> selectByExample(ChannelAttrExample example);

    int updateByExampleSelective(@Param("record") ChannelAttr record, @Param("example") ChannelAttrExample example);

    int updateByExample(@Param("record") ChannelAttr record, @Param("example") ChannelAttrExample example);
}