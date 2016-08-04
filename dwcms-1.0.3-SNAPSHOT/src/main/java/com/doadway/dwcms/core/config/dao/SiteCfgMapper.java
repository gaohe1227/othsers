package com.doadway.dwcms.core.config.dao;

import com.doadway.dwcms.core.config.pojo.SiteCfg;
import com.doadway.dwcms.core.config.pojo.SiteCfgExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SiteCfgMapper {
    int countByExample(SiteCfgExample example);

    int deleteByExample(SiteCfgExample example);

    int insert(SiteCfg record);

    int insertSelective(SiteCfg record);

    List<SiteCfg> selectByExample(SiteCfgExample example);

    int updateByExampleSelective(@Param("record") SiteCfg record, @Param("example") SiteCfgExample example);

    int updateByExample(@Param("record") SiteCfg record, @Param("example") SiteCfgExample example);
}