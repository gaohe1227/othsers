package com.doadway.dwcms.assistant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.dwcms.assistant.pojo.AdvertisingSpace;
import com.doadway.dwcms.assistant.pojo.AdvertisingSpaceExample;
@Repository
public interface AdvertisingSpaceMapper {
    int countByExample(AdvertisingSpaceExample example);

    int deleteByExample(AdvertisingSpaceExample example);

    int deleteByPrimaryKey(Integer adspaceId);

    int insert(AdvertisingSpace record);

    int insertSelective(AdvertisingSpace record);

    List<AdvertisingSpace> selectByExample(AdvertisingSpaceExample example);

    AdvertisingSpace selectByPrimaryKey(Integer adspaceId);

    int updateByExampleSelective(@Param("record") AdvertisingSpace record, @Param("example") AdvertisingSpaceExample example);

    int updateByExample(@Param("record") AdvertisingSpace record, @Param("example") AdvertisingSpaceExample example);

    int updateByPrimaryKeySelective(AdvertisingSpace record);

    int updateByPrimaryKey(AdvertisingSpace record);
}