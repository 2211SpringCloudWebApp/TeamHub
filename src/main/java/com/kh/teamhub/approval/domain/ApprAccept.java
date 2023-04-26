package com.kh.teamhub.approval.domain;

import java.sql.Date;

public class ApprAccept {

	private int acceptNo;
	private int apprNo;
	private String userId;
	private int apprLevel;
	private String apprStatus;
	private String apprRejectComment;
	private Date acceptDate;
	
	public ApprAccept() { }

	public int getAcceptNo() {
		return acceptNo;
	}

	public void setAcceptNo(int acceptNo) {
		this.acceptNo = acceptNo;
	}

	public int getApprNo() {
		return apprNo;
	}

	public void setApprNo(int apprNo) {
		this.apprNo = apprNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getApprLevel() {
		return apprLevel;
	}

	public void setApprLevel(int apprLevel) {
		this.apprLevel = apprLevel;
	}

	public String getApprStatus() {
		return apprStatus;
	}

	public void setApprStatus(String apprStatus) {
		this.apprStatus = apprStatus;
	}

	public String getApprRejectComment() {
		return apprRejectComment;
	}

	public void setApprRejectComment(String apprRejectComment) {
		this.apprRejectComment = apprRejectComment;
	}

	public Date getAcceptDate() {
		return acceptDate;
	}

	public void setAcceptDate(Date acceptDate) {
		this.acceptDate = acceptDate;
	}

	@Override
	public String toString() {
		return "ApprAccept [acceptNo=" + acceptNo + ", apprNo=" + apprNo + ", userId=" + userId + ", apprLevel="
				+ apprLevel + ", apprStatus=" + apprStatus + ", apprRejectComment=" + apprRejectComment
				+ ", acceptDate=" + acceptDate + "]";
	}
	
}
