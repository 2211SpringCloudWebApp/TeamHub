package com.kh.teamhub.attendance.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.teamhub.attendance.domain.Attendance;

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

}
