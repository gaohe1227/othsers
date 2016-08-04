package com.doadway.dwcms.core.channel.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcms.core.channel.dao.ChannelExtMapper;
import com.doadway.dwcms.core.channel.dao.ChannelMapper;
import com.doadway.dwcms.core.channel.dao.ChannelTxtMapper;
import com.doadway.dwcms.core.channel.dao.ChnlGroupContriMapper;
import com.doadway.dwcms.core.channel.dao.ChnlGroupViewMapper;
import com.doadway.dwcms.core.channel.pojo.Channel;
import com.doadway.dwcms.core.channel.pojo.ChannelExample;
import com.doadway.dwcms.core.channel.pojo.ChannelExt;
import com.doadway.dwcms.core.channel.pojo.ChannelTxt;
import com.doadway.dwcms.core.channel.pojo.ChnlGroupContriExample;
import com.doadway.dwcms.core.channel.pojo.ChnlGroupContriKey;
import com.doadway.dwcms.core.channel.pojo.ChnlGroupViewExample;
import com.doadway.dwcms.core.channel.pojo.ChnlGroupViewKey;
import com.doadway.dwcms.core.channel.pojo.ChannelExample.Criteria;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;
import com.doadway.dwcms.core.config.pojo.Model;
@Service
public class ChannelBizImpl implements ChannelBiz {
	@Resource
	ChannelExtMapper channelExtDAO;
	@Resource
	ChannelMapper    channelDAO;
	@Resource
	ChannelTxtMapper    channelTxtDAO;
	@Resource
	ChnlGroupContriMapper    chnlGroupContriDAO;
	@Resource
	ChnlGroupViewMapper   chnlGroupViewDAO;
	public List<Map<String, Object>> createChannelTree(String parentId) {
		List<ChannelDTO> list = new ArrayList<ChannelDTO>();
		if(parentId==null){
			list=this.findChannelsByParentId(null);
		}else{
			list=this.findChannelsByParentId(Integer.parseInt(parentId));
		}
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		for(ChannelDTO channelDto:list){
			Map<String,Object> node = new HashMap<String,Object>();
			node.put("id", channelDto.getChannelId());
			node.put("attributes", channelDto.getModelId());
			node.put("text", channelDto.getChannelName());
			node.put("state", this.isParentChannel(channelDto.getChannelId())?"closed":"open");
			if(this.isParentChannel(channelDto.getChannelId())){
				node.put("children", createChannelTree(""+channelDto.getChannelId()));
			}
			result.add(node);
		}
		
		return result;
	}

	public List<Map<String, Object>> createZTree(String parentId) {
		List<ChannelDTO> list = new ArrayList<ChannelDTO>();
		if(parentId==null){
			list=this.findChannelsByParentId(null);
		}else{
			list=this.findChannelsByParentId(Integer.parseInt(parentId));
		}
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		for(ChannelDTO channelDto:list){
			Map<String,Object> node = new HashMap<String,Object>();
			node.put("id", channelDto.getChannelId());
			node.put("pId", channelDto.getParentId());
			node.put("modelId", channelDto.getModelId());
			node.put("name", channelDto.getChannelName());
			node.put("open", this.isParentChannel(channelDto.getChannelId())?"false":"true");
			if(this.isParentChannel(channelDto.getChannelId())){
				node.put("children", createZTree(""+channelDto.getChannelId()));
			}
			result.add(node);
		}
		
		return result;
	}
	
	public List<Map<String, Object>> createAsyncZtreeByParentId(String parentId) {
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		List<ChannelDTO> list = new ArrayList<ChannelDTO>();
		if(parentId==null){
			list=this.findChannelsByParentId(null);
		}else{
			list=this.findChannelsByParentId(Integer.parseInt(parentId));
		}		
		for(ChannelDTO channelDto:list){
			Map<String,Object> node = new HashMap<String,Object>();
			node.put("id", channelDto.getChannelId());
			node.put("pId", channelDto.getParentId());
			node.put("modelId", channelDto.getModelId());
			node.put("name", channelDto.getChannelName());
			node.put("open", this.isParentChannel(channelDto.getChannelId())?"false":"true");
			if(this.isParentChannel(channelDto.getChannelId())){
				node.put("isParent", "true");
			}			
			result.add(node);
		}		
		return result;
	}

	public List<Map<String, Object>> createAsyncEasyTreeByParentId(
			String parentId) {
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		List<ChannelDTO> list = new ArrayList<ChannelDTO>();
		if(parentId==null){
			list=this.findChannelsByParentId(null);
		}else{
			list=this.findChannelsByParentId(Integer.parseInt(parentId));
		}		
		for(ChannelDTO channelDto:list){
			Map<String,Object> node = new HashMap<String,Object>();
			node.put("id", channelDto.getChannelId());
			node.put("text", channelDto.getChannelName());
			node.put("state", this.isParentChannel(channelDto.getChannelId())?"closed":"open");
			node.put("attributes", channelDto.getModelId());
			if(this.isParentChannel(channelDto.getChannelId())){
				node.put("isParent", "true");
			}			
			result.add(node);
		}		
		return result;
	}

	public ChannelDTO findChannelById(Integer id) {
		if(id==null||id==0)return null;
		ChannelDTO channelDto = new ChannelDTO();
		try {
			Channel channel = channelDAO.selectByPrimaryKey(id);
			BeanUtils.copyProperties(channelDto,channel);
			ChannelExt channelExt = channelExtDAO.selectByPrimaryKey(id);
			if(channelExt!=null){
				BeanUtils.copyProperties(channelDto,channelExt);
			}
			ChannelTxt channelTxt = channelTxtDAO.selectByPrimaryKey(id);
			if(channelTxt!=null){
				BeanUtils.copyProperties(channelDto,channelTxt);
			}
			ChnlGroupContriExample chnlGroupContriExample=new ChnlGroupContriExample();
			com.doadway.dwcms.core.channel.pojo.ChnlGroupContriExample.Criteria chnlGroupContriCri = chnlGroupContriExample.createCriteria();
			chnlGroupContriCri.andChannelIdEqualTo(id);
			channelDto.setChnlContriGroupList(chnlGroupContriDAO.selectByExample(chnlGroupContriExample));
			
			
			ChnlGroupViewExample chnlGroupViewExample =new ChnlGroupViewExample();
			com.doadway.dwcms.core.channel.pojo.ChnlGroupViewExample.Criteria chnlGroupViewCri = chnlGroupViewExample.createCriteria();
			chnlGroupViewCri.andChannelIdEqualTo(id);
			channelDto.setChnlGroupViewList((chnlGroupViewDAO.selectByExample(chnlGroupViewExample )));
			
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return channelDto;
	}

	public Model findChannelModelById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ChannelDTO> findChannelsByParentId(Integer parentId) {
		List<ChannelDTO> channelDtoList = new ArrayList<ChannelDTO>();
		List<Channel> channelList = new ArrayList<Channel>();
		ChannelExample channelExample=new ChannelExample();
		Criteria channelCri = channelExample.createCriteria();
		if(parentId==null||parentId==0){
			channelCri.andParentIdEqualTo(0);
		}else{
			channelCri.andParentIdEqualTo(parentId);
		}
		channelExample.setOrderByClause("CHANNEL_ID");
		channelList =channelDAO.selectByExample(channelExample);
		for(Channel channel:channelList){
			ChannelDTO channelDto = new ChannelDTO();
			try {
				BeanUtils.copyProperties(channelDto, channel);
				
				ChannelExt channelExt = channelExtDAO.selectByPrimaryKey(channel.getChannelId());
				if(channelExt!=null){
					BeanUtils.copyProperties(channelDto, channelExt);
				}
				
				ChannelTxt channelTxt = channelTxtDAO.selectByPrimaryKey(channel.getChannelId());
				if(channelTxt!=null){
					BeanUtils.copyProperties(channelDto, channelTxt);
				}
				
				ChnlGroupContriExample chnlGroupContriExample=new ChnlGroupContriExample();
				com.doadway.dwcms.core.channel.pojo.ChnlGroupContriExample.Criteria chnlGroupContriCri = chnlGroupContriExample.createCriteria();
				chnlGroupContriCri.andChannelIdEqualTo(channel.getChannelId());
				channelDto.setChnlContriGroupList(chnlGroupContriDAO.selectByExample(chnlGroupContriExample));
				
				
				ChnlGroupViewExample chnlGroupViewExample =new ChnlGroupViewExample();
				com.doadway.dwcms.core.channel.pojo.ChnlGroupViewExample.Criteria chnlGroupViewCri = chnlGroupViewExample.createCriteria();
				chnlGroupViewCri.andChannelIdEqualTo(channel.getChannelId());
				channelDto.setChnlGroupViewList((chnlGroupViewDAO.selectByExample(chnlGroupViewExample )));
				
				channelDtoList.add(channelDto);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return channelDtoList;
	}

	public ChannelDTO findParentChannelByParentId(Integer parentId) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean ifHaveContentsByChannelId(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean isParentChannel(Integer parentId) {
		List<Channel> channelList = new ArrayList<Channel>();
		ChannelExample channelExample=new ChannelExample();
		Criteria channelCri = channelExample.createCriteria();
		if(parentId==null){
			channelCri.andParentIdIsNull();
		}else{
			channelCri.andParentIdEqualTo(parentId);
		}
		channelList =channelDAO.selectByExample(channelExample);
		return channelList.size()>0?true:false;
	}


	public boolean batchDeleteChannelByIds(String[] ids) {
		Integer flag = 0;
		for(String id:ids){
			ChannelDTO channelDto = this.findChannelById(Integer.parseInt(id));
			
			channelExtDAO.deleteByPrimaryKey(channelDto.getChannelId());
			channelTxtDAO.deleteByPrimaryKey(channelDto.getChannelId());
			
			if(channelDto.getChnlContriGroupList()!=null){
				ChnlGroupContriExample chnlGroupContriExample =new ChnlGroupContriExample();
				com.doadway.dwcms.core.channel.pojo.ChnlGroupContriExample.Criteria chnlGroupContriCriteria =chnlGroupContriExample.createCriteria();
				chnlGroupContriCriteria.andChannelIdEqualTo(channelDto.getChannelId());
				chnlGroupContriDAO.deleteByExample(chnlGroupContriExample);
			}
			
			if(channelDto.getChnlGroupViewList()!=null){
				ChnlGroupViewExample chnlGroupViewExample =new ChnlGroupViewExample();
				com.doadway.dwcms.core.channel.pojo.ChnlGroupViewExample.Criteria chnlGroupViewCriteria =chnlGroupViewExample.createCriteria();
				chnlGroupViewCriteria.andChannelIdEqualTo(channelDto.getChannelId());
				chnlGroupViewDAO.deleteByExample(chnlGroupViewExample);
			}
			
			channelDAO.deleteByPrimaryKey(channelDto.getChannelId());
			
			flag++;
		}
		if(flag==ids.length){
			return true;
		}
		return false;
	}

	public boolean saveOrUpdateChannel(ChannelDTO channelDto) {
		// TODO Auto-generated method stub
		try {
			
			Channel channel =new Channel();
			BeanUtils.copyProperties(channel,channelDto);
			
			ChannelExt channelExt = new ChannelExt();;
			BeanUtils.copyProperties(channelExt,channelDto);
			
			ChannelTxt channelTxt = new ChannelTxt();
			BeanUtils.copyProperties(channelTxt,channelDto);
			if(channelDAO.selectByPrimaryKey(channelDto.getChannelId())!=null){
				channelDAO.updateByPrimaryKey(channel);
				channelExtDAO.updateByPrimaryKey(channelExt);
				if(channelDto.getTxt()!=null&&!"".equals(channelDto.getTxt())){
					BeanUtils.copyProperties(channelTxt,channelDto);
					channelTxtDAO.updateByPrimaryKeySelective(channelTxt);
				}
				
				if(channelDto.getChnlContriGroupList()!=null){
					ChnlGroupContriExample chnlGroupContriExample =new ChnlGroupContriExample();
					com.doadway.dwcms.core.channel.pojo.ChnlGroupContriExample.Criteria chnlGroupContriCriteria =chnlGroupContriExample.createCriteria();
					chnlGroupContriCriteria.andChannelIdEqualTo(channelDto.getChannelId());
					chnlGroupContriDAO.deleteByExample(chnlGroupContriExample);
					
					List<ChnlGroupContriKey> chnlContriGroupList =channelDto.getChnlContriGroupList();
					for(ChnlGroupContriKey chnlGroupContriKey:chnlContriGroupList){
						chnlGroupContriKey.setChannelId(channelDto.getChannelId());
						chnlGroupContriDAO.insert(chnlGroupContriKey);
					}
				}
				
				if(channelDto.getChnlGroupViewList()!=null){
					ChnlGroupViewExample chnlGroupViewExample =new ChnlGroupViewExample();
					com.doadway.dwcms.core.channel.pojo.ChnlGroupViewExample.Criteria chnlGroupViewCriteria =chnlGroupViewExample.createCriteria();
					chnlGroupViewCriteria.andChannelIdEqualTo(channelDto.getChannelId());
					chnlGroupViewDAO.deleteByExample(chnlGroupViewExample);
					
					List<ChnlGroupViewKey> chnlGroupViewList =channelDto.getChnlGroupViewList();
					for(ChnlGroupViewKey chnlGroupViewKey:chnlGroupViewList){
						chnlGroupViewKey.setChannelId(channelDto.getChannelId());
						chnlGroupViewDAO.insert(chnlGroupViewKey);
					}				
				}
				
			}else{
				channelDAO.insert(channel);
				channelExtDAO.insert(channelExt);
				if(channelDto.getTxt()!=null&&!"".equals(channelDto.getTxt())){
					channelTxtDAO.insert(channelTxt);
				}
				
				if(channelDto.getChnlContriGroupList()!=null){
					List<ChnlGroupContriKey> chnlContriGroupList =channelDto.getChnlContriGroupList();
					for(ChnlGroupContriKey chnlGroupContriKey:chnlContriGroupList){
						chnlGroupContriDAO.insert(chnlGroupContriKey);
					}
				}
				
				if(channelDto.getChnlGroupViewList()!=null){
					List<ChnlGroupViewKey> chnlGroupViewList =channelDto.getChnlGroupViewList();
					for(ChnlGroupViewKey chnlGroupViewKey:chnlGroupViewList){
						chnlGroupViewDAO.insert(chnlGroupViewKey);
					}				
				}
				
			}
			
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}


	public boolean savePriority(String[] ids, String[] prioritys) {
		Integer flag = 0;
		for(String id:ids){
			ChannelDTO tmpChannelDto = this.findChannelById(Integer.parseInt(id));
			tmpChannelDto.setPriority(Integer.parseInt(prioritys[flag]));
			this.saveOrUpdateChannel(tmpChannelDto);
			if(flag==ids.length-1){
				return true;
			}			
			flag++;
		}
		return false;
	}
	public List<ChnlGroupContriKey> findChnlContriGroup(Integer channelId){
		ChnlGroupContriExample chnlGroupContriExample=new ChnlGroupContriExample();
		com.doadway.dwcms.core.channel.pojo.ChnlGroupContriExample.Criteria chnlGroupContriCri = chnlGroupContriExample.createCriteria();
		chnlGroupContriCri.andChannelIdEqualTo(channelId);
		return chnlGroupContriDAO.selectByExample(chnlGroupContriExample);
	}

	public List<ChnlGroupViewKey> findChnlGroupView(Integer channelId) {
		ChnlGroupViewExample chnlGroupViewExample =new ChnlGroupViewExample();
		com.doadway.dwcms.core.channel.pojo.ChnlGroupViewExample.Criteria chnlGroupViewCri = chnlGroupViewExample.createCriteria();
		chnlGroupViewCri.andChannelIdEqualTo(channelId);
		return chnlGroupViewDAO.selectByExample(chnlGroupViewExample);
	}

	public Integer findMaxId() {
		// TODO Auto-generated method stub
		return channelDAO.selectMaxId();
	}
	
	
}
