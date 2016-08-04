package com.doadway.dwcms.assistant.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.pojo.Guestbook;
import com.doadway.dwcms.assistant.pojo.GuestbookExample;
@Repository
public interface GuestbookMapper {
    int countByExample(GuestbookExample example);

    int deleteByExample(GuestbookExample example);

    int deleteByPrimaryKey(Integer guestbookId);

    int insert(Guestbook record);

    int insertSelective(Guestbook record);

    List<Guestbook> selectByExample(GuestbookExample example);

    Guestbook selectByPrimaryKey(Integer guestbookId);

    int updateByExampleSelective(@Param("record") Guestbook record, @Param("example") GuestbookExample example);

    int updateByExample(@Param("record") Guestbook record, @Param("example") GuestbookExample example);

    int updateByPrimaryKeySelective(Guestbook record);

    int updateByPrimaryKey(Guestbook record);
    
    List<Guestbook> selectByPage(@Param("page")Page page,@Param("params")Map<String,Object> params);
    
    int selectMaxId();
}