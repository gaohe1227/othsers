package com.doadway.dwcms.core.functiontree.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.functiontree.pojo.FunctionTree;
import com.doadway.dwcms.core.functiontree.pojo.FunctionTreeExample;
@Repository
public interface FunctionTreeMapper {
    int deleteByPrimaryKey(String id);

    int insert(FunctionTree record);

    int insertSelective(FunctionTree record);

    List<FunctionTree> selectByExample(FunctionTreeExample example);

    FunctionTree selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(FunctionTree record);

    int updateByPrimaryKey(FunctionTree record);
    
    List<FunctionTree> selectFunctionTreeByPage(Page page);
}