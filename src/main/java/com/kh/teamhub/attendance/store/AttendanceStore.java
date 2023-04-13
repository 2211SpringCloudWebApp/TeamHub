package com.kh.teamhub.attendance.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.teamhub.attendance.domain.Attendance;

public interface AttendanceStore {

	int insertGoToWork(SqlSession session, Attendance attendance);

	Attendance selectOne(SqlSession session, String userId);

}
