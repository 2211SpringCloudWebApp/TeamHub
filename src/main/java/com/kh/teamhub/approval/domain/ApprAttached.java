package com.kh.teamhub.approval.domain;

public class ApprAttached {

	private int fileNo;
	private int apprNo;
	private String fileName;
	private String fileRename;
	private String filePath;
	
	public ApprAttached() {}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getApprNo() {
		return apprNo;
	}

	public void setApprNo(int apprNo) {
		this.apprNo = apprNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRename() {
		return fileRename;
	}

	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "ApprAttached [fileNo=" + fileNo + ", apprNo=" + apprNo + ", fileName=" + fileName + ", fileRename="
				+ fileRename + ", filePath=" + filePath + "]";
	}
	
	
}
