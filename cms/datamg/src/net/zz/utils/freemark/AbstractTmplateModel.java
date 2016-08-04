package net.zz.utils.freemark;

public abstract class AbstractTmplateModel {
	
	/**
	 * 表达式
	 * 在模板文件中 ${Expression}这样调用
	 * @return
	 */
	public abstract String getModelExpression();

}
