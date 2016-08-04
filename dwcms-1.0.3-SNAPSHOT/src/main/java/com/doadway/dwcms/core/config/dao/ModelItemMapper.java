package com.doadway.dwcms.core.config.dao;

import com.doadway.dwcms.core.config.pojo.ModelItem;
import com.doadway.dwcms.core.config.pojo.ModelItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ModelItemMapper {
    int countByExample(ModelItemExample example);

    int deleteByExample(ModelItemExample example);

    int deleteByPrimaryKey(Integer modelitemId);

    int insert(ModelItem record);

    int insertSelective(ModelItem record);

    List<ModelItem> selectByExample(ModelItemExample example);

    ModelItem selectByPrimaryKey(Integer modelitemId);

    int updateByExampleSelective(@Param("record") ModelItem record, @Param("example") ModelItemExample example);

    int updateByExample(@Param("record") ModelItem record, @Param("example") ModelItemExample example);

    int updateByPrimaryKeySelective(ModelItem record);

    int updateByPrimaryKey(ModelItem record);
    
    int selectMaxId();
}