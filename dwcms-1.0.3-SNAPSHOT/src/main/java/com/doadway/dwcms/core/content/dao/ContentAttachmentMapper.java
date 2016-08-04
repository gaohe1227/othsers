package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentAttachment;
import com.doadway.dwcms.core.content.pojo.ContentAttachmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentAttachmentMapper {
    int countByExample(ContentAttachmentExample example);

    int deleteByExample(ContentAttachmentExample example);

    int insert(ContentAttachment record);

    int insertSelective(ContentAttachment record);

    List<ContentAttachment> selectByExample(ContentAttachmentExample example);

    int updateByExampleSelective(@Param("record") ContentAttachment record, @Param("example") ContentAttachmentExample example);

    int updateByExample(@Param("record") ContentAttachment record, @Param("example") ContentAttachmentExample example);
}