package com.doadway.dwcms.core.config.biz;

import com.doadway.dwcms.core.config.pojo.Config;

public interface ConfigBiz {
	public boolean setConfig(Config config);
	public Config findConfigById(Integer id);
}
