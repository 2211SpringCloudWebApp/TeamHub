package com.kh.teamhub.project.domain;

public class Kanban {
	private int kanbanNo;
	private int projectNo;
	private String userName;
	private String kanbanContent;
	private String kanbanStatus;
	
	
	public Kanban() {
		super();
	}


	public int getKanbanNo() {
		return kanbanNo;
	}
	public void setKanbanNo(int kanbanNo) {
		this.kanbanNo = kanbanNo;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getKanbanContent() {
		return kanbanContent;
	}
	public void setKanbanContent(String kanbanContent) {
		this.kanbanContent = kanbanContent;
	}
	public String getKanbanStatus() {
		return kanbanStatus;
	}
	public void setKanbanStatus(String kanbanStatus) {
		this.kanbanStatus = kanbanStatus;
	}


	@Override
	public String toString() {
		return "Kanban [kanbanNo=" + kanbanNo + ", projectNo=" + projectNo + ", userName=" + userName
				+ ", kanbanContent=" + kanbanContent + ", kanbanStatus=" + kanbanStatus + "]";
	}
	
}
