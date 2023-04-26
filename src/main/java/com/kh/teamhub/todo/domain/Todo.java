package com.kh.teamhub.todo.domain;

import java.sql.Date;

public class Todo {
	
	private int todoNo;
	private String userId;
	private String todoContent;
	private Date todoCreateDate;
	private String isFinished;
	private String date; // 달력에서 내가 선택한 날짜
	
	
	
	public int getTodoNo() {
		return todoNo;
	}
	
	public void setTodoNo(int todoNo) {
		this.todoNo = todoNo;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getTodoContent() {
		return todoContent;
	}
	
	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}
	
	public Date getTodoCreateDate() {
		return todoCreateDate;
	}
	
	public void setTodoCreateDate(Date todoCreateDate) {
		this.todoCreateDate = todoCreateDate;
	}
	
	public String getIsFinished() {
		return isFinished;
	}
	
	public void setIsFinished(String isFinished) {
		this.isFinished = isFinished;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	@Override
	public String toString() {
		return "Todo [todoNo=" + todoNo + ", userId=" + userId + ", todoContent=" + todoContent + ", todoCreateDate="
				+ todoCreateDate + ", isFinished=" + isFinished + "]";
	}

}
