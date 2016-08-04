package com.doadway.dwcms.core.user.biz.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.util.UrlPathHelper;

import com.doadway.common.page.Page;
import com.doadway.common.shiro.Permission;
import com.doadway.common.shiro.UserRealm.ShiroUser;
import com.doadway.common.web.RequestUtils;
import com.doadway.dwcms.core.config.pojo.Site;
import com.doadway.dwcms.core.user.biz.LogBiz;
import com.doadway.dwcms.core.user.biz.UserBiz;
import com.doadway.dwcms.core.user.dao.LogMapper;
import com.doadway.dwcms.core.user.pojo.Log;
import com.doadway.dwcms.core.user.pojo.LogExample;
import com.doadway.dwcms.core.user.pojo.LogExample.Criteria;
import com.doadway.dwcms.web.CmsUtils;
@Service
public class LogBizImpl implements LogBiz {
	@Resource
	LogMapper logDAO;
	@Resource
	UserBiz userBiz;
	public boolean batchDeleteAll() {
		LogExample example = new LogExample();
		Criteria cri = example.createCriteria();
		cri.andLogIdIsNotNull();
		return logDAO.deleteByExample(example )>0;
	}

	public boolean batchDeleteByIds(String[] ids) {
		Integer flag = 0;
		for(String id:ids){
			logDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==ids.length){
			return true;
		}
		return false;
	}

	public boolean batchDeleteInterValOneThreeMonth() {
		return logDAO.deleteInterValOneThreeMonth()>0;
	}

	public boolean batchDeleteInterValOneMonth() {
		return logDAO.deleteInterValOneMonth()>0;
	}

	public boolean batchDeleteInterValOneWeek() {
		return logDAO.deleteInterValOneWeek()>0;
	}

	public boolean batchDeleteInterValOneYear() {
		return logDAO.deleteInterValOneYear()>0;
	}

	public List<Log> findLogByPage(Page page, Map<String, Object> params) {
		List<Log> logList=logDAO.selectByPage(page, params);
		List<Log> logWithUserNameList=new ArrayList<Log>();
		for(Log log:logList){
			log.setUserName(userBiz.findUserById(log.getUserId()).getUsername());
			logWithUserNameList.add(log);
		}
		return logWithUserNameList;
	}

	public Log findById(Integer id) {
		Log entity = logDAO.selectByPrimaryKey(id);
		return entity;
	}

	public Log save(Integer category, Site site, ShiroUser user,
			String url, String ip, Date date, String title, String content) {
		Log log = new Log();
		if(site!=null)log.setSiteId(site.getSiteId());
		if(user!=null)log.setUserId(user.id);
		log.setCategory(category);
		log.setIp(ip);
		log.setLogTime(date);
		log.setUrl(url);
		log.setTitle(title);
		log.setContent(content);
		save(log);
		return log;
	}

	public Log loginSuccess(HttpServletRequest request, ShiroUser user,
			String title) {
		String ip = RequestUtils.getIpAddr(request);
		UrlPathHelper helper = new UrlPathHelper();
		String uri = helper.getOriginatingRequestUri(request);
		Date date = new Date();
		Log log = save(Log.LOGIN_SUCCESS, null, user, uri, ip, date,
				title, null);
		return log;
	}

	public Log loginFailure(HttpServletRequest request, String title,
			String content) {
		String ip = RequestUtils.getIpAddr(request);
		UrlPathHelper helper = new UrlPathHelper();
		String uri = helper.getOriginatingRequestUri(request);
		Date date = new Date();
		Log log = save(Log.LOGIN_FAILURE, null, null, uri, ip, date,
				title, content);
		return log;
	}

	public Log operating(HttpServletRequest request, String title,
			String content) {
		Site site = CmsUtils.getSite(request);
		Permission per = new Permission();
		ShiroUser user = (ShiroUser)per.getPrincipal();
		String ip = RequestUtils.getIpAddr(request);
		UrlPathHelper helper = new UrlPathHelper();
		String uri = helper.getOriginatingRequestUri(request);
		Date date = new Date();
		Log log = save(Log.OPERATING, site, user, uri, ip, date,
				title, content);
		return log;
	}

	public Log save(Log bean) {
		logDAO.insert(bean);
		return bean;
	}	
}
