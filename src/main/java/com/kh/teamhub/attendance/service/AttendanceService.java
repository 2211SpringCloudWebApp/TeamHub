package com.kh.teamhub.attendance.service;

import java.util.List;

import com.kh.teamhub.attendance.domain.AttenCount;
import com.kh.teamhub.attendance.domain.Attendance;
import com.kh.teamhub.attendance.domain.AttendanceUser;
import com.kh.teamhub.common.PageInfo;

public interface AttendanceService {

	/**
	 * 출근시간 입력 Service
	 * @param attendance
	 * @return int
	 */
	int insertGoToWork(Attendance attendance);

	/**
	 * 출근 중복체크 Service
	 * @param userId
	 * @return Attendance
	 */
	Attendance selectOne(String userId);

	/**
	 * 퇴근시간 입력 Service
	 * @param attendance
	 * @return int
	 */
	int updateGoToHome(Attendance attendance);

	/**
	 * 출퇴근 리스트 가져오는 Service
	 * @param userId
	 * @return List<Attendance>
	 */
	List<Attendance> selectAtten(String userId);

	/**
	 * 지각통계 Service
	 * @param userId
	 * @return int
	 */
	int selectStatus(Attendance userId);

	/** 조퇴 통계 Serviece
	 * @param userId
	 * @return int
	 */
	int selectStatus2(Attendance userId);

	/**
	 * 출근 통계 Service
	 * @param userId
	 * @return int
	 */
	int selectStatus3(Attendance userId);

	/**
	 * 년/월 리스트
	 * @param atten
	 * @return List<Attendance>
	 */
	List<Attendance> selectMonthByAtten(Attendance atten);

	/**
	 * 지각.조퇴.출근 통계
	 * @param atten
	 * @return AttenCount
	 */
	AttenCount selectListByAtten(Attendance atten);

	/**
	 * 관리자 근태관리- 유저 리스트 개수
	 * @return int
	 */
	int getUserListCount();

	/**
	 * 관리자 근태관리- 유저 리스트
	 * @param pi
	 * @return List<AttendanceUser>
	 */
	List<AttendanceUser> selectUsers(PageInfo pi);

	/**
	 * 관리자 - 검색했을때 개수
	 * @param searchValue
	 * @return int
	 */
	int getSearchUserCount(String searchValue);

	/**
	 * 관리자 - 회원 검색
	 * @param pi
	 * @param searchValue
	 * @return List<AttendanceUser>
	 */
	List<AttendanceUser> selectListByKeyword(PageInfo pi, String searchValue);

}
