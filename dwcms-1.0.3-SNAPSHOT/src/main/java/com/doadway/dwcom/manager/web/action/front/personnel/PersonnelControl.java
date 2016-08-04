package com.doadway.dwcom.manager.web.action.front.personnel;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.doadway.common.page.Page;
import com.doadway.common.shiro.UserRealm.ShiroUser;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcom.crm.biz.PersonnelBiz;
import com.doadway.dwcom.crm.pojo.dto.PersonnelDTO;
import com.doadway.dwcom.manager.shiro.PersonnelRealm.ShiroPersonnel;
@Controller
public class PersonnelControl {
	@Resource
	PersonnelBiz personnelBiz;
	@RequestMapping(value="/v_personnel.vm")
	public String  personnelAlone(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		Subject currentUser = SecurityUtils.getSubject();    
		if (currentUser.hasRole("personnel")) { 
			return "redirect:/personnel/v_center.vm";
		}
		if(request.getParameter("info")!=null&&!"".equals(request.getParameter("info"))){
			try {
				String val=new String(request.getParameter("info").getBytes("ISO-8859-1"),"UTF-8");
				model.put("info",val);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		Integer currentPage = 1;
		Integer showCount=4;
		if(request.getParameter("showCount")!=null){
			CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 10, "/personnel/center");
			showCount =CookieUtils.getPageSize(request);
		}
		if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
			currentPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p=new Page();
		p.setCurrentPage(currentPage);
		p.setShowCount(showCount);
		Map<String, Object> params =new HashMap<String,Object>();

		model.put("personnelDtoList", personnelBiz.findPersonnelExtByPage(p, params));
		model.put("page", p);
		return "personnel/login_regsiter"; 			
	}	
	@RequestMapping(value="/o_person_reg.vm")
	public String  personnelRegister(HttpServletRequest request, Map<String, Object> model,PersonnelDTO personnelDTO){
		boolean flag=false; 
		personnelDTO.setUsername(personnelDTO.getEmail());
		personnelDTO.setPassword(request.getParameter("userpwd1"));
		personnelDTO.setRegisterIp(request.getLocalAddr());
		personnelDTO.setRegisterTime(new Date(System.currentTimeMillis()));
		personnelDTO.setLoginCount(0);
		if(personnelBiz.isExistByEmail(personnelDTO.getEmail())){
			model.put("msg", "注册失败,email已存在");
		}else{
			flag=personnelBiz.saveOrUpdatePersonnel(personnelDTO); 
			model.put("msg", "恭喜你,注册成功!");
		}
		model.put("flag", flag);
		return "personnel/login_regsiter"; 			
	}	
	@RequestMapping(value="/o_person_login.vm")
	public String  personnelLogin(HttpServletRequest request, Map<String, Object> mv,PersonnelDTO personnelDTO){
		try {
		  Subject currentUser = SecurityUtils.getSubject();
			//前台传过来时应该用JS加密一次
		//	String  minwen=new Md5Hash( user.getPassword() ).toHex();
		  String  psw=personnelDTO.getPassword();
		  UsernamePasswordToken token = new UsernamePasswordToken(personnelDTO.getUsername(),psw);
		  currentUser.login(token);
		//验证是否成功登录的方法
		  if(currentUser.isAuthenticated()){
			 return "redirect:/personnel/v_center.vm";
		  }
		} catch (UnknownAccountException uae ) { 
			mv.put("info", "用户不存在");
			return "redirect:/v_personnel.vm";	 
		}catch (IncorrectCredentialsException ice ) {
			mv.put("info", "密码错误！");
			return "redirect:/v_personnel.vm";	
		} catch (LockedAccountException lae ) { 
			mv.put("info", "用户已被锁定");
			return "redirect:/v_personnel.vm";	 
		} catch (ExcessiveAttemptsException eae ) { 
			mv.put("info", "错误次数过多");
			return "redirect:/v_personnel.vm";	
		} catch (AuthenticationException ae ) {
			mv.put("info", "用户名密码错误!");
			return "redirect:/v_personnel.vm";	
		}

		return "personnel/login_regsiter"; 		
	}	
	@RequestMapping(value="/personnel/v_center.vm")
	public String  personnelCenter(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		Subject currentUser = SecurityUtils.getSubject();    
		if(currentUser.getPrincipal() instanceof  ShiroUser){
			currentUser.logout();
		}
		if (currentUser.hasRole("personnel")) { 
			 ShiroPersonnel shiroPersonel=(ShiroPersonnel)currentUser.getPrincipal();
			 PersonnelDTO personnelDto=personnelBiz.findPersonnelById(shiroPersonel.id);
			 model.put("personnelDto", personnelDto);
			 
			Integer currentPage = 1;
			Integer showCount=10;
			if(request.getParameter("showCount")!=null){
				CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 10, "/personnel/center");
				showCount =CookieUtils.getPageSize(request);
			}
			if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
				currentPage = Integer.parseInt(request.getParameter("pageNo"));
			}
			Page p=new Page();
			p.setCurrentPage(currentPage);
			p.setShowCount(showCount);
			Map<String, Object> params =new HashMap<String,Object>();

			if(request.getParameter("queryType")!=null&&!"".equals(request.getParameter("queryType"))){
				params.put("personnelType", request.getParameter("queryType"));
				model.put("personnelType",request.getParameter("queryType"));
			}
			if(request.getParameter("sh_job")!=null&&!"".equals(request.getParameter("sh_job"))){
				params.put("jobPosition", "%"+request.getParameter("sh_job")+"%");
				model.put("jobPosition",request.getParameter("sh_job"));
			}
			if(request.getParameter("sh_experience")!=null&&!"".equals(request.getParameter("sh_experience"))){
				params.put("workYears", request.getParameter("sh_experience"));
				model.put("workYears",request.getParameter("sh_experience"));
			}
			if(request.getParameter("sh_area")!=null&&!"".equals(request.getParameter("sh_area"))){
				params.put("presentAddress","%"+ request.getParameter("sh_area")+"%");
				model.put("presentAddress",request.getParameter("sh_area"));
			}
			if(request.getParameter("sh_ntime")!=null&&!"".equals(request.getParameter("sh_ntime"))){
				params.put("onboardTime","%"+ request.getParameter("sh_ntime")+"%");
				model.put("onboardTime",request.getParameter("sh_ntime"));
			}
			model.put("personnelDtoList", personnelBiz.findPersonnelExtByPage(p, params));
			model.put("page", p);
			return "/personnel/personel_center"; 
		} else { 
			model.put("info", "权限不够");
			return "redirect:/v_personnel.vm";	
		}   		
	}
	@RequestMapping(value="/personnel/o_update.vm")
	public String updPersonnelInfo(HttpServletRequest request, Map<String, Object> model,PersonnelDTO personnelDTO){
		boolean flag = false;
		flag=personnelBiz.updateSelfExtInfo(personnelDTO);
		model.put("flag",flag);
		return "redirect:/personnel/v_center.vm";	
	}
	@RequestMapping("/personnel_loginout")
	public  String loginout()  {
        Subject currentUser = SecurityUtils.getSubject();  
        currentUser.logout();  
        return "redirect:/v_personnel.vm"; 		
	}
}
