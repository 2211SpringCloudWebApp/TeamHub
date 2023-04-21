package com.kh.teamhub.board.domain;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private int freeNo;
	private String userId;
	private String replyContent;
	private Date replyCreateDate;
	private int replyDepth;
	private int replyParentNo;
	
	public Reply() {
		super();
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", freeNo=" + freeNo + ", userId=" + userId + ", replyContent="
				+ replyContent + ", replyCreateDate=" + replyCreateDate + ", replyDepth=" + replyDepth
				+ ", replyParentNo=" + replyParentNo + "]";
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public int getReplyDepth() {
		return replyDepth;
	}

	public void setReplyDepth(int replyDepth) {
		this.replyDepth = replyDepth;
	}

	public int getReplyParentNo() {
		return replyParentNo;
	}

	public void setReplyParentNo(int replyParentNo) {
		this.replyParentNo = replyParentNo;
	}

	public Reply(int replyNo, int freeNo, String userId, String replyContent, Date replyCreateDate, int replyDepth,
			int replyParentNo) {
		super();
		this.replyNo = replyNo;
		this.freeNo = freeNo;
		this.userId = userId;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
		this.replyDepth = replyDepth;
		this.replyParentNo = replyParentNo;
	}
	
	
}
