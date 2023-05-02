package com.kh.teamhub.attendance.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.attendance.domain.SearchVacation;
import com.kh.teamhub.attendance.domain.Vacation;
import com.kh.teamhub.attendance.store.VacationStore;
import com.kh.teamhub.user.domain.User;

@Service
public class VacationServiceImpl implements VacationService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private VacationStore vStore;
	
	@Override
	public List<Vacation> selectVacationList(User user) {
		List<Vacation> vList = vStore.selectVacationList(session, user);
		return vList;
	}

	@Override
	public List<Vacation> searchListByYear(SearchVacation searchVacation) {
		List<Vacation> vList = vStore.searchListByYear(session, searchVacation);
		return vList;
	}

}
