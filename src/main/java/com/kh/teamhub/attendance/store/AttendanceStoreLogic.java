package com.kh.teamhub.attendance.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.attendance.domain.AttenCount;
import com.kh.teamhub.attendance.domain.Attendance;
import com.kh.teamhub.attendance.domain.AttendanceUser;
import com.kh.teamhub.attendance.domain.VacationUser;
import com.kh.teamhub.common.PageInfo;

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

	@Override
	public int getUserListCount(SqlSession session) {
		int result = session.selectOne("AttenMapper.getUserListCount");
		return result;
	}

	@Override
	public List<AttendanceUser> selectUsers(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AttendanceUser> aList = session.selectList("AttenMapper.selectUsers", null, rowBounds);
		return aList;
	}

	@Override
	public int getSearchUserCount(SqlSession session, String searchValue) {
		int result = session.selectOne("AttenMapper.getSearchUserCount", searchValue);
		return result;
	}

	@Override
	public List<AttendanceUser> selectListByKeyword(SqlSession session, PageInfo pi, String searchValue) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AttendanceUser> searchList = session.selectList("AttenMapper.selectListByKeyword", searchValue, rowBounds);
		return searchList;
	}

	@Override
	public int getVacationListCount(SqlSession session) {
		int result = session.selectOne("VacationMapper.getVacationListCount");
		return result;
	}

	@Override
	public List<VacationUser> selectVacation(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<VacationUser> vuList = session.selectList("VacationMapper.selectVacation", null, rowBounds);
		return vuList;
	}

	@Override
	public int getSearchVacationListCount(SqlSession session, String searchValue) {
		int result = session.selectOne("VacationMapper.getSearchVacationListCount", searchValue);
		return result;
	}

	@Override
	public List<VacationUser> selectVacationListByKeyword(SqlSession session, PageInfo pi, String searchValue) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<VacationUser> searchVList = session.selectList("VacationMapper.selectVacationListByKeyword", searchValue, rowBounds);
		return searchVList;
	}

}