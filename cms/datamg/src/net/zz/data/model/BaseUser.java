package net.zz.data.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import net.zz.utils.StringUtils;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

/**
 * 用户数据
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
@Entity
@DynamicInsert(true)
@DynamicUpdate(true)
@Table(name="d_users")
@SuppressWarnings("serial")
public class BaseUser implements Serializable {
	/**用户ID*/
	private String id;
	/**用户名*/
	private String userName;
	/**性别*/
	private String sex;
	/**真实姓名*/
	private String realName;
	/**邮箱*/
	private String email;
	/**手机*/
	private String mobilePhone;
	/**用户类型*/
	private String userType;
	/**是否生成登录用户*/
	private Boolean isLogin = false;
	/**创建时间*/
	private Date createTime;
	/**描述*/
	private String description;
	/**用户机构*/
	private BaseUnit unit;
	
	@Id
	@Column(name="id",length=32,nullable=false,unique=true)
	public String getId() {
		if(StringUtils.isEmpty(this.id)){
			return StringUtils.getTimeString();
		}
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(name="userName",length=20,nullable=false,unique=true)
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Column(length=10)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	@Column(name="realName",length=20)
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	@Column(length=100)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(length=20)
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	@Column(length=32)
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	@Column
	public Boolean getIsLogin() {
		return isLogin;
	}
	public void setIsLogin(Boolean isLogin) {
		this.isLogin = isLogin;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column
	public Date getCreateTime() {
		if(null==this.createTime){
			return new Date(System.currentTimeMillis());
		}
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="unitId")
	public BaseUnit getUnit() {
		return unit;
	}
	public void setUnit(BaseUnit unit) {
		this.unit = unit;
	}
	@Column(length=200)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
