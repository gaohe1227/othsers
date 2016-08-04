package com.doadway.dwcms.core.channel.dao;

import com.doadway.dwcms.core.channel.pojo.ChnlGroupViewExample;
import com.doadway.dwcms.core.channel.pojo.ChnlGroupViewKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ChnlGroupViewMapper {
    int countByExample(ChnlGroupViewExample example);

    int deleteByExample(ChnlGroupViewExample example);

    int deleteByPrimaryKey(ChnlGroupViewKey key);

    int insert(ChnlGroupViewKey record);

    int insertSelective(ChnlGroupViewKey record);

    List<ChnlGroupViewKey> selectByExample(ChnlGroupViewExample example);

    int updateByExampleSelective(@Param("record") ChnlGroupViewKey record, @Param("example") ChnlGroupViewExample example);

    int updateByExample(@Param("record") ChnlGroupViewKey record, @Param("example") ChnlGroupViewExample example);
}