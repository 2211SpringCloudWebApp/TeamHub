package com.kh.teamhub.board.domain;

public class FreeFile {
	private int fileNo;
	private int freeNo;
	private int noticeNo;
	private String fileName;
	private String fileReName;
	private String filePath;
	
	public FreeFile() {
		super();
	}

	public FreeFile(int fileNo, int freeNo, int noticeNo, String fileName, String fileReName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.freeNo = freeNo;
		this.noticeNo = noticeNo;
		this.fileName = fileName;
		this.fileReName = fileReName;
		this.filePath = filePath;
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
		return "FreeFile [fileNo=" + fileNo + ", freeNo=" + freeNo + ", noticeNo=" + noticeNo + ", fileName=" + fileName
				+ ", fileReName=" + fileReName + ", filePath=" + filePath + "]";
	}

	

	
}
