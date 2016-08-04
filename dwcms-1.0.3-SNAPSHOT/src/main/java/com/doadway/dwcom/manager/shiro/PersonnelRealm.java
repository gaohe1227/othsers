/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package com.doadway.dwcom.manager.shiro;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.stereotype.Service;

import com.doadway.dwcom.crm.biz.PersonnelBiz;
import com.doadway.dwcom.crm.pojo.dto.PersonnelDTO;
import com.google.common.base.Objects;
@Service
public class PersonnelRealm extends AuthorizingRealm {
	@Resource
	protected PersonnelBiz personnelBiz;

	/**
	 * 认证回调函数,登录时调用.
	 */
	
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		/* 这里编写认证代码 */
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		PersonnelDTO personnelDto = personnelBiz.findPersonnelByUsername(token.getUsername());
		try{
			if (personnelDto.getUsername()!=null) {
				return new SimpleAuthenticationInfo(new ShiroPersonnel(personnelDto.getPersonnelId(),personnelDto.getUsername(),personnelDto.getRealname()),
						personnelDto.getPassword(), personnelDto.getUsername());
			}else{
				return null;
			}			
		}catch(NullPointerException e){
			return null;
		}

	}

	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 */
	
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		/* 这里编写授权代码 */
		Set<String> roleNames = new HashSet<String>();
	    Set<String> permissions = new HashSet<String>();
	    roleNames.add("personnel");
	    permissions.add("/personnel/*");
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roleNames);
	    info.setStringPermissions(permissions);
		return info;
	}

	/**
	 * 设定Password校验的Hash算法与迭代次数.
	 */
//	@PostConstruct
//	public void initCredentialsMatcher() {
//		HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(CmAssociatorBizImpl.HASH_ALGORITHM);
//		matcher.setHashIterations(CmAssociatorBizImpl.HASH_INTERATIONS);
//
//		setCredentialsMatcher(matcher);
//	}



	public PersonnelBiz getPersonnelBiz() {
		return personnelBiz;
	}

	public void setPersonnelBiz(PersonnelBiz personnelBiz) {
		this.personnelBiz = personnelBiz;
	}




	/**
	 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
	 */
	public static class ShiroPersonnel implements Serializable {
		private static final long serialVersionUID = -1373760761780840081L;
		public Integer id;
		public String loginName;
		public String name;

		public ShiroPersonnel(Integer id, String loginName, String name) {
			this.id = id;
			this.loginName = loginName;
			this.name = name;
		}

		public String getName() {
			return name;
		}
		public String getLoginName() {
			return name;
		}
		/**
		 * 本函数输出将作为默认的<shiro:principal/>输出.
		 */
		
		public String toString() {
			return loginName;
		}

		/**
		 * 重载hashCode,只计算loginName;
		 */
		
		public int hashCode() {
			return Objects.hashCode(loginName);
		}

		/**
		 * 重载equals,只计算loginName;
		 */
		
		public boolean equals(Object obj) {
			if (this == obj) {
				return true;
			}
			if (obj == null) {
				return false;
			}
			if (getClass() != obj.getClass()) {
				return false;
			}
			ShiroPersonnel other = (ShiroPersonnel) obj;
			if (loginName == null) {
				if (other.loginName != null) {
					return false;
				}
			} else if (!loginName.equals(other.loginName)) {
				return false;
			}
			return true;
		}
	}
}