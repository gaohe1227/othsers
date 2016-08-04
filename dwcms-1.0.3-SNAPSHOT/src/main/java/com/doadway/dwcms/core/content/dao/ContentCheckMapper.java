package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentCheck;
import com.doadway.dwcms.core.content.pojo.ContentCheckExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentCheckMapper {
    int countByExample(ContentCheckExample example);

    int deleteByExample(ContentCheckExample example);

    int deleteByPrimaryKey(Integer contentId);

    int insert(ContentCheck record);

    int insertSelective(ContentCheck record);

    List<ContentCheck> selectByExample(ContentCheckExample example);

    ContentCheck selectByPrimaryKey(Integer contentId);

    int updateByExampleSelective(@Param("record") ContentCheck record, @Param("example") ContentCheckExample example);

    int updateByExample(@Param("record") ContentCheck record, @Param("example") ContentCheckExample example);

    int updateByPrimaryKeySelective(ContentCheck record);

    int updateByPrimaryKey(ContentCheck record);
}