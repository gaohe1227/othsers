package com.doadway.dwcms.core.config.dao;

import com.doadway.dwcms.core.config.pojo.SiteTxt;
import com.doadway.dwcms.core.config.pojo.SiteTxtExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SiteTxtMapper {
    int countByExample(SiteTxtExample example);

    int deleteByExample(SiteTxtExample example);

    int insert(SiteTxt record);

    int insertSelective(SiteTxt record);

    List<SiteTxt> selectByExampleWithBLOBs(SiteTxtExample example);

    List<SiteTxt> selectByExample(SiteTxtExample example);

    int updateByExampleSelective(@Param("record") SiteTxt record, @Param("example") SiteTxtExample example);

    int updateByExampleWithBLOBs(@Param("record") SiteTxt record, @Param("example") SiteTxtExample example);

    int updateByExample(@Param("record") SiteTxt record, @Param("example") SiteTxtExample example);
}