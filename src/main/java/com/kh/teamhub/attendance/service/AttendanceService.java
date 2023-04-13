package com.kh.teamhub.attendance.service;

import com.kh.teamhub.attendance.domain.Attendance;

public interface AttendanceService {

	int insertGoToWork(Attendance attendance);

	int updateGoToHome(String date);

	Attendance selectOne(String userId);

}
