package com.kh.teamhub.attendance.domain;

import java.sql.Date;

public class VacationUser {
	
	private int vacationNo;
	private String userId;
	private String vacationName;
	private String vacationDept;
	private String vacationDivision;
	private int vacationCount;
	private Date vacationCreateDate;
	private int vacationUsed;
	private Date vacationStart;
	private Date vacationEnd;
	private String vacationContent;
	private String vacationState;
	private String userName;
	
	public VacationUser() {}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getVacationNo() {
		return vacationNo;
	}
	public void setVacationNo(int vacationNo) {
		this.vacationNo = vacationNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getVacationName() {
		return vacationName;
	}
	public void setVacationName(String vacationName) {
		this.vacationName = vacationName;
	}
	public String getVacationDept() {
		return vacationDept;
	}
	public void setVacationDept(String vacationDept) {
		this.vacationDept = vacationDept;
	}
	public String getVacationDivision() {
		return vacationDivision;
	}
	public void setVacationDivision(String vacationDivision) {
		this.vacationDivision = vacationDivision;
	}
	public int getVacationCount() {
		return vacationCount;
	}
	public void setVacationCount(int vacationCount) {
		this.vacationCount = vacationCount;
	}
	public Date getVacationCreateDate() {
		return vacationCreateDate;
	}
	public void setVacationCreateDate(Date vacationCreateDate) {
		this.vacationCreateDate = vacationCreateDate;
	}
	public int getVacationUsed() {
		return vacationUsed;
	}
	public void setVacationUsed(int vacationUsed) {
		this.vacationUsed = vacationUsed;
	}
	public Date getVacationStart() {
		return vacationStart;
	}
	public void setVacationStart(Date vacationStart) {
		this.vacationStart = vacationStart;
	}
	public Date getVacationEnd() {
		return vacationEnd;
	}
	public void setVacationEnd(Date vacationEnd) {
		this.vacationEnd = vacationEnd;
	}
	public String getVacationContent() {
		return vacationContent;
	}
	public void setVacationContent(String vacationContent) {
		this.vacationContent = vacationContent;
	}
	public String getVacationState() {
		return vacationState;
	}
	public void setVacationState(String vacationState) {
		this.vacationState = vacationState;
	}

	@Override
	public String toString() {
		return "VacationUser [vacationNo=" + vacationNo + ", userId=" + userId + ", vacationName=" + vacationName
				+ ", vacationDept=" + vacationDept + ", vacationDivision=" + vacationDivision + ", vacationCount="
				+ vacationCount + ", vacationCreateDate=" + vacationCreateDate + ", vacationUsed=" + vacationUsed
				+ ", vacationStart=" + vacationStart + ", vacationEnd=" + vacationEnd + ", vacationContent="
				+ vacationContent + ", vacationState=" + vacationState + ", userName=" + userName + "]";
	}

}
