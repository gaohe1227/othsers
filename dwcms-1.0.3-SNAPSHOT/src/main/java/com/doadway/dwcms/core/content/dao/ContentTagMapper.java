package com.doadway.dwcms.core.content.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.content.pojo.ContentTag;
import com.doadway.dwcms.core.content.pojo.ContentTagExample;
@Repository
public interface ContentTagMapper {
    int countByExample(ContentTagExample example);

    int deleteByExample(ContentTagExample example);

    int deleteByPrimaryKey(Integer tagId);

    int insert(ContentTag record);

    int insertSelective(ContentTag record);

    List<ContentTag> selectByExample(ContentTagExample example);

    ContentTag selectByPrimaryKey(Integer tagId);

    int updateByExampleSelective(@Param("record") ContentTag record, @Param("example") ContentTagExample example);

    int updateByExample(@Param("record") ContentTag record, @Param("example") ContentTagExample example);

    int updateByPrimaryKeySelective(ContentTag record);

    int updateByPrimaryKey(ContentTag record);
    
    public int selectMaxId();
    
    public List<ContentTag> selectByPage(@Param("page")Page page,@Param("params")Map<String, Object> params);
}