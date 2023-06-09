package com.kh.teamhub.attendance.service;

import java.util.List;

import com.kh.teamhub.attendance.domain.SearchVacation;
import com.kh.teamhub.attendance.domain.Vacation;
import com.kh.teamhub.user.domain.User;

public interface VacationService {

	/**
	 * 연차 리스트
	 * @param user
	 * @return List<Vacation>
	 */
	List<Vacation> selectVacationList(User user);

	/**
	 * 연차관리 검색
	 * @return List<Vacation>
	 */
	List<Vacation> searchListByYear(SearchVacation searchVacation);

}
