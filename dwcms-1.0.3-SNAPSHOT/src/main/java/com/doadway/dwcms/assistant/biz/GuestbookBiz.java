package com.doadway.dwcms.assistant.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.pojo.dto.GuestbookDTO;

public interface GuestbookBiz {
	public boolean saveOrUpdateGuestbook(GuestbookDTO guestbookDTO);
	
	public boolean batchDeleteGuestbook(String[] guestbookIds);
	
	
	public List<GuestbookDTO> findGuestbookByPage(Page page,Map<String,Object> params);
	
	public GuestbookDTO  findGuestbookById(Integer guestbookId);
	public Integer  findMaxId();
}
