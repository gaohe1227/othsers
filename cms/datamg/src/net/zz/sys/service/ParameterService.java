package net.zz.sys.service;

import java.util.List;

import net.zz.sys.model.Parameter;
import net.zz.utils.base.service.BaseServiceI;
import net.zz.utils.base.vo.Tree;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月31日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
public interface ParameterService extends BaseServiceI<Parameter> {
	/**
	 * 查询所有的参数选项
	 * comment here
	 * @return
	 * @since datamg 1.0
	 */
	public List<Tree> findParameters();
}
