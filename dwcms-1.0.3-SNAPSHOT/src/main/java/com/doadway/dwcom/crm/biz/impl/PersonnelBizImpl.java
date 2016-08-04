package com.doadway.dwcom.crm.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcom.crm.biz.PersonnelBiz;
import com.doadway.dwcom.crm.dao.PersonnelExtMapper;
import com.doadway.dwcom.crm.dao.PersonnelMapper;
import com.doadway.dwcom.crm.pojo.Personnel;
import com.doadway.dwcom.crm.pojo.PersonnelExample;
import com.doadway.dwcom.crm.pojo.PersonnelExample.Criteria;
import com.doadway.dwcom.crm.pojo.PersonnelExt;
import com.doadway.dwcom.crm.pojo.dto.PersonnelDTO;
@Service
public class PersonnelBizImpl implements PersonnelBiz {
	@Resource
	PersonnelMapper personnelDAO;
	@Resource
	PersonnelExtMapper personnelExtDAO;
	public boolean saveOrUpdatePersonnel(PersonnelDTO personnelDTO) {
		try {
			if(personnelDTO==null){return false;}
			Personnel personel = new Personnel();
			PersonnelExt personelExt = new PersonnelExt();
			BeanUtils.copyProperties(personel, personnelDTO);
			BeanUtils.copyProperties(personelExt, personnelDTO);
			if(personnelDTO.getPersonnelId()!=null&&findPersonnelById(personnelDTO.getPersonnelId())!=null){
				boolean flag1=personnelDAO.updateByPrimaryKeySelective(personel)>0;
				boolean flag2=personnelExtDAO.updateByPrimaryKeySelective(personelExt)>0;
				return flag1&&flag2;
			}else{
				boolean flag1=personnelDAO.insert(personel)>0;
				personelExt.setPersonnelId(personel.getPersonnelId());
				boolean flag2=personnelExtDAO.insert(personelExt)>0;
				return flag1&&flag2;
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean batchDeletePersonnel(String[] personnelIds) {
		return false;
	}

	public List<PersonnelDTO> findPersonnelDTOByPage(Page page,
			Map<String, Object> params) {
		List<PersonnelDTO> personnelDtoList = new ArrayList<PersonnelDTO>();
		List<Personnel> personnelList=personnelDAO.selectByPage(page, params);
		if(personnelList.size()>0){
			for(Personnel p:personnelList){
				PersonnelDTO personnelDto =new PersonnelDTO();
				personnelDto=this.findPersonnelById(p.getPersonnelId());
				personnelDtoList.add(personnelDto);
			}
			return personnelDtoList;
		}
		return null;
	}

	public PersonnelDTO findPersonnelById(Integer personnelId) {
		try {
			PersonnelDTO personnelDto = new PersonnelDTO();
			Personnel personnel=personnelDAO.selectByPrimaryKey(personnelId);
			if(personnel!=null){
					BeanUtils.copyProperties(personnelDto, personnel);
					PersonnelExt personelExt = personnelExtDAO.selectByPrimaryKey(personnelId);
					if(personelExt!=null){
						BeanUtils.copyProperties(personnelDto, personelExt);
					}
					return personnelDto;
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return null;
	}

	public PersonnelDTO findPersonnelByUsername(String username) {
		try {
			PersonnelDTO personnelDto = new PersonnelDTO();
			Personnel personnel=new Personnel();
			PersonnelExample example=new PersonnelExample();
			Criteria personnelCri=example.createCriteria();
			personnelCri.andUsernameEqualTo(username);
			if(personnelDAO.selectByExample(example).size()>0){
				personnel=personnelDAO.selectByExample(example).get(0);
				BeanUtils.copyProperties(personnelDto, personnel);
				PersonnelExt personelExt = personnelExtDAO.selectByPrimaryKey(personnel.getPersonnelId());
				if(personelExt!=null){
					BeanUtils.copyProperties(personnelDto, personelExt);
				}
				return personnelDto;
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return null;
		
	}

	@Override
	public boolean isExistByEmail(String email) {
		return findPersonnelByUsername(email)!=null&&findPersonnelByUsername(email).getEmail()!=null;
	}

	@Override
	public List<PersonnelDTO> findPersonnelExtByPage(Page page,
			Map<String, Object> params) {
		List<PersonnelDTO> personnelDtoList = new ArrayList<PersonnelDTO>();
		List<PersonnelExt> personnelExtList=personnelExtDAO.selectByPage(page, params);
		if(personnelExtList.size()>0){
			for(PersonnelExt pExt:personnelExtList){
				PersonnelDTO personnelDto =new PersonnelDTO();
				personnelDto=this.findPersonnelById(pExt.getPersonnelId());
				personnelDtoList.add(personnelDto);
			}
			return personnelDtoList;
		}
		return null;
	}

	@Override
	public boolean updateSelfExtInfo(PersonnelDTO personnelDTO) {
		boolean flag=false;
		try {
			PersonnelExt personelExt = new PersonnelExt();
			BeanUtils.copyProperties(personelExt, personnelDTO);
			if(personnelDTO.getPersonnelId()!=null&&findPersonnelById(personnelDTO.getPersonnelId())!=null){
				flag=personnelExtDAO.updateByPrimaryKeySelective(personelExt)>0;
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return flag;
	}

}
