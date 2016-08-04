package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentAttr;
import com.doadway.dwcms.core.content.pojo.ContentAttrExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentAttrMapper {
    int countByExample(ContentAttrExample example);

    int deleteByExample(ContentAttrExample example);

    int insert(ContentAttr record);

    int insertSelective(ContentAttr record);

    List<ContentAttr> selectByExample(ContentAttrExample example);

    int updateByExampleSelective(@Param("record") ContentAttr record, @Param("example") ContentAttrExample example);

    int updateByExample(@Param("record") ContentAttr record, @Param("example") ContentAttrExample example);
}