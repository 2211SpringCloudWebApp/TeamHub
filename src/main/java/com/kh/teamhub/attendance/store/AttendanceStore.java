package com.kh.teamhub.attendance.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.teamhub.attendance.domain.AttenCount;
import com.kh.teamhub.attendance.domain.Attendance;
import com.kh.teamhub.attendance.domain.AttendanceUser;
import com.kh.teamhub.attendance.domain.VacationUser;
import com.kh.teamhub.common.PageInfo;

public interface AttendanceStore {

	/**
	 * 출근시간 입력 Store
	 * @param attendance
	 * @return int
	 */
	int insertGoToWork(SqlSession session, Attendance attendance);

	/**
	 * 출근 중복체크 Store
	 * @param userId
	 * @return Attendance
	 */
	Attendance selectOne(SqlSession session, String userId);

	/**
	 * 퇴근시간 입력 Store
	 * @param session
	 * @param attendance
	 * @return int
	 */
	int updateGoToHome(SqlSession session, Attendance attendance);

	/**
	 * 출퇴근 리스트 가져오는 Store
	 * @param session
	 * @param userId
	 * @return List<Attendance>
	 */
	List<Attendance> selectAtten(SqlSession session, String userId);

	/**
	 * 지각 통계 Store
	 * @param session
	 * @param userId
	 * @return int
	 */
	int selectStatus(SqlSession session, Attendance userId);

	/**
	 * 조퇴 통계 Store
	 * @param session
	 * @param userId
	 * @return int
	 */
	int selectStatus2(SqlSession session, Attendance userId);

	/**
	 * 조퇴 통계 Store
	 * @param session
	 * @param userId
	 * @return int
	 */
	int selectStatus3(SqlSession session, Attendance userId);

	/**
	 * 년,월 리스트
	 * @param session
	 * @param atten
	 * @return List<Attendance>
	 */
	List<Attendance> selectMonthByAtten(SqlSession session, Attendance atten);

	/**
	 * 지각.조퇴.출근 통계
	 * @param atten
	 * @return AttenCount
	 */
	AttenCount selectListByAtten(SqlSession session, Attendance atten);

	/**
	 * 관리자 근태관리- 유저 리스트 개수
	 * @return int
	 */
	int getUserListCount(SqlSession session);

	/**
	 * 관리자 근태관리- 유저 리스트
	 * @param pi
	 * @return List<AttendanceUser>
	 */
	List<AttendanceUser> selectUsers(SqlSession session, PageInfo pi);

	/**
	 * 관리자 - 검색했을때 개수
	 * @param searchValue
	 * @return int
	 */
	int getSearchUserCount(SqlSession session, String searchValue);

	/**
	 * 관리자 - 회원 검색
	 * @param session
	 * @param pi
	 * @param searchValue
	 * @return List<AttendanceUser>
	 */
	List<AttendanceUser> selectListByKeyword(SqlSession session, PageInfo pi, String searchValue);

	/**
	 * 관리자 근태관리- 연차 리스트 개수
	 * @return int
	 */
	int getVacationListCount(SqlSession session);

	/**
	 * 관리자 근태관리- 연차 리스트
	 * @param pi
	 * @return List<VacationUser>
	 */
	List<VacationUser> selectVacation(SqlSession session, PageInfo pi);

	/**
	 * 관리자 - 검색했을때 연차 개수
	 * @param searchValue
	 * @return int
	 */
	int getSearchVacationListCount(SqlSession session, String searchValue);

	/**
	 * 관리자 - 회원 검색(연차)
	 * @param session
	 * @param pi
	 * @param searchValue
	 * @return List<VacationUser>
	 */
	List<VacationUser> selectVacationListByKeyword(SqlSession session, PageInfo pi, String searchValue);

}
