package com.kh.teamhub.approval.domain;

public class Search {
	private String searchKeyword;
	private String searchCondition;
	private String userId;
	
	public Search() {}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Search [searchKeyword=" + searchKeyword + ", searchCondition=" + searchCondition + ", userId=" + userId
				+ "]";
	}

	
}
