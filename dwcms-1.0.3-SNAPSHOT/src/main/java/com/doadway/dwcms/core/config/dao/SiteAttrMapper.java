package com.doadway.dwcms.core.config.dao;

import com.doadway.dwcms.core.config.pojo.SiteAttr;
import com.doadway.dwcms.core.config.pojo.SiteAttrExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SiteAttrMapper {
    int countByExample(SiteAttrExample example);

    int deleteByExample(SiteAttrExample example);

    int insert(SiteAttr record);

    int insertSelective(SiteAttr record);

    List<SiteAttr> selectByExample(SiteAttrExample example);

    int updateByExampleSelective(@Param("record") SiteAttr record, @Param("example") SiteAttrExample example);

    int updateByExample(@Param("record") SiteAttr record, @Param("example") SiteAttrExample example);
}