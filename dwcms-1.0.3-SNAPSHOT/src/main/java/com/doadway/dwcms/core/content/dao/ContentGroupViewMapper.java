package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentGroupViewExample;
import com.doadway.dwcms.core.content.pojo.ContentGroupViewKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentGroupViewMapper {
    int countByExample(ContentGroupViewExample example);

    int deleteByExample(ContentGroupViewExample example);

    int deleteByPrimaryKey(ContentGroupViewKey key);

    int insert(ContentGroupViewKey record);

    int insertSelective(ContentGroupViewKey record);

    List<ContentGroupViewKey> selectByExample(ContentGroupViewExample example);

    int updateByExampleSelective(@Param("record") ContentGroupViewKey record, @Param("example") ContentGroupViewExample example);

    int updateByExample(@Param("record") ContentGroupViewKey record, @Param("example") ContentGroupViewExample example);
}