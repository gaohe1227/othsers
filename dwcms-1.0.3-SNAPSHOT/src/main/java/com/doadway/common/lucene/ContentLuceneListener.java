package com.doadway.common.lucene;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.lucene.queryParser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.doadway.dwcms.core.content.biz.ContentListenerAbstract;
import com.doadway.dwcms.core.content.enums.ContentStatusEnum;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;

@Component
public class ContentLuceneListener extends ContentListenerAbstract {
	private static final Logger log = LoggerFactory
			.getLogger(ContentLuceneListener.class);
	/**
	 * 是否已审核
	 */
	private static final String IS_CHECKED = "isChecked";

	@Override
	public void afterSave(ContentDTO content) {
		if (content.getStatus()==ContentStatusEnum.checked.getValue().byteValue()) {
			try {
				luceneContentSvc.createIndex(content);
			} catch (IOException e) {
				log.error("", e);
			}
		}
	}

	@Override
	public Map<String, Object> preChange(ContentDTO content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(IS_CHECKED,content.getStatus()==ContentStatusEnum.checked.getValue().byteValue());
		return map;
	}

	@Override
	public void afterChange(ContentDTO content, Map<String, Object> map) {
		boolean pre = (Boolean) map.get(IS_CHECKED);
		boolean curr = (content.getStatus()==ContentStatusEnum.checked.getValue().byteValue());
		try {
			if (pre && !curr) {
				luceneContentSvc.deleteIndex(content.getContentId());
			} else if (!pre && curr) {
				luceneContentSvc.createIndex(content);
			} else if (pre && curr) {
				luceneContentSvc.updateIndex(content);
			}
		} catch (IOException e) {
			log.error("", e);
		} catch (ParseException e) {
			log.error("", e);
		}
	}

	@Override
	public void afterDelete(ContentDTO content) {
		try {
			luceneContentSvc.deleteIndex(content.getContentId());
		} catch (IOException e) {
			log.error("", e);
		} catch (ParseException e) {
			log.error("", e);
		}
	}

	private LuceneContentSvc luceneContentSvc;

	@Autowired
	public void setLuceneContentSvc(LuceneContentSvc luceneContentSvc) {
		this.luceneContentSvc = luceneContentSvc;
	}
}
