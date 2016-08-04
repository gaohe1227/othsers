package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentPicture;
import com.doadway.dwcms.core.content.pojo.ContentPictureExample;
import com.doadway.dwcms.core.content.pojo.ContentPictureKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentPictureMapper {
    int countByExample(ContentPictureExample example);

    int deleteByExample(ContentPictureExample example);

    int deleteByPrimaryKey(ContentPictureKey key);

    int insert(ContentPicture record);

    int insertSelective(ContentPicture record);

    List<ContentPicture> selectByExample(ContentPictureExample example);

    ContentPicture selectByPrimaryKey(ContentPictureKey key);

    int updateByExampleSelective(@Param("record") ContentPicture record, @Param("example") ContentPictureExample example);

    int updateByExample(@Param("record") ContentPicture record, @Param("example") ContentPictureExample example);

    int updateByPrimaryKeySelective(ContentPicture record);

    int updateByPrimaryKey(ContentPicture record);
    
    public int selectMaxPriority();
}