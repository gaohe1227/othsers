package com.doadway.dwcms.maintain.biz;

import java.util.List;

import com.doadway.dwcms.maintain.pojo.Keyword;

public interface KeywordBiz {
	public boolean saveKeyword(Keyword keyword);
	public List<Keyword> findAllKeyword();
	public boolean batchDeleteKeyword(String[] keywordIds);
	public boolean batchUpdateKeyword(List<Keyword> keywordList);
}
