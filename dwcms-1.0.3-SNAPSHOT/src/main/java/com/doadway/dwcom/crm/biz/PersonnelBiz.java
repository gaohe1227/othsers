package com.doadway.dwcom.crm.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcom.crm.pojo.dto.PersonnelDTO;

public interface PersonnelBiz {
	public boolean saveOrUpdatePersonnel(PersonnelDTO personnelDTO);
	
	public boolean batchDeletePersonnel(String[] personnelIds);
	
	public List<PersonnelDTO>  findPersonnelDTOByPage(Page page,Map<String,Object> params);
	public List<PersonnelDTO>  findPersonnelExtByPage(Page page,Map<String,Object> params);
	
	public PersonnelDTO  findPersonnelById(Integer personnelId);

	public PersonnelDTO  findPersonnelByUsername(String username);
	
	public boolean isExistByEmail(String email);
	
	public boolean updateSelfExtInfo(PersonnelDTO personnelDTO);
}
