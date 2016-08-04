package net.zz.sys.service.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zz.sys.model.LoginUser;
import net.zz.sys.model.Role;
import net.zz.sys.service.LoginUserService;
import net.zz.utils.StringUtils;
import net.zz.utils.base.dao.BaseDaoI;
import net.zz.utils.base.service.impl.BaseServiceImpl;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月11日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@Service
public class LoginUserServiceImpl extends BaseServiceImpl<LoginUser> implements
		LoginUserService {
	
	@Autowired
	private BaseDaoI<Role> roleDao;

	@Override
	public Serializable save(LoginUser o) {
		o.setPassword(StringUtils.encodePassword(o.getPassword(), "MD5"));
		o.setCreateTime(new Date(System.currentTimeMillis()));
		if(!StringUtils.isEmpty(o.getRoleIds())){
			Set<Role> roles = new HashSet<Role>();
			Role role = null;
			for(String roleId:o.getRoleIds().split(",")){
				role = roleDao.getById(Role.class, roleId.trim());
				roles.add(role);
			}
			o.setRoles(roles);
		}
		return super.save(o);
	}

	@Override
	public void update(LoginUser o) {
		LoginUser user = getById(o.getId());
		user.setDescription(o.getDescription());
		user.setIsLock(o.getIsLock());
		user.setRoles(null);
		if(!StringUtils.isEmpty(o.getRoleIds())){
			Set<Role> roles = new HashSet<Role>();
			Role role = null;
			for(String roleId:o.getRoleIds().split(",")){
				role = roleDao.getById(Role.class, roleId.trim());
				roles.add(role);
			}
			user.setRoles(roles);
		}
		super.update(user);
	}

}
