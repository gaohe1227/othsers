package com.doadway.dwcms.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doadway.common.shiro.UserRealm.ShiroUser;
import com.doadway.dwcms.core.user.biz.LogBiz;
import com.doadway.dwcms.core.user.biz.UserBiz;
import com.doadway.dwcms.core.user.pojo.dto.UserDTO;
import com.doadway.dwcms.web.CmsUtils;
@Controller
public class LoginControl {
	@Resource
	UserBiz userBiz;
	@Resource
	LogBiz logBiz;
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public  String login(HttpServletRequest request,UserDTO user,Map<String,Object> mv)  {
		Subject currentUser = SecurityUtils.getSubject();
		//前台传过来时应该用JS加密一次
	//	String  minwen=new Md5Hash( user.getPassword() ).toHex();
		String  psw=user.getPassword();
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),psw);
		//记住我功能不是记住密码而是在整个会话过程记住会话ID,对未登录用户时用购物车有点用
		/*
		if( rememberMe != null ){
			if( rememberMe ){
				token.setRememberMe(true);
			}
		}
		*/
		try {
		  currentUser.login(token);
		} catch (UnknownAccountException uae ) { 
			mv.put("info", "用户名不存在");
			logBiz.loginFailure(request, "登陆失败","username="+token.getUsername()+"password="+token.getPassword().toString());
			return "/login";
		} catch (IncorrectCredentialsException ice ) { 
			mv.put("info", "密码错误！");
			logBiz.loginFailure(request, "登陆失败","username="+token.getUsername()+"password="+token.getPassword().toString());
			return "/login";
		} catch (LockedAccountException lae ) { 
			mv.put("info", "用户已经被锁定不能登录,请与管理员联系");
			logBiz.loginFailure(request, "登陆失败", "用户已经被锁定不能登录,请与管理员联系");
			return "/login";
		} catch (ExcessiveAttemptsException eae ) { 
			mv.put("info", "错误次数过多");
			logBiz.loginFailure(request, "登陆失败", "错误次数过多");
			return "/login";
		} catch (AuthenticationException ae ) {
			mv.put("info", "用户密码错误");
			logBiz.loginFailure(request, "登陆失败","未知的登陆错误");
			return "/login";
		}
		//验证是否成功登录的方法
		if(currentUser.isAuthenticated()){
			logBiz.loginSuccess(request, CmsUtils.getShiroUser(), "登陆成功");
			return "/main";
		}
		return "/login";   

	}

	@RequestMapping("/admin/loginout")
	public  String loginout()  {
        Subject currentUser = SecurityUtils.getSubject();  
        currentUser.logout();  
        return "/login"; 		
	}
    @RequestMapping(value = "/chklogin", method = RequestMethod.POST)  
    @ResponseBody
    public String chkLogin() {  
        Subject currentUser = SecurityUtils.getSubject();  
        if (!currentUser.isAuthenticated()) {  
            return "false";  
        }  
        return "true";  
    }  
	@RequestMapping("/admin/center")
	public  String getCenter()  {
		return "/center";   
	}	
	@RequestMapping("/admin/down")
	public  String getDown()  {
		return "/down";   
	}	
	@RequestMapping("/admin/middel")
	public  String getMiddel()  {
		return "/middel";   
	}	
	@RequestMapping("/admin/welcome")
	public  String getWelcome()  {
		return "/index/welcome";   
	}	
	@RequestMapping("/admin/profile")
	public  String getProfile(Map<String,Object> mv)  {
		 Subject currentUser = SecurityUtils.getSubject(); 
		 ShiroUser user=(ShiroUser)currentUser.getPrincipal();
		 UserDTO uDto=userBiz.findUserById(user.id);
		 if(uDto!=null){
			 mv.put("userDto", uDto);
		 }
		return "/personal/profile";   
	}	
	@RequestMapping("/admin/login")
	public  String getLogin()  {
		return "/login";   
	}	
}
