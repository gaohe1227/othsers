package com.doadway.dwcms.core.user.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.user.biz.ManagerBiz;
import com.doadway.dwcms.core.user.biz.UserBiz;
import com.doadway.dwcms.core.user.dao.DcUserMapper;
import com.doadway.dwcms.core.user.dao.DoUserMapper;
import com.doadway.dwcms.core.user.dao.GroupMapper;
import com.doadway.dwcms.core.user.dao.UserExtMapper;
import com.doadway.dwcms.core.user.dao.UserRoleMapper;
import com.doadway.dwcms.core.user.dao.UserSiteMapper;
import com.doadway.dwcms.core.user.pojo.DcUser;
import com.doadway.dwcms.core.user.pojo.DoUser;
import com.doadway.dwcms.core.user.pojo.Group;
import com.doadway.dwcms.core.user.pojo.UserExt;
import com.doadway.dwcms.core.user.pojo.UserRoleExample;
import com.doadway.dwcms.core.user.pojo.UserRoleKey;
import com.doadway.dwcms.core.user.pojo.UserSite;
import com.doadway.dwcms.core.user.pojo.UserSiteExample;
import com.doadway.dwcms.core.user.pojo.UserRoleExample.Criteria;
import com.doadway.dwcms.core.user.pojo.dto.ManagerDTO;
import com.doadway.dwcms.core.user.pojo.dto.UserDTO;
@Service
public class ManagerBizImpl implements ManagerBiz {
	@Resource
	UserBiz userBiz;
	@Resource
	DoUserMapper doUserDAO;
	@Resource
	DcUserMapper dcUserDAO;
	@Resource
	UserExtMapper userExtDAO;
	@Resource
	UserRoleMapper userRoleDAO;
	@Resource
	UserSiteMapper userSiteDAO;
	@Resource
	GroupMapper          groupDAO;
	
	public boolean batchDeleteManagerByIds(String[] ids) {
		Integer flag = 0;
		for(String id:ids){
			UserDTO userDto = userBiz.findUserById(Integer.parseInt(id));
			UserRoleExample example =new UserRoleExample();
			Criteria cri = example.createCriteria();
			cri.andUserIdEqualTo(userDto.getUserId());
			userRoleDAO.deleteByExample(example);
			
			UserSiteExample usersiteExample =new UserSiteExample();
			com.doadway.dwcms.core.user.pojo.UserSiteExample.Criteria usersiteCri = usersiteExample.createCriteria();
			usersiteCri.andUserIdEqualTo(userDto.getUserId());
			userSiteDAO.deleteByExample(usersiteExample );
			
			userBiz.deleteUserById(Integer.parseInt(id));
			
			flag++;
		}
		if(flag==ids.length){
			return true;
		}
		return false;
	}



	public ManagerDTO findManagerById(Integer id) {
		// TODO Auto-generated method stub
		ManagerDTO managerDto = new ManagerDTO();
			try {
				DcUser dcUser = dcUserDAO.selectByPrimaryKey(id);
				BeanUtils.copyProperties(managerDto,dcUser);
				DoUser doUser = doUserDAO.selectByPrimaryKey(id);
				BeanUtils.copyProperties(managerDto,doUser);
				UserExt userExt = userExtDAO.selectByPrimaryKey(id);
				BeanUtils.copyProperties(managerDto,userExt);
				Group group = groupDAO.selectByPrimaryKey(dcUser.getGroupId());
				BeanUtils.copyProperties(managerDto,group);
				
				UserRoleExample userRoleCriExample =new UserRoleExample();
				Criteria userRoleCri = userRoleCriExample.createCriteria();
				userRoleCri.andUserIdEqualTo(managerDto.getUserId());
				List<UserRoleKey> userRoleList = userRoleDAO.selectByExample(userRoleCriExample);
				managerDto.setUserRoleList(userRoleList);
				
				UserSiteExample userSiteExample = new UserSiteExample();
				com.doadway.dwcms.core.user.pojo.UserSiteExample.Criteria userSiteCri = userSiteExample.createCriteria();
				userSiteCri.andUserIdEqualTo(managerDto.getUserId());
				List<UserSite> userSiteList=userSiteDAO.selectByExample(userSiteExample );
				managerDto.setUserSiteList(userSiteList);
				
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return managerDto;
	}

	public List<ManagerDTO> findManagerByPage(Page page,Map<String,Object> params) {
		// TODO Auto-generated method stub
		List<ManagerDTO> managerList = new ArrayList<ManagerDTO>();
		params.put("isAdmin", 1);
		List<DcUser> dcUserList = dcUserDAO.selectByPage(page,params);
		for(DcUser dUser:dcUserList){
			ManagerDTO tempManagerDto = new ManagerDTO();
			try {
				BeanUtils.copyProperties(tempManagerDto, dUser);
				
				UserExt userExt = userExtDAO.selectByPrimaryKey(dUser.getUserId());
				BeanUtils.copyProperties(tempManagerDto, userExt);
				
				UserRoleExample userRoleCriExample =new UserRoleExample();
				Criteria userRoleCri = userRoleCriExample.createCriteria();
				userRoleCri.andUserIdEqualTo(dUser.getUserId());
				List<UserRoleKey> userRoleList = userRoleDAO.selectByExample(userRoleCriExample);
				tempManagerDto.setUserRoleList(userRoleList);
				
				UserSiteExample userSiteExample = new UserSiteExample();
				com.doadway.dwcms.core.user.pojo.UserSiteExample.Criteria userSiteCri = userSiteExample.createCriteria();
				userSiteCri.andUserIdEqualTo(dUser.getUserId());
				List<UserSite> userSiteList=userSiteDAO.selectByExample(userSiteExample );
				tempManagerDto.setUserSiteList(userSiteList);
				
				managerList.add(tempManagerDto);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return managerList;
	}

	public boolean saveOrUpdateManager(ManagerDTO managerDto) {
		// TODO Auto-generated method stub
		try {
			DcUser dcUser = new DcUser();
			BeanUtils.copyProperties(dcUser,managerDto);
			DoUser doUser = new DoUser();
			BeanUtils.copyProperties(doUser,managerDto);
			UserExt userExt = new UserExt();
			BeanUtils.copyProperties(userExt,managerDto);
			if(managerDto.getUserId()!=null){
				int dcFlag = dcUserDAO.updateByPrimaryKeySelective(dcUser);
				int doFlag = doUserDAO.updateByPrimaryKeySelective(doUser);
				int uExtFlag=userExtDAO.updateByPrimaryKeySelective(userExt);
				
				UserRoleExample userRoleExample=new UserRoleExample();
				Criteria userRoleCri = userRoleExample.createCriteria();
				userRoleCri.andUserIdEqualTo(managerDto.getUserId());
				userRoleDAO.deleteByExample(userRoleExample);
				for(UserRoleKey userRoleKey:managerDto.getUserRoleList()){
					userRoleDAO.insert(userRoleKey);
				}
				
				if(dcFlag>0&&doFlag>0&&uExtFlag>0){
					return true;
				}
			}else{
				Integer userId = dcUserDAO.selectMaxId()+1;
				dcUser.setUserId(userId);
				doUser.setUserId(userId);
				userExt.setUserId(userId);
				
				int dcFlag = dcUserDAO.insert(dcUser);
				int doFlag = doUserDAO.insert(doUser);
				int uExtFlag=userExtDAO.insert(userExt);	
				managerDto.setUserId(userId);
				for(UserRoleKey userRoleKey:managerDto.getUserRoleList()){
					userRoleKey.setUserId(managerDto.getUserId());
					userRoleDAO.insert(userRoleKey);
				}
				
				if(dcFlag>0&&doFlag>0&&uExtFlag>0){
					return true;
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



	public List<UserRoleKey> findAllUserRoleByUserId(Integer userId) {
		UserRoleExample example=new UserRoleExample();
		// TODO Auto-generated method stub
		Criteria cri = example.createCriteria();
		cri.andUserIdEqualTo(userId);
		return userRoleDAO.selectByExample(example);
	}



	public int findMaxId() {
		// TODO Auto-generated method stub
		return dcUserDAO.selectMaxId();
	}

}
