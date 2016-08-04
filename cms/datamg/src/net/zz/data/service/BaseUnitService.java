package net.zz.data.service;

import java.util.List;

import net.zz.data.model.BaseUnit;
import net.zz.utils.base.service.BaseServiceI;
import net.zz.utils.base.vo.Tree;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月25日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
public interface BaseUnitService extends BaseServiceI<BaseUnit> {

	/**
	 * 查询机构的树列表
	 * comment here
	 * @return
	 * @since datamg 1.0
	 */
	public List<Tree> findUnits();
}
