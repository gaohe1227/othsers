package com.doadway.dwcms.core.config.dao;

import com.doadway.dwcms.core.config.pojo.Ftp;
import com.doadway.dwcms.core.config.pojo.FtpExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface FtpMapper {
    int countByExample(FtpExample example);

    int deleteByExample(FtpExample example);

    int deleteByPrimaryKey(Integer ftpId);

    int insert(Ftp record);

    int insertSelective(Ftp record);

    List<Ftp> selectByExample(FtpExample example);

    Ftp selectByPrimaryKey(Integer ftpId);

    int updateByExampleSelective(@Param("record") Ftp record, @Param("example") FtpExample example);

    int updateByExample(@Param("record") Ftp record, @Param("example") FtpExample example);

    int updateByPrimaryKeySelective(Ftp record);

    int updateByPrimaryKey(Ftp record);
    
    int selectMaxId();
}