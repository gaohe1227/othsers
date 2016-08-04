package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentTopicExample;
import com.doadway.dwcms.core.content.pojo.ContentTopicKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentTopicMapper {
    int countByExample(ContentTopicExample example);

    int deleteByExample(ContentTopicExample example);

    int deleteByPrimaryKey(ContentTopicKey key);

    int insert(ContentTopicKey record);

    int insertSelective(ContentTopicKey record);

    List<ContentTopicKey> selectByExample(ContentTopicExample example);

    int updateByExampleSelective(@Param("record") ContentTopicKey record, @Param("example") ContentTopicExample example);

    int updateByExample(@Param("record") ContentTopicKey record, @Param("example") ContentTopicExample example);
}