package com.doadway.dwcms.assistant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.dwcms.assistant.pojo.CommentExt;
import com.doadway.dwcms.assistant.pojo.CommentExtExample;
import com.doadway.dwcms.assistant.pojo.CommentExtWithBLOBs;
@Repository
public interface CommentExtMapper {
    int countByExample(CommentExtExample example);

    int deleteByExample(CommentExtExample example);

    int insert(CommentExtWithBLOBs record);

    int insertSelective(CommentExtWithBLOBs record);

    List<CommentExtWithBLOBs> selectByExampleWithBLOBs(CommentExtExample example);

    List<CommentExt> selectByExample(CommentExtExample example);

    int updateByExampleSelective(@Param("record") CommentExtWithBLOBs record, @Param("example") CommentExtExample example);

    int updateByExampleWithBLOBs(@Param("record") CommentExtWithBLOBs record, @Param("example") CommentExtExample example);

    int updateByExample(@Param("record") CommentExt record, @Param("example") CommentExtExample example);
}