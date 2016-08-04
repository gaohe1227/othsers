package com.doadway.dwcms.core.user.dao;

import com.doadway.dwcms.core.user.pojo.DoUser;
import com.doadway.dwcms.core.user.pojo.DoUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface DoUserMapper {
    int countByExample(DoUserExample example);

    int deleteByExample(DoUserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(DoUser record);

    int insertSelective(DoUser record);

    List<DoUser> selectByExample(DoUserExample example);

    DoUser selectByPrimaryKey(Integer userId);

    int updateByExampleSelective(@Param("record") DoUser record, @Param("example") DoUserExample example);

    int updateByExample(@Param("record") DoUser record, @Param("example") DoUserExample example);

    int updateByPrimaryKeySelective(DoUser record);

    int updateByPrimaryKey(DoUser record);
}