package com.doadway.dwcms.core.config.dao;

import com.doadway.dwcms.core.config.pojo.ConfigAttr;
import com.doadway.dwcms.core.config.pojo.ConfigAttrExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ConfigAttrMapper {
    int countByExample(ConfigAttrExample example);

    int deleteByExample(ConfigAttrExample example);

    int insert(ConfigAttr record);

    int insertSelective(ConfigAttr record);

    List<ConfigAttr> selectByExample(ConfigAttrExample example);

    int updateByExampleSelective(@Param("record") ConfigAttr record, @Param("example") ConfigAttrExample example);

    int updateByExample(@Param("record") ConfigAttr record, @Param("example") ConfigAttrExample example);
}