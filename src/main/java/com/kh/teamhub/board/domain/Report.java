package com.kh.teamhub.board.domain;

import java.sql.Date;

public class Report {
	private int reportNo;
	private String boardCode;
	private int boardNo;
	private String reportTitle;
	private String reportContent;
	private String reportId;
	private Date reportCreateDate;
	private String reportStatus;
	private int freeNo;
	
	public Report() {
		super();
	}

	
	



	

	public Report(int reportNo, String boardCode, int boardNo, String reportTitle, String reportContent,
			String reportId, Date reportCreateDate, String reportStatus, int freeNo) {
		super();
		this.reportNo = reportNo;
		this.boardCode = boardCode;
		this.boardNo = boardNo;
		this.reportTitle = reportTitle;
		this.reportContent = reportContent;
		this.reportId = reportId;
		this.reportCreateDate = reportCreateDate;
		this.reportStatus = reportStatus;
		this.freeNo = freeNo;
	}








	public int getFreeNo() {
		return freeNo;
	}
	
	
	
	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}


	public int getReportNo() {
		return reportNo;
	}



	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}



	public String getBoardCode() {
		return boardCode;
	}



	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public String getReportTitle() {
		return reportTitle;
	}



	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}



	public String getReportContent() {
		return reportContent;
	}



	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}



	public String getReportId() {
		return reportId;
	}



	public void setReportId(String reportId) {
		this.reportId = reportId;
	}



	public Date getReportCreateDate() {
		return reportCreateDate;
	}



	public void setReportCreateDate(Date reportCreateDate) {
		this.reportCreateDate = reportCreateDate;
	}



	public String getReportStatus() {
		return reportStatus;
	}



	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}








	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", boardCode=" + boardCode + ", boardNo=" + boardNo + ", reportTitle="
				+ reportTitle + ", reportContent=" + reportContent + ", reportId=" + reportId + ", reportCreateDate="
				+ reportCreateDate + ", reportStatus=" + reportStatus + ", freeNo=" + freeNo + "]";
	}



	
	
	
	
}
