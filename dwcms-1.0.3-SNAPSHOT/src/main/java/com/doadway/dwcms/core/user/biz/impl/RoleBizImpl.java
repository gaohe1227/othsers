package com.doadway.dwcms.core.user.biz.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.user.biz.RoleBiz;
import com.doadway.dwcms.core.user.dao.RoleMapper;
import com.doadway.dwcms.core.user.dao.RolePermissionMapper;
import com.doadway.dwcms.core.user.pojo.Role;
import com.doadway.dwcms.core.user.pojo.RoleExample;
import com.doadway.dwcms.core.user.pojo.RolePermission;
import com.doadway.dwcms.core.user.pojo.RolePermissionExample;
import com.doadway.dwcms.core.user.pojo.RolePermissionExample.Criteria;

@Service
public class RoleBizImpl implements RoleBiz {
	@Resource
	RoleMapper roleDAO;
	@Resource
	RolePermissionMapper rolePermissionMapper;
	public boolean batchDeleteRoleByIds(String[] ids) {
		Integer flag = 0;
		for(String id:ids){
			RolePermissionExample example =new RolePermissionExample();
			Criteria cri=example.createCriteria();
			cri.andRoleIdEqualTo(Integer.parseInt(id));
			rolePermissionMapper.deleteByExample(example);
			roleDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==ids.length){
			return true;
		}
		return false;
	}

	public boolean deleteRoleById(Integer id) {
		// TODO Auto-generated method stub
		return roleDAO.deleteByPrimaryKey(id)>0;
	}

	public List<Role> findAllRole() {
		RoleExample example = new RoleExample();
		com.doadway.dwcms.core.user.pojo.RoleExample.Criteria cri = example.createCriteria();
		cri.andRoleIdIsNotNull();
		return roleDAO.selectByExample(example);
	}

	public Role findRoleById(Integer id) {
		// TODO Auto-generated method stub
		return roleDAO.selectByPrimaryKey(id);
	}

	public boolean saveOrUpdateRole(Role role,String[] perms) {
		if(role.getRoleId()!=null&&!"".equals(role.getRoleId())){
			boolean rflag =false;
			boolean pflag = false;
			Integer flag = 0;
			rflag= roleDAO.updateByPrimaryKeySelective(role)>0;
			RolePermissionExample example =new RolePermissionExample();
			Criteria cri=example.createCriteria();
			cri.andRoleIdEqualTo(role.getRoleId());
			rolePermissionMapper.deleteByExample(example);
			for(String perm:perms){
				RolePermission rPerm = new RolePermission();
				rPerm.setRoleId(role.getRoleId());
				if(perm.contains(",")){
					String[] subPerm=perm.split(",");
					for(String subUri:subPerm){
						rPerm.setUri(subUri);
						rolePermissionMapper.insert(rPerm);
					}
				}else{
					rPerm.setUri(perm);
					rolePermissionMapper.insert(rPerm);
				}
				flag++;
			}
			if(flag==perms.length){
				pflag=true;
			}
			return rflag&&pflag;
			
		}else{
			Integer roleId = roleDAO.selectMaxId()+1;
			role.setRoleId(roleId);
			boolean aflag = false;
			aflag = roleDAO.insert(role)>0;
			boolean pflag = false;
			Integer flag = 0;
			for(String perm:perms){
				RolePermission rPerm = new RolePermission();
				rPerm.setRoleId(role.getRoleId());
				if(perm.contains(",")){
					String[] subPerm=perm.split(",");
					for(String subUri:subPerm){
						rPerm.setUri(subUri);
						rolePermissionMapper.insert(rPerm);
					}
				}else{
					rPerm.setUri(perm);
					rolePermissionMapper.insert(rPerm);
				}
				flag++;
			}
			if(flag==perms.length){
				pflag=true;
			}
			return aflag&&pflag;
		}
		
	}

	public List<String> getPermissionByRoleId(Integer roleId) {
		// TODO Auto-generated method stub
		List<String> permissions=new ArrayList<String>();
		RolePermissionExample example =new RolePermissionExample();
		Criteria cri=example.createCriteria();
		cri.andRoleIdEqualTo(roleId);
		List<RolePermission> rPermissionList = rolePermissionMapper.selectByExample(example);
		for(int i=0;i<rPermissionList.size();i++){
			permissions.add(rPermissionList.get(i).getUri());
		}
		return permissions;
	}
	
	
	
}
