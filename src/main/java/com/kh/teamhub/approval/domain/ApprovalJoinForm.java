package com.kh.teamhub.approval.domain;

import java.sql.Date;

public class ApprovalJoinForm {
	
	private int apprNo;
	private int formNo;
	private String userId;
	private String apprTitle;
	private String apprContent;
	private String apprStatus;
	private String apprStorage;
	private Date apprCreateDate;
	private String formTitle;
	private String formContent;
	
	public ApprovalJoinForm() {}

	public int getApprNo() {
		return apprNo;
	}

	public void setApprNo(int apprNo) {
		this.apprNo = apprNo;
	}

	public int getFormNo() {
		return formNo;
	}

	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getApprTitle() {
		return apprTitle;
	}

	public void setApprTitle(String apprTitle) {
		this.apprTitle = apprTitle;
	}

	public String getApprContent() {
		return apprContent;
	}

	public void setApprContent(String apprContent) {
		this.apprContent = apprContent;
	}

	public String getApprStatus() {
		return apprStatus;
	}

	public void setApprStatus(String apprStatus) {
		this.apprStatus = apprStatus;
	}

	public String getApprStorage() {
		return apprStorage;
	}

	public void setApprStorage(String apprStorage) {
		this.apprStorage = apprStorage;
	}

	public Date getApprCreateDate() {
		return apprCreateDate;
	}

	public void setApprCreateDate(Date apprCreateDate) {
		this.apprCreateDate = apprCreateDate;
	}

	public String getFormTitle() {
		return formTitle;
	}

	public void setFormTitle(String formTitle) {
		this.formTitle = formTitle;
	}

	public String getFormContent() {
		return formContent;
	}

	public void setFormContent(String formContent) {
		this.formContent = formContent;
	}

	@Override
	public String toString() {
		return "ApprovalJoinForm [apprNo=" + apprNo + ", formNo=" + formNo + ", userId=" + userId + ", apprTitle="
				+ apprTitle + ", apprContent=" + apprContent + ", apprStatus=" + apprStatus + ", apprStorage="
				+ apprStorage + ", apprCreateDate=" + apprCreateDate + ", formTitle=" + formTitle + ", formContent="
				+ formContent + "]";
	}
	
	
	
}
