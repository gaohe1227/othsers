package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentTagRelate;
import com.doadway.dwcms.core.content.pojo.ContentTagRelateExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentTagRelateMapper {
    int countByExample(ContentTagRelateExample example);

    int deleteByExample(ContentTagRelateExample example);

    int insert(ContentTagRelate record);

    int insertSelective(ContentTagRelate record);

    List<ContentTagRelate> selectByExample(ContentTagRelateExample example);

    int updateByExampleSelective(@Param("record") ContentTagRelate record, @Param("example") ContentTagRelateExample example);

    int updateByExample(@Param("record") ContentTagRelate record, @Param("example") ContentTagRelateExample example);
    
    int countDocNumbersByTagId(@Param("tagId")Integer tagId);
}