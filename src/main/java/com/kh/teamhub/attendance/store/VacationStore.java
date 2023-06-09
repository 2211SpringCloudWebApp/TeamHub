package com.kh.teamhub.attendance.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.teamhub.attendance.domain.SearchVacation;
import com.kh.teamhub.attendance.domain.Vacation;
import com.kh.teamhub.user.domain.User;

public interface VacationStore {

	/**
	 * 연차 리스트
	 * @param session
	 * @param user
	 * @return List<Vacation>
	 */
	List<Vacation> selectVacationList(SqlSession session, User user);

	/**
	 * 연차 검색
	 * @param session
	 * @return List<Vacation>
	 */
	List<Vacation> searchListByYear(SqlSession session, SearchVacation searchVacation);

}
