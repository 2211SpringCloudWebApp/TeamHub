package com.kh.teamhub.attendance.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.attendance.domain.AttenCount;
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

	@Override
	public List<Attendance> selectAtten(SqlSession session, String userId) {
		List<Attendance> aList = session.selectList("AttenMapper.selectAtten", userId);
		return aList;
	}

	@Override
	public int selectStatus(SqlSession session, Attendance userId) {
		int result = session.selectOne("AttenMapper.selectStatus", userId);
		return result;
	}

	@Override
	public int selectStatus2(SqlSession session, Attendance userId) {
		int result = session.selectOne("AttenMapper.selectStatus2", userId);
		return result;
	}

	@Override
	public int selectStatus3(SqlSession session, Attendance userId) {
		int result = session.selectOne("AttenMapper.selectStatus3", userId);
		return result;
	}

	@Override
	public List<Attendance> selectMonthByAtten(SqlSession session, Attendance atten) {
		List<Attendance> aList = session.selectList("AttenMapper.selectMonthByAtten", atten);
		return aList;
	}

	@Override
	public AttenCount selectListByAtten(SqlSession session, Attendance atten) {
		int result = session.selectOne("AttenMapper.selectListByLate", atten);
		int result2 = session.selectOne("AttenMapper.selectListByEarly", atten);
		int result3 = session.selectOne("AttenMapper.selectListByWork", atten);
		AttenCount aCount = new AttenCount(result, result2, result3);
		return aCount;
	}

}