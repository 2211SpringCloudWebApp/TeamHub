package com.kh.teamhub.schedule.domain;

import java.util.Date;

public class Schedule {

	private int scheduleNo;
	private String userId;
	private String scheduleKind;
	private String deptCode;
	private String scheduleName;
	private String scheduleColor;
	private String scheduleContent;
	private Date scheduleStart;
	private Date scheduleEnd;
	private String scheduleAlram;
	
	public Schedule () {}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getScheduleKind() {
		return scheduleKind;
	}

	public void setScheduleKind(String scheduleKind) {
		this.scheduleKind = scheduleKind;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getScheduleName() {
		return scheduleName;
	}

	public void setScheduleName(String scheduleName) {
		this.scheduleName = scheduleName;
	}

	public String getScheduleColor() {
		return scheduleColor;
	}

	public void setScheduleColor(String scheduleColor) {
		this.scheduleColor = scheduleColor;
	}

	public String getScheduleContent() {
		return scheduleContent;
	}

	public void setScheduleContent(String scheduleContent) {
		this.scheduleContent = scheduleContent;
	}

	public Date getScheduleStart() {
		return scheduleStart;
	}

	public void setScheduleStart(Date scheduleStart) {
		this.scheduleStart = scheduleStart;
	}

	public Date getScheduleEnd() {
		return scheduleEnd;
	}

	public void setScheduleEnd(Date scheduleEnd) {
		this.scheduleEnd = scheduleEnd;
	}

	public String getScheduleAlram() {
		return scheduleAlram;
	}

	public void setScheduleAlram(String scheduleAlram) {
		this.scheduleAlram = scheduleAlram;
	}

	@Override
	public String toString() {
		return "Schedule [scheduleNo=" + scheduleNo + ", userId=" + userId + ", scheduleKind=" + scheduleKind
				+ ", deptCode=" + deptCode + ", scheduleName=" + scheduleName + ", scheduleColor=" + scheduleColor
				+ ", scheduleContent=" + scheduleContent + ", scheduleStart=" + scheduleStart + ", scheduleEnd="
				+ scheduleEnd + ", scheduleAlram=" + scheduleAlram + "]";
	}
	
	
}
