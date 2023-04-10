package com.kh.teamhub.user.domain;

public class User {
// 아이디, 비밀번호, 이름, 부서, 직급, 이메일, 전화번호, 생년월일, 재직상태, 파일이름, 파일경로, 게시판작성권한, 관리자여부
	private String userId;
	private String userPw;
	private String userName;
	private String deptName;
	private String positionName;
	private String userEmail;
	private String userPhone;
	private String userBirth;
	private String userState;
	private String userFileName;
	private String userfilePath;
	private String userBoardGrant;
	private int userType;
	
	public User() {}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

	public String getUserFileName() {
		return userFileName;
	}

	public void setUserFileName(String userFileName) {
		this.userFileName = userFileName;
	}

	public String getUserfilePath() {
		return userfilePath;
	}

	public void setUserfilePath(String userfilePath) {
		this.userfilePath = userfilePath;
	}

	public String getUserBoardGrant() {
		return userBoardGrant;
	}

	public void setUserBoardGrant(String userBoardGrant) {
		this.userBoardGrant = userBoardGrant;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", deptName=" + deptName
				+ ", positionName=" + positionName + ", userEmail=" + userEmail + ", userPhone=" + userPhone
				+ ", userBirth=" + userBirth + ", userState=" + userState + ", userFileName=" + userFileName
				+ ", userfilePath=" + userfilePath + ", userBoardGrant=" + userBoardGrant + ", userType=" + userType
				+ "]";
	}
	
}
