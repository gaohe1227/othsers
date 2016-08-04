package com.doadway.dwcms.assistant.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.pojo.Advertising;
import com.doadway.dwcms.assistant.pojo.AdvertisingExample;
@Repository
public interface AdvertisingMapper {
    int countByExample(AdvertisingExample example);

    int deleteByExample(AdvertisingExample example);

    int deleteByPrimaryKey(Integer advertisingId);

    int insert(Advertising record);

    int insertSelective(Advertising record);

    List<Advertising> selectByExampleWithBLOBs(AdvertisingExample example);

    List<Advertising> selectByExample(AdvertisingExample example);

    Advertising selectByPrimaryKey(Integer advertisingId);

    int updateByExampleSelective(@Param("record") Advertising record, @Param("example") AdvertisingExample example);

    int updateByExampleWithBLOBs(@Param("record") Advertising record, @Param("example") AdvertisingExample example);

    int updateByExample(@Param("record") Advertising record, @Param("example") AdvertisingExample example);

    int updateByPrimaryKeySelective(Advertising record);

    int updateByPrimaryKeyWithBLOBs(Advertising record);

    int updateByPrimaryKey(Advertising record);
    
    int selectMaxId();
    
    List<Advertising> selectByPage(@Param("page")Page page,@Param("params")Map<String,String> params);
}