package com.kh.teamhub.alram.domain;

import java.util.Date;

public class Alram {

	private int alramNo;
	private String userId;
	private String alramKind;
	private String alramContent;
	private Date alramDate;
	private String alramStatus;
	private String alramUrl;
	
	public Alram() {}
	
	
	public Alram(String userId, String alramKind, String alramContent, String alramUrl) {
		super();
		this.userId = userId;
		this.alramKind = alramKind;
		this.alramContent = alramContent;
		this.alramUrl = alramUrl;
	}


	public int getAlramNo() {
		return alramNo;
	}

	public void setAlramNo(int alramNo) {
		this.alramNo = alramNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAlramKind() {
		return alramKind;
	}

	public void setAlramKind(String alramKind) {
		this.alramKind = alramKind;
	}

	public String getAlramContent() {
		return alramContent;
	}

	public void setAlramContent(String alramContent) {
		this.alramContent = alramContent;
	}

	public Date getAlramDate() {
		return alramDate;
	}

	public void setAlramDate(Date alramDate) {
		this.alramDate = alramDate;
	}

	public String getAlramStatus() {
		return alramStatus;
	}

	public void setAlramStatus(String alramStatus) {
		this.alramStatus = alramStatus;
	}

	public String getAlramUrl() {
		return alramUrl;
	}

	public void setAlramUrl(String alramUrl) {
		this.alramUrl = alramUrl;
	}

	@Override
	public String toString() {
		return "Alram [alramNo=" + alramNo + ", userId=" + userId + ", alramKind=" + alramKind + ", alramContent="
				+ alramContent + ", alramDate=" + alramDate + ", alramStatus=" + alramStatus + ", alramUrl=" + alramUrl
				+ "]";
	}
	
}
