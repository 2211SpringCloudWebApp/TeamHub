package com.kh.teamhub.attendance.service;

import java.util.List;

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

}
