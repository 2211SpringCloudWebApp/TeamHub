package com.kh.teamhub.board.domain;

import java.sql.Date;

public class Notice {
	private int noticeNo;	//게시글 번호
	private String boardCode; // 직급
	private String userId;	//아이디
	private String noticeTitle; //제목
	private String noticeContent; //내용
	private Date noticeWriteDate; //날짜
	private int noticeCount; //조회수
	private String noticeStatus;
	private String noticeFilename;  //첨부 파일

	
	
	public Notice() {
		super();
	}



	public Notice(int noticeNo, String boardCode, String userId, String noticeTitle, String noticeContent,
			Date noticeWriteDate, int noticeCount, String noticeStatus, String noticeFilename) {
		super();
		this.noticeNo = noticeNo;
		this.boardCode = boardCode;
		this.userId = userId;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriteDate = noticeWriteDate;
		this.noticeCount = noticeCount;
		this.noticeStatus = noticeStatus;
		this.noticeFilename = noticeFilename;
	}



	public int getNoticeNo() {
		return noticeNo;
	}



	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}



	public String getBoardCode() {
		return boardCode;
	}



	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getNoticeTitle() {
		return noticeTitle;
	}



	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}



	public String getNoticeContent() {
		return noticeContent;
	}



	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}



	public Date getNoticeWriteDate() {
		return noticeWriteDate;
	}



	public void setNoticeWriteDate(Date noticeWriteDate) {
		this.noticeWriteDate = noticeWriteDate;
	}



	public int getNoticeCount() {
		return noticeCount;
	}



	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}



	public String getNoticeStatus() {
		return noticeStatus;
	}



	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}



	public String getNoticeFilename() {
		return noticeFilename;
	}



	public void setNoticeFilename(String noticeFilename) {
		this.noticeFilename = noticeFilename;
	}



	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", boardCode=" + boardCode + ", userId=" + userId + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", noticeWriteDate=" + noticeWriteDate
				+ ", noticeCount=" + noticeCount + ", noticeStatus=" + noticeStatus + ", noticeFilename="
				+ noticeFilename + "]";
	}

	


	
}
