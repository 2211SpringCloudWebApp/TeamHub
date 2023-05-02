package com.kh.teamhub.project.domain;

public class Search {
	private String keyword;
	private String condition;
	

	public Search() {
	}
	public Search(String keyword, String condition) {
		super();
		this.keyword = keyword;
		this.condition = condition;
	}

	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}

	
	@Override
	public String toString() {
		return "Search [keyword=" + keyword + ", condition=" + condition + "]";
	}

}
