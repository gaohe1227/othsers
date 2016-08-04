package com.doadway.dwcms.core.channel.dao;

import com.doadway.dwcms.core.channel.pojo.ChnlGroupContriExample;
import com.doadway.dwcms.core.channel.pojo.ChnlGroupContriKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ChnlGroupContriMapper {
    int countByExample(ChnlGroupContriExample example);

    int deleteByExample(ChnlGroupContriExample example);

    int deleteByPrimaryKey(ChnlGroupContriKey key);

    int insert(ChnlGroupContriKey record);

    int insertSelective(ChnlGroupContriKey record);

    List<ChnlGroupContriKey> selectByExample(ChnlGroupContriExample example);

    int updateByExampleSelective(@Param("record") ChnlGroupContriKey record, @Param("example") ChnlGroupContriExample example);

    int updateByExample(@Param("record") ChnlGroupContriKey record, @Param("example") ChnlGroupContriExample example);
}