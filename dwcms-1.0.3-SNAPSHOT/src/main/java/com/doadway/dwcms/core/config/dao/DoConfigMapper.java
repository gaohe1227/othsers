package com.doadway.dwcms.core.config.dao;

import com.doadway.dwcms.core.config.pojo.DoConfig;
import com.doadway.dwcms.core.config.pojo.DoConfigExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface DoConfigMapper {
    int countByExample(DoConfigExample example);

    int deleteByExample(DoConfigExample example);

    int deleteByPrimaryKey(String cfgKey);

    int insert(DoConfig record);

    int insertSelective(DoConfig record);

    List<DoConfig> selectByExample(DoConfigExample example);

    DoConfig selectByPrimaryKey(String cfgKey);

    int updateByExampleSelective(@Param("record") DoConfig record, @Param("example") DoConfigExample example);

    int updateByExample(@Param("record") DoConfig record, @Param("example") DoConfigExample example);

    int updateByPrimaryKeySelective(DoConfig record);

    int updateByPrimaryKey(DoConfig record);
}