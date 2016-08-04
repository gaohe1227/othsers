package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentExt;
import com.doadway.dwcms.core.content.pojo.ContentExtExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentExtMapper {
    int countByExample(ContentExtExample example);

    int deleteByExample(ContentExtExample example);

    int deleteByPrimaryKey(Integer contentId);

    int insert(ContentExt record);

    int insertSelective(ContentExt record);

    List<ContentExt> selectByExample(ContentExtExample example);

    ContentExt selectByPrimaryKey(Integer contentId);

    int updateByExampleSelective(@Param("record") ContentExt record, @Param("example") ContentExtExample example);

    int updateByExample(@Param("record") ContentExt record, @Param("example") ContentExtExample example);

    int updateByPrimaryKeySelective(ContentExt record);

    int updateByPrimaryKey(ContentExt record);
}