package com.kh.teamhub.attendance.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.attendance.domain.Attendance;

@Repository
public class AttendanceStoreLogic implements AttendanceStore{

	@Override
	public int insertGoToWork(SqlSession session, Attendance attendance) {
		int result = session.update("AttenMapper.updateGoToWork", attendance);
		return result;
	}

	@Override
	public Attendance selectOne(SqlSession session, String userId) {
		Attendance attendance = session.selectOne("AttenMapper.selectOne", userId);
		return attendance;
	}

	@Override
	public int updateGoToHome(SqlSession session, Attendance attendance) {
		int result = session.update("AttenMapper.updateGoToHome", attendance);
		return result;
	}

}