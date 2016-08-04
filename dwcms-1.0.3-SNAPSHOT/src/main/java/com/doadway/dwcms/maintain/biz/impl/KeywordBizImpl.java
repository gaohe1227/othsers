package com.doadway.dwcms.maintain.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.maintain.biz.KeywordBiz;
import com.doadway.dwcms.maintain.dao.KeywordMapper;
import com.doadway.dwcms.maintain.pojo.Keyword;
import com.doadway.dwcms.maintain.pojo.KeywordExample;
@Service
public class KeywordBizImpl implements KeywordBiz {
	@Resource
	KeywordMapper keywordDAO;
	
	public boolean batchDeleteKeyword(String[] keywordIds) {
		Integer flag=0;
		for(String id:keywordIds){
			keywordDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==keywordIds.length){
			return true;
		}
		return false;
	}

	public boolean batchUpdateKeyword(List<Keyword> keywordList) {
		Integer flag=0;
		for(Keyword kword:keywordList){
			keywordDAO.updateByPrimaryKey(kword);
			flag++;
		}
		if(flag==keywordList.size()){
			return true;
		}
		return false;
	}

	public List<Keyword> findAllKeyword() {
		KeywordExample example =new KeywordExample();
		KeywordExample.Criteria keywordCri= example.createCriteria();
		keywordCri.andKeywordIdIsNotNull();
		return keywordDAO.selectByExample(example);
	}

	public boolean saveKeyword(Keyword keyword) {
		return keywordDAO.insert(keyword)>0;
	}

}
