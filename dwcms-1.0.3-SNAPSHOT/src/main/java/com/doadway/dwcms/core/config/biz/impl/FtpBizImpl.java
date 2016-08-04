package com.doadway.dwcms.core.config.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.config.biz.FtpBiz;
import com.doadway.dwcms.core.config.dao.FtpMapper;
import com.doadway.dwcms.core.config.pojo.Ftp;
import com.doadway.dwcms.core.config.pojo.FtpExample;
import com.doadway.dwcms.core.config.pojo.FtpExample.Criteria;
@Service
public class FtpBizImpl implements FtpBiz {
	@Resource
	private FtpMapper ftpDAO;
	public boolean deleteFtp(Integer id) {
		// TODO Auto-generated method stub
		return ftpDAO.deleteByPrimaryKey(id)>0;
	}

	public List<Ftp> findAllFtp() {
		// TODO Auto-generated method stub
		FtpExample example = new FtpExample();
		Criteria cri =example.createCriteria();
		cri.andFtpIdIsNotNull();
		return ftpDAO.selectByExample(example);
	}

	public Ftp findFtpById(Integer id) {
		// TODO Auto-generated method stub
		return ftpDAO.selectByPrimaryKey(id);
	}

	public boolean saveFtp(Ftp Ftp) {
		// TODO Auto-generated method stub
		return ftpDAO.insertSelective(Ftp)>0;
	}

	public boolean updateFtp(Ftp Ftp) {
		// TODO Auto-generated method stub
		return ftpDAO.updateByPrimaryKeySelective(Ftp)>0;
	}

	public Integer findMaxId() {
		// TODO Auto-generated method stub
		return ftpDAO.selectMaxId();
	}

	public boolean batchDeleteFtp(String[] ids) {
		// TODO Auto-generated method stub
		Integer flag = 0;
		for(String id:ids){
			ftpDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==ids.length){
			return true;
		}
		return false;
	}

}
