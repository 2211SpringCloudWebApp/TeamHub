package com.kh.teamhub.attendance.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.attendance.domain.Attendance;
import com.kh.teamhub.attendance.store.AttendanceStore;

@Service
public class AttendanceServiceImpl implements AttendanceService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private AttendanceStore aStore;

	@Override
	public int insertGoToWork(Attendance attendance) {
		int result = aStore.insertGoToWork(session, attendance);
		return result;
	}

	@Override
	public Attendance selectOne(String userId) {
		Attendance attendance = aStore.selectOne(session, userId);
		return attendance;
	}

	@Override
	public int updateGoToHome(Attendance attendance) {
		int result = aStore.updateGoToHome(session, attendance);
		return result;
	}


}