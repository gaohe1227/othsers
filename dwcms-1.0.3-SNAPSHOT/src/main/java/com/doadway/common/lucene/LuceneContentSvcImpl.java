package com.doadway.common.lucene;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Searcher;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doadway.common.page.Pagination;
import com.doadway.common.web.mvc.RealPathResolver;
import com.doadway.dwcms.Constants;
import com.doadway.dwcms.core.content.biz.ContentBiz;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;

@Service
@Transactional
public class LuceneContentSvcImpl implements LuceneContentSvc {
	@Resource
	private LuceneContent luceneContent;
	@Transactional(readOnly = true)
	public Integer createIndex(Integer siteId, Integer channelId,
			Date startDate, Date endDate, Integer startId, Integer max)
			throws IOException, ParseException {
		String path = realPathResolver.get(Constants.LUCENE_PATH);
		Directory dir = new SimpleFSDirectory(new File(path));
		return createIndex(siteId, channelId, startDate, endDate, startId, max,
				dir);
	}

	@Transactional(readOnly = true)
	public Integer createIndex(Integer siteId, Integer channelId,
			Date startDate, Date endDate, Integer startId, Integer max,
			Directory dir) throws IOException, ParseException {
		boolean exist = IndexReader.indexExists(dir);
		IndexWriter writer = new IndexWriter(dir, new StandardAnalyzer(
				Version.LUCENE_30), !exist, IndexWriter.MaxFieldLength.LIMITED);
		try {
			if (exist) {
				LuceneContent.delete(siteId, channelId, startDate, endDate,
						writer);
			}
			Integer lastId = luceneContentDao.index(writer, siteId, channelId,
					startDate, endDate, startId, max);
			writer.optimize();
			return lastId;
		} finally {
			writer.close();
		}
	}

	@Transactional(readOnly = true)
	public void createIndex(ContentDTO content) throws IOException {
		String path = realPathResolver.get(Constants.LUCENE_PATH);
		Directory dir = new SimpleFSDirectory(new File(path));
		createIndex(content, dir);
	}

	@SuppressWarnings("deprecation")
	@Transactional(readOnly = true)
	public void createIndex(ContentDTO content, Directory dir) throws IOException {
		boolean exist = IndexReader.indexExists(dir);
		IndexWriter writer = new IndexWriter(dir, new StandardAnalyzer(
				Version.LUCENE_30), !exist, IndexWriter.MaxFieldLength.LIMITED);
		try {
			writer.addDocument(luceneContent.createDocument(content));
		} finally {
			writer.close();
		}
	}

	@Transactional(readOnly = true)
	public void deleteIndex(Integer contentId) throws IOException,
			ParseException {
		String path = realPathResolver.get(Constants.LUCENE_PATH);
		Directory dir = new SimpleFSDirectory(new File(path));
		deleteIndex(contentId, dir);
	}

	@Transactional(readOnly = true)
	public void deleteIndex(Integer contentId, Directory dir)
			throws IOException, ParseException {
		boolean exist = IndexReader.indexExists(dir);
		if (exist) {
			IndexWriter writer = new IndexWriter(dir, new StandardAnalyzer(
					Version.LUCENE_30), false,
					IndexWriter.MaxFieldLength.LIMITED);
			try {
				LuceneContent.delete(contentId, writer);
			} finally {
				writer.close();
			}
		}
	}

	public void updateIndex(ContentDTO content) throws IOException, ParseException {
		String path = realPathResolver.get(Constants.LUCENE_PATH);
		Directory dir = new SimpleFSDirectory(new File(path));
		updateIndex(content, dir);
	}

	public void updateIndex(ContentDTO content, Directory dir) throws IOException,
			ParseException {
		boolean exist = IndexReader.indexExists(dir);
		IndexWriter writer = new IndexWriter(dir, new StandardAnalyzer(
				Version.LUCENE_30), !exist, IndexWriter.MaxFieldLength.LIMITED);
		try {
			if (exist) {
				LuceneContent.delete(content.getContentId(), writer);
			}
			writer.addDocument(luceneContent.createDocument(content));
		} finally {
			writer.close();
		}
	}

	@Transactional(readOnly = true)
	public Pagination searchPage(String path, String queryString,
			Integer siteId, Integer channelId, Date startDate, Date endDate,
			int pageNo, int pageSize) throws CorruptIndexException,
			IOException, ParseException {
		Directory dir = new SimpleFSDirectory(new File(path));
		return searchPage(dir, queryString, siteId, channelId, startDate,
				endDate, pageNo, pageSize);
	}

	@Transactional(readOnly = true)
	public Pagination searchPage(Directory dir, String queryString,
			Integer siteId, Integer channelId, Date startDate, Date endDate,
			int pageNo, int pageSize) throws CorruptIndexException,
			IOException, ParseException {
		Searcher searcher = new IndexSearcher(dir);
		try {
			Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
			Query query = LuceneContent.createQuery(queryString, siteId,
					channelId, startDate, endDate, analyzer);
			TopDocs docs = searcher.search(query, pageNo * pageSize);
			Pagination p = LuceneContent.getResultPage(searcher, docs, pageNo,
					pageSize);
			List<?> ids = p.getList();
			List<ContentDTO> contents = new ArrayList<ContentDTO>(ids.size());
			for (Object id : ids) {
				contents.add(contentMng.findContentById(((Integer)id).toString()));
			}
			p.setList(contents);
			return p;
		} finally {
			searcher.close();
		}
	}

	@Transactional(readOnly = true)
	public List<ContentDTO> searchList(String path, String queryString,
			Integer siteId, Integer channelId, Date startDate, Date endDate,
			int first, int max) throws CorruptIndexException, IOException,
			ParseException {
		Directory dir = new SimpleFSDirectory(new File(path));
		return searchList(dir, queryString, siteId, channelId, startDate,
				endDate, first, max);
	}

	@Transactional(readOnly = true)
	public List<ContentDTO> searchList(Directory dir, String queryString,
			Integer siteId, Integer channelId, Date startDate, Date endDate,
			int first, int max) throws CorruptIndexException, IOException,
			ParseException {
		Searcher searcher = new IndexSearcher(dir);
		try {
			Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
			Query query = LuceneContent.createQuery(queryString, siteId,
					channelId, startDate, endDate, analyzer);
			if (first < 0) {
				first = 0;
			}
			if (max < 0) {
				max = 0;
			}
			TopDocs docs = searcher.search(query, first + max);
			List<Integer> ids = LuceneContent.getResultList(searcher, docs,
					first, max);
			List<ContentDTO> contents = new ArrayList<ContentDTO>(ids.size());
			for (Object id : ids) {
				contents.add(contentMng.findContentById(((Integer)id).toString()));
			}
			return contents;
		} finally {
			searcher.close();
		}
	}
	@Resource(name="servletContextRealPathResolver")
	private RealPathResolver realPathResolver;
	@Resource
	private ContentBiz contentMng;
	@Resource
	private LuceneContentDao luceneContentDao;

	@Autowired
	public void setRealPathResolver(RealPathResolver realPathResolver) {
		this.realPathResolver = realPathResolver;
	}

	@Autowired
	public void setLuceneContentDao(LuceneContentDao luceneContentDao) {
		this.luceneContentDao = luceneContentDao;
	}

	@Autowired
	public void setContentMng(ContentBiz contentMng) {
		this.contentMng = contentMng;
	}

}
