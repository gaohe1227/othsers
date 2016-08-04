package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentType;
import com.doadway.dwcms.core.content.pojo.ContentTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentTypeMapper {
    int countByExample(ContentTypeExample example);

    int deleteByExample(ContentTypeExample example);

    int deleteByPrimaryKey(Integer typeId);

    int insert(ContentType record);

    int insertSelective(ContentType record);

    List<ContentType> selectByExample(ContentTypeExample example);

    ContentType selectByPrimaryKey(Integer typeId);

    int updateByExampleSelective(@Param("record") ContentType record, @Param("example") ContentTypeExample example);

    int updateByExample(@Param("record") ContentType record, @Param("example") ContentTypeExample example);

    int updateByPrimaryKeySelective(ContentType record);

    int updateByPrimaryKey(ContentType record);
    
    int selectMaxId();
}