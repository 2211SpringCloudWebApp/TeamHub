package com.kh.teamhub.user.domain;

public class OrgUser {

	private int deptLevel;
	private String deptCode;
	private String deptName;
	private String deptUppercode;
	private String userName;
	private String userId;
	private String userState;
	private int positionLevel;
	private String positionName;
	
	public int getDeptLevel() {
		return deptLevel;
	}
	public void setDeptLevel(int deptLevel) {
		this.deptLevel = deptLevel;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptUppercode() {
		return deptUppercode;
	}
	public void setDeptUppercode(String deptUppercode) {
		this.deptUppercode = deptUppercode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserState() {
		return userState;
	}
	public void setUserState(String userState) {
		this.userState = userState;
	}
	public int getPositionLevel() {
		return positionLevel;
	}
	public void setPositionLevel(int positionLevel) {
		this.positionLevel = positionLevel;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	
	@Override
	public String toString() {
		return "OrgUser [deptLevel=" + deptLevel + ", deptCode=" + deptCode + ", deptName=" + deptName
				+ ", deptUppercode=" + deptUppercode + ", userName=" + userName + ", userId=" + userId
				+ ", userState=" + userState + ", positionLevel=" + positionLevel + ", positionName=" + positionName + "]";
	}
	
}
