package com.doadway.dwcms.core.user.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.user.biz.GroupBiz;
import com.doadway.dwcms.core.user.dao.GroupMapper;
import com.doadway.dwcms.core.user.pojo.Group;
import com.doadway.dwcms.core.user.pojo.GroupExample;
import com.doadway.dwcms.core.user.pojo.GroupExample.Criteria;
@Service
public class GroupBizImpl implements GroupBiz {
	@Resource
	GroupMapper groupDAO;
	public boolean batchDeleteGroup(String[] groupIds) {
		Integer flag = 0;
		for(String id:groupIds){
			groupDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==groupIds.length){
			return true;
		}
		return false;
	}

	public boolean deleteGroup(Integer groupId) {
		// TODO Auto-generated method stub
		return groupDAO.deleteByPrimaryKey(groupId)>0;
	}

	public List<Group> findAllGroup() {
		// TODO Auto-generated method stub
		GroupExample example = new GroupExample();
		Criteria cri = example.createCriteria();
		cri.andGroupIdIsNotNull();
		return groupDAO.selectByExample(example);
	}

	public Group findGroupById(Integer groupId) {
		// TODO Auto-generated method stub
		return groupDAO.selectByPrimaryKey(groupId);
	}

	public boolean saveOrUpdateGroup(Group group) {
		// TODO Auto-generated method stub
		if(group.getGroupId()!=null&&!"".equals(group.getGroupId())){
			return groupDAO.updateByPrimaryKeySelective(group)>0;
		}else{
			group.setGroupId(groupDAO.selectMaxId()+1);
			group.setIsRegDef(false);
			return groupDAO.insert(group)>0;
		}
	}

	public boolean savePriority(String[] groupIds, String[] prioritys) {
		Integer flag = 0;
		for(String id:groupIds){
			Group group = this.findGroupById(Integer.parseInt(id));
			group.setPriority(Integer.parseInt(prioritys[flag]));
			this.saveOrUpdateGroup(group);
			if(flag==groupIds.length-1){
				return true;
			}			
			flag++;
		}
		return false;
	}

	public boolean setupDefaultGroup(Integer groupId) {
		// TODO Auto-generated method stub
		Group group = this.findGroupById(groupId);
		group.setIsRegDef(true);
		this.saveOrUpdateGroup(group);
		GroupExample example = new GroupExample();
		Criteria cri = example.createCriteria();
		cri.andGroupIdNotEqualTo(groupId);
		List<Group> grouplList = groupDAO.selectByExample(example);
		Integer  flag = 0;
		for(Group g:grouplList){
			g.setIsRegDef(false);
			this.saveOrUpdateGroup(g);
			if(flag==(grouplList.size()-1)){
				return true;
			}
			flag++;
		}
		return false;
	}

}
