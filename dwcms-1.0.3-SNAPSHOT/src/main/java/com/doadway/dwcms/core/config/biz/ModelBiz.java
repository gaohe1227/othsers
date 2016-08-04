package com.doadway.dwcms.core.config.biz;

import java.util.List;

import com.doadway.dwcms.core.config.pojo.Model;

public interface ModelBiz {
	public boolean saveModel(Model model);
	public boolean updateModel(Model newModel);
	public boolean deleteModel(Integer id);
	public Model   findModelById(Integer id);
	public List<Model> findAllModel();
	public boolean batchDeleteModelByIds(String[] ids);
	public boolean batchSavePrioritys(String[] ids,String[] prioritys);
	public boolean batchSaveDisabled(String[] ids,String[] disabled);
	public boolean setupDefaultModel(Integer id);
}
