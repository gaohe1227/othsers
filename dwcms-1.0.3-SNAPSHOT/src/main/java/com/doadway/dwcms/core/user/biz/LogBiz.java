package com.doadway.dwcms.core.user.biz;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.doadway.common.page.Page;
import com.doadway.common.shiro.UserRealm.ShiroUser;
import com.doadway.dwcms.core.user.pojo.Log;

public interface LogBiz {
	public List<Log> findLogByPage(Page page,Map<String,Object> params);
	public Log findById(Integer id);
	public Log operating(HttpServletRequest request, String title,
			String content);
	public Log loginFailure(HttpServletRequest request, String title,
			String content);
	public Log loginSuccess(HttpServletRequest request, ShiroUser user,
			String title);
	public Log save(Log bean);	
	public boolean batchDeleteByIds(String[] ids);
	public boolean batchDeleteInterValOneWeek();
	public boolean batchDeleteInterValOneThreeMonth();
	public boolean batchDeleteInterValOneMonth();
	public boolean batchDeleteInterValOneYear();
	public boolean batchDeleteAll();
}
