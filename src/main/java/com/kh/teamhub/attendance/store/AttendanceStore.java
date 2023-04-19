package com.kh.teamhub.attendance.store;

import java.util.List;

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

}
