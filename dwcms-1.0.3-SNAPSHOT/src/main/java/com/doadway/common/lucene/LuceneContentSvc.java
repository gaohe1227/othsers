package com.doadway.common.lucene;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.store.Directory;

import com.doadway.common.page.Pagination;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;

public interface LuceneContentSvc {
	public Integer createIndex(Integer siteId, Integer channelId,
			Date startDate, Date endDate, Integer startId, Integer max)
			throws IOException, ParseException;

	public Integer createIndex(Integer siteId, Integer channelId,
			Date startDate, Date endDate, Integer startId, Integer max,
			Directory dir) throws IOException, ParseException;

	public void createIndex(ContentDTO content, Directory dir) throws IOException;

	public void createIndex(ContentDTO content) throws IOException;

	public void deleteIndex(Integer contentId) throws IOException,
			ParseException;

	public void deleteIndex(Integer contentId, Directory dir)
			throws IOException, ParseException;

	public void updateIndex(ContentDTO content) throws IOException, ParseException;

	public void updateIndex(ContentDTO content, Directory dir) throws IOException,
			ParseException;

	public Pagination searchPage(String path, String queryString,
			Integer siteId, Integer channelId, Date startDate, Date endDate,
			int pageNo, int pageSize) throws CorruptIndexException,
			IOException, ParseException;

	public Pagination searchPage(Directory dir, String queryString,
			Integer siteId, Integer channelId, Date startDate, Date endDate,
			int pageNo, int pageSize) throws CorruptIndexException,
			IOException, ParseException;

	public List<ContentDTO> searchList(String path, String queryString,
			Integer siteId, Integer channelId, Date startDate, Date endDate,
			int pageNo, int pageSize) throws CorruptIndexException,
			IOException, ParseException;

	public List<ContentDTO> searchList(Directory dir, String queryString,
			Integer siteId, Integer channelId, Date startDate, Date endDate,
			int first, int max) throws CorruptIndexException, IOException,
			ParseException;

}
