package com.doadway.dwcms.core.config.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.config.biz.ModelItemBiz;
import com.doadway.dwcms.core.config.dao.ModelItemMapper;
import com.doadway.dwcms.core.config.pojo.ModelItem;
import com.doadway.dwcms.core.config.pojo.ModelItemExample;
import com.doadway.dwcms.core.config.pojo.ModelItemExample.Criteria;
@Service
public class ModelItemBizImpl implements ModelItemBiz {
	@Resource
	private ModelItemMapper modelItemDAO;
	public boolean batchRemoveItem(String[] ids) {
		// TODO Auto-generated method stub
		Integer flag = 0;
		for(String id:ids){
			this.deleteItem(Integer.parseInt(id));
			if(flag==ids.length-1){
				return true;
			}
			flag++;
		}
		return false;
	}


	public boolean batchSaveDisplay(String[] ids, String[] displays) {
		Integer flag = 0;
		for(String id:ids){
			ModelItem tempModelItem = this.findItemById(Integer.parseInt(id));
			tempModelItem.setIsDisplay(new Boolean(displays[flag]));
			this.updateModeItem(tempModelItem);
			if(flag==ids.length-1){
				return true;
			}			
			flag++;
		}
		return false;
	}

	public boolean batchSaveItemsLabel(String[] ids, String[] itemLabels) {
		Integer flag = 0;
		for(String id:ids){
			ModelItem tempModelItem = this.findItemById(Integer.parseInt(id));
			tempModelItem.setItemLabel(itemLabels[flag]);
			this.updateModeItem(tempModelItem);
			if(flag==ids.length-1){
				return true;
			}			
			flag++;
		}
		return false;
	}

	public boolean batchSavePrioritys(String[] ids, String[] prioritys) {
		Integer flag = 0;
		for(String id:ids){
			ModelItem tempModelItem = this.findItemById(Integer.parseInt(id));
			tempModelItem.setPriority(Integer.parseInt(prioritys[flag]));
			this.updateModeItem(tempModelItem);
			if(flag==ids.length-1){
				return true;
			}			
			flag++;
		}
		return false;
	}

	public boolean batchSaveSingle(String[] ids, String[] singles) {
		Integer flag = 0;
		for(String id:ids){
			ModelItem tempModelItem = this.findItemById(Integer.parseInt(id));
			tempModelItem.setIsSingle(new Boolean(singles[flag]));
			this.updateModeItem(tempModelItem);
			if(flag==ids.length-1){
				return true;
			}			
			flag++;
		}
		return false;
	}

	public boolean deleteItem(Integer id) {
		// TODO Auto-generated method stub
		return modelItemDAO.deleteByPrimaryKey(id)>0;
	}

	public List<ModelItem> findItemsByModelId(Integer modelId,String isChannel) {
		ModelItemExample example = new ModelItemExample();
		Criteria cri = example.createCriteria();
		cri.andModelIdEqualTo(modelId);
		cri.andIsChannelEqualTo(new Boolean(isChannel));
		// TODO Auto-generated method stub
		return modelItemDAO.selectByExample(example);
	}

	public List<ModelItem> findItemsByModelId(Integer modelId) {
		ModelItemExample example = new ModelItemExample();
		Criteria cri = example.createCriteria();
		cri.andModelIdEqualTo(modelId);
		// TODO Auto-generated method stub
		return modelItemDAO.selectByExample(example);
	}

	public boolean saveModelItem(ModelItem item) {
		// TODO Auto-generated method stub
		return modelItemDAO.insertSelective(item)>0;
	}

	public boolean updateModeItem(ModelItem item) {
		// TODO Auto-generated method stub
		return modelItemDAO.updateByPrimaryKeySelective(item)>0;
	}


	public ModelItem findItemById(Integer id) {
		// TODO Auto-generated method stub
		return modelItemDAO.selectByPrimaryKey(id);
	}

	public Integer findMaxId() {
		// TODO Auto-generated method stub
		return modelItemDAO.selectMaxId();
	}

}
