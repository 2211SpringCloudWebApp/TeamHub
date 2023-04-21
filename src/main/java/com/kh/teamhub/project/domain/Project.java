package com.kh.teamhub.project.domain;

import java.sql.Date;

public class Project {

	private int projectNo;
	private String userId;
	private String projectName;
	private Date projectStart;
	private Date projectEnd;
	private String projectInsertRequest;
	private String projectStatus;
	private String userName; // USER_TBL에서 가져오기
	
	
	public Project() {
		super();
	}


	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public Date getProjectStart() {
		return projectStart;
	}
	public void setProjectStart(Date projectStart) {
		this.projectStart = projectStart;
	}
	public Date getProjectEnd() {
		return projectEnd;
	}
	public void setProjectEnd(Date projectEnd) {
		this.projectEnd = projectEnd;
	}
	public String getProjectInsertRequest() {
		return projectInsertRequest;
	}
	public void setProjectInsertRequest(String projectInsertRequest) {
		this.projectInsertRequest = projectInsertRequest;
	}
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}


	@Override
	public String toString() {
		return "Project [projectNo=" + projectNo + ", userId=" + userId + ", projectName=" + projectName
				+ ", projectStart=" + projectStart + ", projectEnd=" + projectEnd + ", projectInsertRequest="
				+ projectInsertRequest + ", projectStatus=" + projectStatus + ", userName=" + userName + "]";
	}

	
}
