package com.kh.teamhub.user.service;

import java.util.List;

import com.kh.teamhub.common.PageInfo;
import com.kh.teamhub.user.domain.Search;
import com.kh.teamhub.user.domain.User;

public interface UserService {

	/**
	 * 사원 등록 Service
	 * @param user
	 * @return int
	 */
	int registerUser(User user);

	/**
	 * 아이디 중복 체크 Service
	 * @param userId
	 * @return int
	 */
	int checkId(String userId);

	/**
	 * 마이페이지 수정 Service
	 * @param user
	 * @return int
	 */
	int updateUserInfo(User user);

	/**
	 * 사원 정보 수정 Service
	 * @param user
	 * @return int
	 */
	int updateUser(User user);

	/**
	 * 사원 삭제 Service
	 * @param userId
	 * @return int
	 */
	int deleteUser(String userId);

	/**
	 * 로그인 Service
	 * @param user
	 * @return User
	 */
	User login(User user);

	/**
	 * 사원 목록 조회 Service
	 * @return List<User>
	 */
	List<User> selectAllUser(PageInfo pi);

	/**
	 * 사원 목록 재직 상태로 조회 Service
	 * @param pi
	 * @return List<User>
	 */
	List<User> selectUserState(PageInfo pi);

	/**
	 * 사원 아이디로 조회 Service
	 * @param userId
	 * @return User
	 */
	User selectOneById(String userId);

	/**
	 * 사원 검색 Service
	 * @param pi
	 * @param search
	 * @return List<User>
	 */
	List<User> selectListByKeyword(PageInfo pi, Search search);

	/**
	 * 사원 목록 전체 개수 Service
	 * @return int
	 */
	int getListCount();

	/**
	 * 사원 검색 게시글 전체 개수 Service
	 * @param search
	 * @return int
	 */
	int getListCount(Search search);

}
