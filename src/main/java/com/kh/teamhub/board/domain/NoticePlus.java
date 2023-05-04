package com.kh.teamhub.board.domain;

import java.sql.Date;

public class NoticePlus {
	private int noticeNo;	//게시글 번호
	private String boardCode; // 직급
	private String userId;	//아이디
	private String noticeTitle; //제목
	private String noticeContent; //내용
	private Date noticeWriteDate; //날짜
	private int noticeCount; //조회수
	private String noticeStatus;
	private int fileNo;
	private int freeNo;
	private String fileName;
	private String fileReName;
	private String filePath;
	private String noticeFilename;  //첨부 파일
	
	public NoticePlus() {
		super();
	}

	public NoticePlus(int noticeNo, String boardCode, String userId, String noticeTitle, String noticeContent,
			Date noticeWriteDate, int noticeCount, String noticeStatus, int fileNo, int freeNo, String fileName,
			String fileReName, String filePath, String noticeFilename) {
		super();
		this.noticeNo = noticeNo;
		this.boardCode = boardCode;
		this.userId = userId;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriteDate = noticeWriteDate;
		this.noticeCount = noticeCount;
		this.noticeStatus = noticeStatus;
		this.fileNo = fileNo;
		this.freeNo = freeNo;
		this.fileName = fileName;
		this.fileReName = fileReName;
		this.filePath = filePath;
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

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileReName() {
		return fileReName;
	}

	public void setFileReName(String fileReName) {
		this.fileReName = fileReName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getNoticeFilename() {
		return noticeFilename;
	}

	public void setNoticeFilename(String noticeFilename) {
		this.noticeFilename = noticeFilename;
	}

	@Override
	public String toString() {
		return "NoticePlus [noticeNo=" + noticeNo + ", boardCode=" + boardCode + ", userId=" + userId + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", noticeWriteDate=" + noticeWriteDate
				+ ", noticeCount=" + noticeCount + ", noticeStatus=" + noticeStatus + ", fileNo=" + fileNo + ", freeNo="
				+ freeNo + ", fileName=" + fileName + ", fileReName=" + fileReName + ", filePath=" + filePath
				+ ", noticeFilename=" + noticeFilename + "]";
	}

	
	
}
