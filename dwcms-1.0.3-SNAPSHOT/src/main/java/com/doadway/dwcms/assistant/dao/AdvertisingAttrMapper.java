package com.doadway.dwcms.assistant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.dwcms.assistant.pojo.AdvertisingAttr;
import com.doadway.dwcms.assistant.pojo.AdvertisingAttrExample;
@Repository
public interface AdvertisingAttrMapper {
    int countByExample(AdvertisingAttrExample example);

    int deleteByExample(AdvertisingAttrExample example);

    int insert(AdvertisingAttr record);

    int insertSelective(AdvertisingAttr record);

    List<AdvertisingAttr> selectByExample(AdvertisingAttrExample example);

    int updateByExampleSelective(@Param("record") AdvertisingAttr record, @Param("example") AdvertisingAttrExample example);

    int updateByExample(@Param("record") AdvertisingAttr record, @Param("example") AdvertisingAttrExample example);
}