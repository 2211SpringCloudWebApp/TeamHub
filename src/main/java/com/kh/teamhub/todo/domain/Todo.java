package com.kh.teamhub.todo.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Todo {
	
	private int todoNo;
	private String userId;
	private String todoContent;
	private Date todoCreateDate;
	private String isFinished;
	private String date; // 달력에서 내가 선택한 날짜
	
	public Todo() {}
	// tdCreateDate 이게 스트링으로 오는데 Date로 변환시켜줘야해서 변환시켜주는거
	// userId, todoContent는 jsp에서 받아온거 그대로 사용할 수 있게 해주는거
	public Todo(String tdCreateDate, String userId, String todoContent) {
	    try {
	      SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
	      Date utilDate = dateFormat.parse(tdCreateDate);
	      this.todoCreateDate = new java.sql.Date(utilDate.getTime());
	      this.userId = userId;
	      this.todoContent = todoContent;
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }
	
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
