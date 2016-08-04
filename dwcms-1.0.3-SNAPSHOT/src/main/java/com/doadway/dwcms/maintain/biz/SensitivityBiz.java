package com.doadway.dwcms.maintain.biz;

import java.util.List;

import com.doadway.dwcms.maintain.pojo.Sensitivity;

public interface SensitivityBiz {
	public boolean saveSensitivity(Sensitivity sensitivity);
	public List<Sensitivity> findAllSensitivity();
	public boolean batchDeleteSensitivity(String[] sensitivityIds);
	public boolean batchUpdateSensitivity(List<Sensitivity> sensitivityList);
}
