package com.kh.teamhub.approval.domain;

public class ApprReference {

	private int refNo;
	private int apprNo;
	private String userId;
	
	public ApprReference() {
		
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
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

	@Override
	public String toString() {
		return "ApprReference [refNo=" + refNo + ", apprNo=" + apprNo + ", userId=" + userId + "]";
	}
	
	
}
