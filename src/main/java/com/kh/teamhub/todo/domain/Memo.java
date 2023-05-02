package com.kh.teamhub.todo.domain;

import java.sql.Date;

public class Memo {
	
	private int memoNo;
	private String userId;
	private String memoContent;
	private Date memoCreateDate;
	
	public int getMemoNo() {
		return memoNo;
	}
	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMemoContent() {
		return memoContent;
	}
	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}
	public Date getMemoCreateDate() {
		return memoCreateDate;
	}
	public void setMemoCreateDate(Date memoCreateDate) {
		this.memoCreateDate = memoCreateDate;
	}
	
	@Override
	public String toString() {
		return "Memo [memoNo=" + memoNo + ", userId=" + userId + ", memoContent=" + memoContent + ", memoCreateDate="
				+ memoCreateDate + "]";
	}
	

}
