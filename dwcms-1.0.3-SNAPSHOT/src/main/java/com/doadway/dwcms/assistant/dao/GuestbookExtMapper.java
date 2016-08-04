package com.doadway.dwcms.assistant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.doadway.dwcms.assistant.pojo.GuestbookExt;
import com.doadway.dwcms.assistant.pojo.GuestbookExtExample;
import com.doadway.dwcms.assistant.pojo.GuestbookExtWithBLOBs;
@Repository
public interface GuestbookExtMapper {
    int countByExample(GuestbookExtExample example);

    int deleteByExample(GuestbookExtExample example);

    int insert(GuestbookExtWithBLOBs record);

    int insertSelective(GuestbookExtWithBLOBs record);

    List<GuestbookExtWithBLOBs> selectByExampleWithBLOBs(GuestbookExtExample example);

    List<GuestbookExt> selectByExample(GuestbookExtExample example);

    int updateByExampleSelective(@Param("record") GuestbookExtWithBLOBs record, @Param("example") GuestbookExtExample example);

    int updateByExampleWithBLOBs(@Param("record") GuestbookExtWithBLOBs record, @Param("example") GuestbookExtExample example);

    int updateByExample(@Param("record") GuestbookExt record, @Param("example") GuestbookExtExample example);
}