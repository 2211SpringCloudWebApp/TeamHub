package com.kh.teamhub.common;

public class PageInfo {

	private int currentPage;
	private int boardLimit;
	private int tatalCount;
	private int navLimit;
	private int startNav;
	private int endNav;
	private int maxPage;
	
	public PageInfo() {}
	
	

	public PageInfo(int currentPage, int boardLimit, int tatalCount, int navLimit, int startNav, int endNav,
			int maxPage) {
		super();
		this.currentPage = currentPage;
		this.boardLimit = boardLimit;
		this.tatalCount = tatalCount;
		this.navLimit = navLimit;
		this.startNav = startNav;
		this.endNav = endNav;
		this.maxPage = maxPage;
	}



	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	public int getTatalCount() {
		return tatalCount;
	}

	public void setTatalCount(int tatalCount) {
		this.tatalCount = tatalCount;
	}

	public int getNavLimit() {
		return navLimit;
	}

	public void setNavLimit(int navLimit) {
		this.navLimit = navLimit;
	}

	public int getStartNav() {
		return startNav;
	}

	public void setStartNav(int startNav) {
		this.startNav = startNav;
	}

	public int getEndNav() {
		return endNav;
	}

	public void setEndNav(int endNav) {
		this.endNav = endNav;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", boardLimit=" + boardLimit + ", tatalCount=" + tatalCount
				+ ", navLimit=" + navLimit + ", startNav=" + startNav + ", endNav=" + endNav + ", maxPage=" + maxPage
				+ "]";
	}
	
	
}
