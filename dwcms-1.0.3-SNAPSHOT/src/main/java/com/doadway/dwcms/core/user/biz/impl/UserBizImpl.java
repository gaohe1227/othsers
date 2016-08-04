package com.doadway.dwcms.core.user.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.user.biz.UserBiz;
import com.doadway.dwcms.core.user.dao.DcUserMapper;
import com.doadway.dwcms.core.user.dao.DoUserMapper;
import com.doadway.dwcms.core.user.dao.GroupMapper;
import com.doadway.dwcms.core.user.dao.UserExtMapper;
import com.doadway.dwcms.core.user.dao.UserRoleMapper;
import com.doadway.dwcms.core.user.dao.UserSiteMapper;
import com.doadway.dwcms.core.user.pojo.DcUser;
import com.doadway.dwcms.core.user.pojo.DoUser;
import com.doadway.dwcms.core.user.pojo.DoUserExample;
import com.doadway.dwcms.core.user.pojo.Group;
import com.doadway.dwcms.core.user.pojo.UserExt;
import com.doadway.dwcms.core.user.pojo.DoUserExample.Criteria;
import com.doadway.dwcms.core.user.pojo.dto.UserDTO;
@Service
public class UserBizImpl implements UserBiz {
	@Resource
	DcUserMapper   dcUserDAO;
	@Resource
	DoUserMapper   doUserDAO;
	@Resource
	UserExtMapper  userExtDAO;
	@Resource
	UserRoleMapper userRoleDAO;
	@Resource
	UserSiteMapper userSiteDAO;
	@Resource
	GroupMapper          groupDAO;
	
	public boolean batchDeleteUserByIds(String[] ids) {
		Integer flag = 0;
		for(String id:ids){
			userExtDAO.deleteByPrimaryKey(Integer.parseInt(id));
			dcUserDAO.deleteByPrimaryKey(Integer.parseInt(id));
			doUserDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==ids.length){
			return true;
		}
		return false;
	}

	public boolean deleteUserById(Integer id) {
		// TODO Auto-generated method stub
		if(this.findUserById(id)==null){
			return false;
		}
		boolean uflag = userExtDAO.deleteByPrimaryKey(id)>0;
		boolean dcflag = dcUserDAO.deleteByPrimaryKey(id)>0;
		boolean doflag = doUserDAO.deleteByPrimaryKey(id)>0;
		return uflag&&dcflag&&doflag;
	}

	public UserDTO findUserById(Integer id) {
		// TODO Auto-generated method stub
		UserDTO userDTO = new UserDTO();
		try {
			DcUser dcUser = dcUserDAO.selectByPrimaryKey(id);
			if(dcUser!=null){
				BeanUtils.copyProperties(userDTO,dcUser);
				DoUser doUser = doUserDAO.selectByPrimaryKey(id);
				BeanUtils.copyProperties(userDTO,doUser);
				UserExt userExt = userExtDAO.selectByPrimaryKey(id);
				BeanUtils.copyProperties(userDTO,userExt);
				Group group = groupDAO.selectByPrimaryKey(dcUser.getGroupId());
				BeanUtils.copyProperties(userDTO,group);
			}
			
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userDTO;
	}

	public List<UserDTO> findUserByPage(Page page,Map<String,Object> params) {
		// TODO Auto-generated method stub
		List<UserDTO> userList = new ArrayList<UserDTO>();
		params.put("isAdmin", 0);
		List<DcUser> dcUserList = dcUserDAO.selectByPage(page,params);
		for(DcUser dUser:dcUserList){
			UserDTO tempUserDto = new UserDTO();
			try {
				BeanUtils.copyProperties(tempUserDto, dUser);
				userList.add(tempUserDto);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return userList;
	}

	public boolean saveOrUpdateUser(UserDTO userDto) {
		// TODO Auto-generated method stub
		try {
			DcUser dcUser = new DcUser();
			BeanUtils.copyProperties(dcUser,userDto);
			DoUser doUser = new DoUser();
			BeanUtils.copyProperties(doUser,userDto);
			UserExt userExt = new UserExt();
			BeanUtils.copyProperties(userExt,userDto);
			if(userDto.getUserId()!=null){
				int dcFlag = dcUserDAO.updateByPrimaryKeySelective(dcUser);
				int doFlag = doUserDAO.updateByPrimaryKeySelective(doUser);
				int uExtFlag=userExtDAO.updateByPrimaryKeySelective(userExt);
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

	public UserDTO findUserByUserName(String userName) {
		// TODO Auto-generated method stub
		UserDTO userDTO = new UserDTO();
		try {
			DoUserExample example =new DoUserExample();
			Criteria cri = example.createCriteria();
			cri.andUsernameEqualTo(userName);
			List<DoUser> doUserList = doUserDAO.selectByExample(example);
			if(doUserList!=null&&doUserList.size()>0){
				DoUser doUser = doUserList.get(0);
				BeanUtils.copyProperties(userDTO,doUser);
				return userDTO;
			}
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userDTO;
	}

	public int findMaxId() {
		// TODO Auto-generated method stub
		return dcUserDAO.selectMaxId();
	}

	
}
