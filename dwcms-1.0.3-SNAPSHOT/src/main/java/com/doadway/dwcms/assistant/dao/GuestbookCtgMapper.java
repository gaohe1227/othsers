package com.doadway.dwcms.assistant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.dwcms.assistant.pojo.GuestbookCtg;
import com.doadway.dwcms.assistant.pojo.GuestbookCtgExample;
@Repository
public interface GuestbookCtgMapper {
    int countByExample(GuestbookCtgExample example);

    int deleteByExample(GuestbookCtgExample example);

    int deleteByPrimaryKey(Integer guestbookctgId);

    int insert(GuestbookCtg record);

    int insertSelective(GuestbookCtg record);

    List<GuestbookCtg> selectByExample(GuestbookCtgExample example);

    GuestbookCtg selectByPrimaryKey(Integer guestbookctgId);

    int updateByExampleSelective(@Param("record") GuestbookCtg record, @Param("example") GuestbookCtgExample example);

    int updateByExample(@Param("record") GuestbookCtg record, @Param("example") GuestbookCtgExample example);

    int updateByPrimaryKeySelective(GuestbookCtg record);

    int updateByPrimaryKey(GuestbookCtg record);
    
    int selectMaxId();
}