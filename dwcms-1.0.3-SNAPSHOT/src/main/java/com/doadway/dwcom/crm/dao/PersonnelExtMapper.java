package com.doadway.dwcom.crm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.common.page.Page;
import com.doadway.dwcom.crm.pojo.PersonnelExt;
import com.doadway.dwcom.crm.pojo.PersonnelExtExample;
@Repository
public interface PersonnelExtMapper {
    int countByExample(PersonnelExtExample example);

    int deleteByExample(PersonnelExtExample example);

    int deleteByPrimaryKey(Integer personnelId);

    int insert(PersonnelExt record);

    int insertSelective(PersonnelExt record);

    List<PersonnelExt> selectByExample(PersonnelExtExample example);

    PersonnelExt selectByPrimaryKey(Integer personnelId);

    int updateByExampleSelective(@Param("record") PersonnelExt record, @Param("example") PersonnelExtExample example);

    int updateByExample(@Param("record") PersonnelExt record, @Param("example") PersonnelExtExample example);

    int updateByPrimaryKeySelective(PersonnelExt record);

    int updateByPrimaryKey(PersonnelExt record);
    
    List<PersonnelExt> selectByPage(@Param("page")Page page,@Param("params")Map<String,Object> params);
}