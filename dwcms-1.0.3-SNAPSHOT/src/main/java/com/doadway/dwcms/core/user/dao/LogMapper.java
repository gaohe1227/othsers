package com.doadway.dwcms.core.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.user.pojo.Log;
import com.doadway.dwcms.core.user.pojo.LogExample;
@Repository
public interface LogMapper {
    int countByExample(LogExample example);

    int deleteByExample(LogExample example);

    int deleteByPrimaryKey(Integer logId);

    int insert(Log record);

    int insertSelective(Log record);

    List<Log> selectByExample(LogExample example);

    Log selectByPrimaryKey(Integer logId);

    int updateByExampleSelective(@Param("record") Log record, @Param("example") LogExample example);

    int updateByExample(@Param("record") Log record, @Param("example") LogExample example);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);
    
    List<Log> selectByPage(@Param("page")Page page,@Param("params")Map<String,Object> params);
    
    int deleteInterValOneThreeMonth();
    
    int deleteInterValOneWeek();
    
    int deleteInterValOneMonth();
    
    int deleteInterValOneYear();
}