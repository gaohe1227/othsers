package com.doadway.dwcms.maintain.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.dwcms.maintain.pojo.Sensitivity;
import com.doadway.dwcms.maintain.pojo.SensitivityExample;
@Repository
public interface SensitivityMapper {
    int countByExample(SensitivityExample example);

    int deleteByExample(SensitivityExample example);

    int deleteByPrimaryKey(Integer sensitivityId);

    int insert(Sensitivity record);

    int insertSelective(Sensitivity record);

    List<Sensitivity> selectByExample(SensitivityExample example);

    Sensitivity selectByPrimaryKey(Integer sensitivityId);

    int updateByExampleSelective(@Param("record") Sensitivity record, @Param("example") SensitivityExample example);

    int updateByExample(@Param("record") Sensitivity record, @Param("example") SensitivityExample example);

    int updateByPrimaryKeySelective(Sensitivity record);

    int updateByPrimaryKey(Sensitivity record);
}