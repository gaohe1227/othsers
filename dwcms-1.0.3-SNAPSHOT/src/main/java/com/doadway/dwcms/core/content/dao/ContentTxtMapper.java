package com.doadway.dwcms.core.content.dao;

import com.doadway.dwcms.core.content.pojo.ContentTxt;
import com.doadway.dwcms.core.content.pojo.ContentTxtExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface ContentTxtMapper {
    int countByExample(ContentTxtExample example);

    int deleteByExample(ContentTxtExample example);

    int deleteByPrimaryKey(Integer contentId);

    int insert(ContentTxt record);

    int insertSelective(ContentTxt record);

    List<ContentTxt> selectByExampleWithBLOBs(ContentTxtExample example);

    List<ContentTxt> selectByExample(ContentTxtExample example);

    ContentTxt selectByPrimaryKey(Integer contentId);

    int updateByExampleSelective(@Param("record") ContentTxt record, @Param("example") ContentTxtExample example);

    int updateByExampleWithBLOBs(@Param("record") ContentTxt record, @Param("example") ContentTxtExample example);

    int updateByExample(@Param("record") ContentTxt record, @Param("example") ContentTxtExample example);

    int updateByPrimaryKeySelective(ContentTxt record);

    int updateByPrimaryKeyWithBLOBs(ContentTxt record);
}