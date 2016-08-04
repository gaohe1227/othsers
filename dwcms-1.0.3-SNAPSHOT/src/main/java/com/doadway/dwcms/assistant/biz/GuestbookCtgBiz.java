package com.doadway.dwcms.assistant.biz;

import java.util.List;

import com.doadway.dwcms.assistant.pojo.GuestbookCtg;

public interface GuestbookCtgBiz {
	public boolean saveOrUpdateGuestbookCtg(GuestbookCtg guestbookCtg);
	
	public boolean batchDeleteGuestbookCtg(String[] guestbookCtgIds);
	
	public List<GuestbookCtg> findAllGuestbookCtg();
	
	public GuestbookCtg  findGuestbookCtgById(Integer guestbookCtgId);
	
	public Integer findMaxId();
}
