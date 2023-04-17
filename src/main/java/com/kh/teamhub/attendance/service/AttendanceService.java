package com.kh.teamhub.attendance.service;

import com.kh.teamhub.attendance.domain.Attendance;

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

}
