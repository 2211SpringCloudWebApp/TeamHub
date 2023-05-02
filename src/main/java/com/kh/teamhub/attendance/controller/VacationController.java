package com.kh.teamhub.attendance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.teamhub.attendance.domain.SearchVacation;
import com.kh.teamhub.attendance.domain.Vacation;
import com.kh.teamhub.attendance.service.AttendanceService;
import com.kh.teamhub.attendance.service.VacationService;
import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.user.domain.User;

@Controller
public class VacationController {
	
	@Autowired
	private VacationService vService;
	
	@Autowired
	private LoginUtil loginUtil;
	
	// 연차 메인
	@RequestMapping(value = "/vacation/mainView", method = RequestMethod.GET)
	public String vacationMainView(HttpServletRequest request, Model model) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동. -> GET쓸때만 하기
		}
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		// 연차 리스트
		List<Vacation> vList = vService.selectVacationList(user);
		if(!vList.isEmpty()) {
			model.addAttribute("vList", vList);
		}
		return "attendance/vacationMain";
	}
	
	@RequestMapping(value = "/vacation/search", method = RequestMethod.GET)
	public String vacationSearch(
			@ModelAttribute SearchVacation searchVacation
			, HttpServletRequest request
			, Model model) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동. -> GET쓸때만 하기
		}
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		searchVacation.setUserId(user.getUserId());
		System.out.println(searchVacation);
		List<Vacation> searchVlist = vService.searchListByYear(searchVacation);
		if(!searchVlist.isEmpty()) {
			model.addAttribute("searchVacation", searchVacation);
			model.addAttribute("searchVlist", searchVlist);
			return "attendance/searchVacation";
		}
		return "attendance/searchVacation";
	}

}
