package com.doadway.common.lucene;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.store.LockObtainFailedException;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.doadway.common.page.Pagination;
import com.doadway.common.web.ResponseUtils;
import com.doadway.common.web.mvc.RealPathResolver;
import com.doadway.dwcms.Constants;
import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcms.core.config.pojo.Site;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;
import com.doadway.dwcms.web.CmsUtils;


@Controller
public class LuceneContentAct {
	private static final Logger log = LoggerFactory
			.getLogger(LuceneContentAct.class);
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/lucene/v_index.do")
	public String index(HttpServletRequest request, ModelMap model) {
		Site site = CmsUtils.getSite(request);
		model.addAttribute("site", site);
		
		String DateStr = "2014-10-10 ";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date startDate = dateFormat.parse(DateStr);
			//List<ContentDTO> contentDtoList=luceneContentSvc.searchList(realPathResolver.get(Constants.LUCENE_PATH), "",1, null, startDate,null, 0, 1000);
			Pagination  page=luceneContentSvc.searchPage(realPathResolver.get(Constants.LUCENE_PATH), "",1, null, startDate,null, 1, 40);
			for(ContentDTO content:(List<ContentDTO>)page.getList()){
				System.out.println("标题:"+content.getTitle());
				System.out.println("描述:"+content.getDescription());
				System.out.println("-----------------------------");
			}
		} catch (CorruptIndexException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "lucene/index";
	}

	@RequestMapping(value = "/lucene/o_create.do")
	public void create(Integer siteId,Integer channelId,@RequestParam(required=false)Date startDate,
			@RequestParam(required=false)Date endDate,@RequestParam(required=false)Integer startId, Integer max,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws JSONException {
		try {
			Integer lastId = luceneContentSvc.createIndex(siteId, channelId,
					startDate, endDate, startId, max);
			JSONObject json = new JSONObject();
			json.put("success", true);
			if (lastId != null) {
				json.put("lastId", lastId);
			}
			ResponseUtils.renderJson(response, json.toString());
		} catch (CorruptIndexException e) {
			JSONObject json = new JSONObject();
			json.put("success", false).put("msg", e.getMessage());
			ResponseUtils.renderJson(response, json.toString());
			log.error("", e);
		} catch (LockObtainFailedException e) {
			JSONObject json = new JSONObject();
			json.put("success", false).put("msg", e.getMessage());
			ResponseUtils.renderJson(response, json.toString());
			log.error("", e);
		} catch (IOException e) {
			JSONObject json = new JSONObject();
			json.put("success", false).put("msg", e.getMessage());
			ResponseUtils.renderJson(response, json.toString());
			log.error("", e);
		} catch (ParseException e) {
			JSONObject json = new JSONObject();
			json.put("success", false).put("msg", e.getMessage());
			ResponseUtils.renderJson(response, json.toString());
			log.error("", e);
		}
	}

	@Autowired
	private LuceneContentSvc luceneContentSvc;

	@Resource
	private ChannelBiz channelBiz;
	
	@Resource(name="servletContextRealPathResolver")
	private RealPathResolver realPathResolver;
}
