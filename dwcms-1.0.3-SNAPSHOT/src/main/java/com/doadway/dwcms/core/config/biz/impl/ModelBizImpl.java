package com.doadway.dwcms.core.config.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.config.biz.ModelBiz;
import com.doadway.dwcms.core.config.dao.ModelMapper;
import com.doadway.dwcms.core.config.pojo.Model;
import com.doadway.dwcms.core.config.pojo.ModelExample;
import com.doadway.dwcms.core.config.pojo.ModelExample.Criteria;
@Service
public class ModelBizImpl implements ModelBiz {
	@Resource
	private ModelMapper modelDAO;
	public boolean batchDeleteModelByIds(String[] ids) {
		// TODO Auto-generated method stub
		Integer flag = 0;
		for(String id:ids){
			this.deleteModel(Integer.parseInt(id));
			if(flag==ids.length-1){
				return true;
			}
			flag++;
		}
		return false;
	}

	public boolean batchSavePrioritys(String[] ids,String[] prioritys) {
		// TODO Auto-generated method stub
		Integer flag = 0;
		for(String id:ids){
			Model tempModel = this.findModelById(Integer.parseInt(id));
			tempModel.setPriority(Integer.parseInt(prioritys[flag]));
			this.updateModel(tempModel);
			if(flag==ids.length-1){
				return true;
			}			
			flag++;
		}
		return false;
	}

	public boolean batchSaveDisabled(String[] ids, String[] disabled) {
		Integer flag = 0;
		for(String id:ids){
			Model tempModel = this.findModelById(Integer.parseInt(id));
			tempModel.setIsDisabled(new Boolean(disabled[flag]));
			this.updateModel(tempModel);
			if(flag==ids.length-1){
				return true;
			}			
			flag++;
		}
		return false;
	}

	public boolean deleteModel(Integer id) {
		// TODO Auto-generated method stub
		return modelDAO.deleteByPrimaryKey(id)>0;
	}

	public List<Model> findAllModel() {
		// TODO Auto-generated method stub
		ModelExample example= new ModelExample();
		example.setDistinct(true);
		return modelDAO.selectByExample(example);
	}

	public Model findModelById(Integer id) {
		// TODO Auto-generated method stub
		return modelDAO.selectByPrimaryKey(id);
	}


	public boolean saveModel(Model model) {
		// TODO Auto-generated method stub
		return modelDAO.insertSelective(model)>0;
	}

	public boolean setupDefaultModel(Integer id) {
		// TODO Auto-generated method stub
		Model model = this.findModelById(id);
		model.setIsDef(true);
		this.updateModel(model);
		ModelExample example =new ModelExample();
		Criteria cri= example.createCriteria();
		cri.andModelIdNotEqualTo(id);
		List<Model> modelList = modelDAO.selectByExample(example);
		Integer  flag = 0;
		for(Model otherModel:modelList){
			otherModel.setIsDef(false);
			this.updateModel(otherModel);
			if(flag==(modelList.size()-1)){
				return true;
			}
			flag++;
		}
		return false;
	}

	public boolean updateModel(Model newModel) {
		// TODO Auto-generated method stub
		return modelDAO.updateByPrimaryKeySelective(newModel)>0;
	}

}
