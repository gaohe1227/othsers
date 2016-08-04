package com.doadway.dwcms.core.config.dao;

import com.doadway.dwcms.core.config.pojo.SiteModel;
import com.doadway.dwcms.core.config.pojo.SiteModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SiteModelMapper {
    int countByExample(SiteModelExample example);

    int deleteByExample(SiteModelExample example);

    int deleteByPrimaryKey(Integer modelId);

    int insert(SiteModel record);

    int insertSelective(SiteModel record);

    List<SiteModel> selectByExample(SiteModelExample example);

    SiteModel selectByPrimaryKey(Integer modelId);

    int updateByExampleSelective(@Param("record") SiteModel record, @Param("example") SiteModelExample example);

    int updateByExample(@Param("record") SiteModel record, @Param("example") SiteModelExample example);

    int updateByPrimaryKeySelective(SiteModel record);

    int updateByPrimaryKey(SiteModel record);
}