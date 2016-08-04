package com.doadway.dwcms.assistant.dao;

import com.doadway.dwcms.assistant.pojo.Acquisition;
import com.doadway.dwcms.assistant.pojo.AcquisitionExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface AcquisitionMapper {
    int countByExample(AcquisitionExample example);

    int deleteByExample(AcquisitionExample example);

    int deleteByPrimaryKey(Integer acquisitionId);

    int insert(Acquisition record);

    int insertSelective(Acquisition record);

    List<Acquisition> selectByExampleWithBLOBs(AcquisitionExample example);

    List<Acquisition> selectByExample(AcquisitionExample example);

    Acquisition selectByPrimaryKey(Integer acquisitionId);

    int updateByExampleSelective(@Param("record") Acquisition record, @Param("example") AcquisitionExample example);

    int updateByExampleWithBLOBs(@Param("record") Acquisition record, @Param("example") AcquisitionExample example);

    int updateByExample(@Param("record") Acquisition record, @Param("example") AcquisitionExample example);

    int updateByPrimaryKeySelective(Acquisition record);

    int updateByPrimaryKeyWithBLOBs(Acquisition record);

    int updateByPrimaryKey(Acquisition record);
}