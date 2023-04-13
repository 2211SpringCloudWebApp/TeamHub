package com.kh.teamhub.schedule.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.teamhub.common.LoginUtil;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private LoginUtil loginUtil;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String selectAllSchedule(HttpServletRequest request) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}
		return "schedule/list";
	}
	
	
}
