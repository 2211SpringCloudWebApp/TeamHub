package com.kh.teamhub.attendance.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.attendance.domain.AttenCount;
import com.kh.teamhub.attendance.domain.Attendance;
import com.kh.teamhub.attendance.domain.AttendanceUser;
import com.kh.teamhub.attendance.store.AttendanceStore;
import com.kh.teamhub.common.PageInfo;

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

	@Override
	public List<Attendance> selectAtten(String userId) {
		List<Attendance> aList = aStore.selectAtten(session, userId);
		return aList;
	}

	@Override
	public int selectStatus(Attendance userId) {
		int result = aStore.selectStatus(session, userId);
		return result;
	}

	@Override
	public int selectStatus2(Attendance userId) {
		int result = aStore.selectStatus2(session, userId);
		return result;
	}

	@Override
	public int selectStatus3(Attendance userId) {
		int result = aStore.selectStatus3(session, userId);
		return result;
	}

	@Override
	public List<Attendance> selectMonthByAtten(Attendance atten) {
		List<Attendance> aList = aStore.selectMonthByAtten(session, atten);
		return aList;
	}

	@Override
	public AttenCount selectListByAtten(Attendance atten) {
		AttenCount aCount = aStore.selectListByAtten(session, atten);
		return aCount;
	}

	@Override
	public int getUserListCount() {
		int result = aStore.getUserListCount(session);
		return result;
	}

	@Override
	public List<AttendanceUser> selectUsers(PageInfo pi) {
		List<AttendanceUser> aList = aStore.selectUsers(session, pi);
		return aList;
	}

	@Override
	public int getSearchUserCount(String searchValue) {
		int result = aStore.getSearchUserCount(session, searchValue);
		return result;
	}

	@Override
	public List<AttendanceUser> selectListByKeyword(PageInfo pi, String searchValue) {
		List<AttendanceUser> searchList = aStore.selectListByKeyword(session, pi, searchValue);
		return searchList;
	}


}