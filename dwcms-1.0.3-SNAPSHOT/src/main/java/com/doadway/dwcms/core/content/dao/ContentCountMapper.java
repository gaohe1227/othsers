package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentCount;
import com.doadway.dwcms.core.content.pojo.ContentCountExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentCountMapper {
    int countByExample(ContentCountExample example);

    int deleteByExample(ContentCountExample example);

    int deleteByPrimaryKey(Integer contentId);

    int insert(ContentCount record);

    int insertSelective(ContentCount record);

    List<ContentCount> selectByExample(ContentCountExample example);

    ContentCount selectByPrimaryKey(Integer contentId);

    int updateByExampleSelective(@Param("record") ContentCount record, @Param("example") ContentCountExample example);

    int updateByExample(@Param("record") ContentCount record, @Param("example") ContentCountExample example);

    int updateByPrimaryKeySelective(ContentCount record);

    int updateByPrimaryKey(ContentCount record);
}