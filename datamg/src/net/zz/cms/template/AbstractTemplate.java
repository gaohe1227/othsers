package net.zz.cms.template;

public abstract class AbstractTemplate {
	
	private String tempName;
	
	private String savePath;

	public String getTempName() {
		return tempName;
	}

	public void setTempName(String tempName) {
		this.tempName = tempName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
}
