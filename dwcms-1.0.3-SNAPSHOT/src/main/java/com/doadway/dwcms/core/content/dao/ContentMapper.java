package com.doadway.dwcms.core.content.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.content.pojo.Content;
import com.doadway.dwcms.core.content.pojo.ContentExample;
@Repository
public interface ContentMapper {
    int countByExample(ContentExample example);

    int deleteByExample(ContentExample example);

    int deleteByPrimaryKey(Integer contentId);

    int insert(Content record);

    int insertSelective(Content record);

    List<Content> selectByExample(ContentExample example);

    Content selectByPrimaryKey(Integer contentId);

    int updateByExampleSelective(@Param("record") Content record, @Param("example") ContentExample example);

    int updateByExample(@Param("record") Content record, @Param("example") ContentExample example);

    int updateByPrimaryKeySelective(Content record);

    int updateByPrimaryKey(Content record);
    
    public List<Content> selectByPage(@Param("page")Page page,@Param("params")Map<String, Object> params);
    
   public  List<Content> selectListForIndex(@Param("siteId") Integer siteId,@Param("channelId")  Integer channelId,
		   @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("startId") Integer startId, @Param("max") Integer max);	    
   
    public int selectMaxId();
}