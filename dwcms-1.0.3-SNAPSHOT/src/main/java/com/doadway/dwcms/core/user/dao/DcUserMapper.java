package com.doadway.dwcms.core.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.user.pojo.DcUser;
import com.doadway.dwcms.core.user.pojo.DcUserExample;
@Repository
public interface DcUserMapper {
    int countByExample(DcUserExample example);

    int deleteByExample(DcUserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(DcUser record);

    int insertSelective(DcUser record);

    List<DcUser> selectByExample(DcUserExample example);

    DcUser selectByPrimaryKey(Integer userId);

    int updateByExampleSelective(@Param("record") DcUser record, @Param("example") DcUserExample example);

    int updateByExample(@Param("record") DcUser record, @Param("example") DcUserExample example);

    int updateByPrimaryKeySelective(DcUser record);

    int updateByPrimaryKey(DcUser record);
    
    int selectMaxId();
    
    List<DcUser> selectByPage(@Param("page")Page page,@Param("params")Map<String,Object> params);
}