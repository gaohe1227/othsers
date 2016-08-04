package net.zz.utils.base.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月11日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@SuppressWarnings("serial")
public class Grid implements Serializable {
	/**grid 数据集合*/
	private List<?> rows;
	/**数据总数*/
	private Long total;
	
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
}
