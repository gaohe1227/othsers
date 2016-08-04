package com.doadway.dwcms.core.config.biz;

import java.util.List;

import com.doadway.dwcms.core.config.pojo.Ftp;

public interface FtpBiz {
	public boolean saveFtp(Ftp ftp);
	public boolean updateFtp(Ftp ftp);
	public boolean deleteFtp(Integer id);
	public Ftp findFtpById(Integer id);
	public List<Ftp> findAllFtp();
	public boolean batchDeleteFtp(String[] ids);
	public Integer findMaxId();
}
