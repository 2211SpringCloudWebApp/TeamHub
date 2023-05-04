package com.kh.teamhub.user.store;

import java.util.List;

import com.kh.teamhub.common.PageInfo;
import com.kh.teamhub.user.domain.OrgUser;
import com.kh.teamhub.user.domain.Search;
import com.kh.teamhub.user.domain.User;

public interface UserStore {

	/**
	 * 사원 등록 Store
	 * @param user
	 * @return int
	 */
	int registerUser(User user);

	/**
	 * 아이디 중복 체크 Store
	 * @param userId
	 * @return int
	 */
	int checkId(String userId);

	/**
	 * 마이페이지 수정 Store
	 * @param user
	 * @return int
	 */
	int updateUserInfo(User user);

	/**
	 * 사원 정보 수정 Store
	 * @param user
	 * @return int
	 */
	int updateUser(User user);

	/**
	 * 사원 정보 수정 Store
	 * @param user
	 * @return int
	 */
	int updateUserState(User user);

	/**
	 * 사원 삭제 Store
	 * @param userId
	 * @return int
	 */
	int deleteUser(String userId);

	/**
	 * 로그인 Store
	 * @param user
	 * @return User
	 */
	User login(User user);

	/**
	 * 사원 목록 조회 Store
	 * @return List<User>
	 */
	List<User> selectAllUser(PageInfo pi);

	/**
	 * 사원 아이디로 조회 Store
	 * @param userId
	 * @return User
	 */
	User selectOneById(String userId);

	/**
	 * 사원 재직상태로 조회 Store
	 * @param pi
	 * @return List<User>
	 */
	List<User> selectUserState();

	/**
	 * 조직도 조회 Store
	 * @return List<OrgUser>
	 */
	List<OrgUser> selectOrganization();

	/**
	 * 사원 검색 Store
	 * @param search
	 * @return List<User>
	 */
	List<User> selectListByKeyword(Search search);

	/**
	 * 사원 검색 Store
	 * @param pi
	 * @param search
	 * @return List<User>
	 */
	List<User> selectListByKeyword(PageInfo pi, Search search);

	/**
	 * 사원 목록 전체 개수 Store
	 * @return int
	 */
	int getListCount();

	/**
	 * 사원 재직상태 목록 전체 개수 Store
	 * @return int
	 */
	int getStateListCount();

	/**
	 * 사원 검색 게시글 전체 개수 Store
	 * @param search
	 * @return int
	 */
	int getListCount(Search search);

	/**
	 * 사원 재직상태 검색 게시글 전체 개수 Store
	 * @param search
	 * @return int
	 */
	int getStateListCount(Search search);

}
