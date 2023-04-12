package com.kh.teamhub.board.domain;

import java.sql.Date;

public class Free {
	private int freeNo;
	private String userId;
	private String boardCode;
	private String freeTitle;
	private String freeContent;
	private Date freeWriteDate;
	private int freeCount;
	private String freeStatus;
	
	public Free() {
		super();
	}

	public Free(int freeNo, String userId, String boardCode, String freeTitle, String freeContent, Date freeWriteDate,
			int freeCount, String freeStatus) {
		super();
		this.freeNo = freeNo;
		this.userId = userId;
		this.boardCode = boardCode;
		this.freeTitle = freeTitle;
		this.freeContent = freeContent;
		this.freeWriteDate = freeWriteDate;
		this.freeCount = freeCount;
		this.freeStatus = freeStatus;
	}


	public int getFreeNo() {
		return freeNo;
	}


	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getBoardCode() {
		return boardCode;
	}


	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}


	public String getFreeTitle() {
		return freeTitle;
	}


	public void setFreeTitle(String freeTitle) {
		this.freeTitle = freeTitle;
	}


	public String getFreeContent() {
		return freeContent;
	}


	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}


	public Date getFreeWriteDate() {
		return freeWriteDate;
	}


	public void setFreeWriteDate(Date freeWriteDate) {
		this.freeWriteDate = freeWriteDate;
	}


	public int getFreeCount() {
		return freeCount;
	}


	public void setFreeCount(int freeCount) {
		this.freeCount = freeCount;
	}


	public String getFreeStatus() {
		return freeStatus;
	}


	public void setFreeStatus(String freeStatus) {
		this.freeStatus = freeStatus;
	}


	@Override
	public String toString() {
		return "Free [freeNo=" + freeNo + ", userId=" + userId + ", boardCode=" + boardCode + ", freeTitle=" + freeTitle
				+ ", freeContent=" + freeContent + ", freeWriteDate=" + freeWriteDate + ", freeCount=" + freeCount
				+ ", freeStatus=" + freeStatus + "]";
	}
	
	
}
