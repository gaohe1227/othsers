package com.doadway.dwcom.manager.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcom.manager.biz.FooterBiz;
import com.doadway.dwcom.manager.biz.FrontConstants;
import com.doadway.dwcms.assistant.biz.FriendlinkBiz;
import com.doadway.dwcms.assistant.pojo.Friendlink;
@Service
public class FooterBizImpl implements FooterBiz {
	@Resource
	private FriendlinkBiz friendlinkBiz;	
	public List<Friendlink> findPartnerlink() {
		Map<String, String> params =new HashMap<String,String>();
		params.put("queryCtgId", FrontConstants.PARTNER_LINKCTG_ID+"");
		return friendlinkBiz.findAllFriendlinkByParams(params );
	}

}
