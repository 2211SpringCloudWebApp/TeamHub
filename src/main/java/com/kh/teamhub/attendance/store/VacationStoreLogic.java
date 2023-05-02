package com.kh.teamhub.attendance.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.attendance.domain.SearchVacation;
import com.kh.teamhub.attendance.domain.Vacation;
import com.kh.teamhub.user.domain.User;

@Repository
public class VacationStoreLogic implements VacationStore{

	@Override
	public List<Vacation> selectVacationList(SqlSession session, User user) {
		List<Vacation> vList = session.selectList("VacationMapper.selectVacationList", user);
		return vList;
	}

	@Override
	public List<Vacation> searchListByYear(SqlSession session, SearchVacation searchVacation) {
		List<Vacation> vList = session.selectList("VacationMapper.searchListByYear", searchVacation);
		return vList;
	}

}
