package com.kh.teamhub.board.domain;

import java.sql.Date;

public class FreePlus {
	private int freeNo; //게시글 번호
	private String userId; //유저 아이디
	private String boardCode; //직급
	private String freeTitle; //게시글 제목
	private String freeContent; // 게시글 내용
	private Date freeWriteDate; //날짜
	private int freeCount; //조회수
	private String freeStatus;
	private String freeFilename;  //첨부 파일
	private int fileNo;
	private int noticeNo;
	private String fileName;
	private String fileReName;
	private String filePath;
			
			public FreePlus() {
				super();
			}

			public FreePlus(int freeNo, String userId, String boardCode, String freeTitle, String freeContent,
					Date freeWriteDate, int freeCount, String freeStatus, String freeFilename, int fileNo, int noticeNo,
					String fileName, String fileReName, String filePath) {
				super();
				this.freeNo = freeNo;
				this.userId = userId;
				this.boardCode = boardCode;
				this.freeTitle = freeTitle;
				this.freeContent = freeContent;
				this.freeWriteDate = freeWriteDate;
				this.freeCount = freeCount;
				this.freeStatus = freeStatus;
				this.freeFilename = freeFilename;
				this.fileNo = fileNo;
				this.noticeNo = noticeNo;
				this.fileName = fileName;
				this.fileReName = fileReName;
				this.filePath = filePath;
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

			public String getFreeFilename() {
				return freeFilename;
			}

			public void setFreeFilename(String freeFilename) {
				this.freeFilename = freeFilename;
			}

			public int getFileNo() {
				return fileNo;
			}

			public void setFileNo(int fileNo) {
				this.fileNo = fileNo;
			}

			public int getNoticeNo() {
				return noticeNo;
			}

			public void setNoticeNo(int noticeNo) {
				this.noticeNo = noticeNo;
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

			@Override
			public String toString() {
				return "FreePlus [freeNo=" + freeNo + ", userId=" + userId + ", boardCode=" + boardCode + ", freeTitle="
						+ freeTitle + ", freeContent=" + freeContent + ", freeWriteDate=" + freeWriteDate
						+ ", freeCount=" + freeCount + ", freeStatus=" + freeStatus + ", freeFilename=" + freeFilename
						+ ", fileNo=" + fileNo + ", noticeNo=" + noticeNo + ", fileName=" + fileName + ", fileReName="
						+ fileReName + ", filePath=" + filePath + "]";
			}
			
			
			
}
