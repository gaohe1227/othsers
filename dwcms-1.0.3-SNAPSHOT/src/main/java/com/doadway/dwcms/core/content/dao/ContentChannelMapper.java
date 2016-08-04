package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentChannelExample;
import com.doadway.dwcms.core.content.pojo.ContentChannelKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentChannelMapper {
    int countByExample(ContentChannelExample example);

    int deleteByExample(ContentChannelExample example);

    int deleteByPrimaryKey(ContentChannelKey key);

    int insert(ContentChannelKey record);

    int insertSelective(ContentChannelKey record);

    List<ContentChannelKey> selectByExample(ContentChannelExample example);

    int updateByExampleSelective(@Param("record") ContentChannelKey record, @Param("example") ContentChannelExample example);

    int updateByExample(@Param("record") ContentChannelKey record, @Param("example") ContentChannelExample example);
}