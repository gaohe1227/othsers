package net.zz.data.service.impl;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zz.data.model.BaseUser;
import net.zz.data.service.BaseUserService;
import net.zz.sys.model.LoginUser;
import net.zz.sys.model.Role;
import net.zz.utils.StringUtils;
import net.zz.utils.base.dao.BaseDaoI;
import net.zz.utils.base.service.impl.BaseServiceImpl;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月31日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@Service
public class BaseUserServiceImpl extends BaseServiceImpl<BaseUser> implements
		BaseUserService {
	
	@Autowired
	private BaseDaoI<LoginUser> loginDao;
	
	@Autowired
	private BaseDaoI<Role> roleDao;

	@Override
	public Serializable save(BaseUser o) {
		if(o.getIsLogin()){ //生成登录用户
			LoginUser login = new LoginUser();
			login.setId(o.getId());
			login.setCreateTime(o.getCreateTime());
			login.setDescription(o.getDescription());
			login.setIsLock(false);//未锁定
			login.setLoginName(o.getUserName());
			login.setType(1); //普通用户
			login.setPassword(StringUtils.encodePassword("123456", "MD5"));
			Set<Role> roles = login.getRoles();
			roles.add(roleDao.getById(Role.class, o.getUserType()));
			login.setRoles(roles);
			loginDao.save(login); //保存登录用户
		}
		return super.save(o);
	}

	@Override
	public void delete(BaseUser o) {
		if(o.getIsLogin()){ //删除用户的时候判断是否存在登录用户
			LoginUser login = loginDao.getById(LoginUser.class, o.getId());
			if(null!=login){
				loginDao.delete(login);
			}
		}
		super.delete(o);
	}
	
	

	@Override
	public void deleteBatch(List<BaseUser> pos) {
		for(BaseUser baseUser:pos){
			delete(baseUser);
		}
	}

	@Override
	public void update(BaseUser o) {
		LoginUser login = loginDao.getById(LoginUser.class, o.getId());
		if(o.getIsLogin()){
			if(null!=login){
				login.setRoles(null);
				Set<Role> roles = new HashSet<Role>();
				roles.add(roleDao.getById(Role.class, o.getUserType()));
				login.setRoles(roles);
				loginDao.update(login); //保存登录用户
			}else{
				login = new LoginUser();
				login.setId(o.getId());
				login.setCreateTime(o.getCreateTime());
				login.setDescription(o.getDescription());
				login.setIsLock(false);//未锁定
				login.setLoginName(o.getUserName());
				login.setType(1); //普通用户
				login.setPassword(StringUtils.encodePassword("123456", "MD5"));
				Set<Role> roles = login.getRoles();
				roles.add(roleDao.getById(Role.class, o.getUserType()));
				login.setRoles(roles);
				loginDao.save(login); //保存登录用户
			}
		}else{
			if(null!=login){
				loginDao.delete(login);
			}
		}
		super.update(o);
	}
	
	
	
}
