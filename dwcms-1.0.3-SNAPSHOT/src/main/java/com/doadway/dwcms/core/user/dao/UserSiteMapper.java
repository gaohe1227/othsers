package com.doadway.dwcms.core.user.dao;

import com.doadway.dwcms.core.user.pojo.UserSite;
import com.doadway.dwcms.core.user.pojo.UserSiteExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface UserSiteMapper {
    int countByExample(UserSiteExample example);

    int deleteByExample(UserSiteExample example);

    int deleteByPrimaryKey(Integer usersiteId);

    int insert(UserSite record);

    int insertSelective(UserSite record);

    List<UserSite> selectByExample(UserSiteExample example);

    UserSite selectByPrimaryKey(Integer usersiteId);

    int updateByExampleSelective(@Param("record") UserSite record, @Param("example") UserSiteExample example);

    int updateByExample(@Param("record") UserSite record, @Param("example") UserSiteExample example);

    int updateByPrimaryKeySelective(UserSite record);

    int updateByPrimaryKey(UserSite record);
}