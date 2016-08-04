package com.doadway.dwcms.core.config.biz;

import java.util.List;

import com.doadway.dwcms.core.config.pojo.ModelItem;

public interface ModelItemBiz {
	public boolean saveModelItem(ModelItem item);
	public boolean updateModeItem(ModelItem item);
	public boolean deleteItem(Integer id);
	public ModelItem findItemById(Integer id);
	public List<ModelItem> findItemsByModelId(Integer modelId,String isChannel);
	public List<ModelItem> findItemsByModelId(Integer modelId);
	public boolean batchSaveItemsLabel(String[] ids,String[] itemLabels);
	public boolean batchSavePrioritys(String[] ids,String[] prioritys);
	public boolean batchSaveSingle(String[] ids,String[] singles);
	public boolean batchSaveDisplay(String[] ids,String[] displays);
	public boolean batchRemoveItem(String[] ids);
	public Integer findMaxId();
}
