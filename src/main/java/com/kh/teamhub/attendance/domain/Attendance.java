package com.kh.teamhub.attendance.domain;

import java.sql.Date;

public class Attendance {
	
	private int atteNo;
	private String userId;
	private Date atteDate;
	private String startTime;
	private String finishTime;
	private String totalWorkHour;
	private String atteStatus;
	
	public Attendance() {}

	public int getAtteNo() {
		return atteNo;
	}

	public void setAtteNo(int atteNo) {
		this.atteNo = atteNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getAtteDate() {
		return atteDate;
	}

	public void setAtteDate(Date atteDate) {
		this.atteDate = atteDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	public String getTotalWorkHour() {
		return totalWorkHour;
	}

	public void setTotalWorkHour(String totalWorkHour) {
		this.totalWorkHour = totalWorkHour;
	}

	public String getAtteStatus() {
		return atteStatus;
	}

	public void setAtteStatus(String atteStatus) {
		this.atteStatus = atteStatus;
	}

	@Override
	public String toString() {
		return "Attendance [atteNo=" + atteNo + ", userId=" + userId + ", atteDate=" + atteDate + ", startTime="
				+ startTime + ", finishTime=" + finishTime + ", totalWorkHour=" + totalWorkHour + ", atteStatus="
				+ atteStatus + "]";
	}
	

}