package com.kh.teamhub.schedule.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.schedule.domain.Schedule;
import com.kh.teamhub.schedule.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private ScheduleService sService;
	
	@Autowired
	private LoginUtil loginUtil;
	
	// 일정관리 메인 페이지로 이동
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String selectAllSchedule(HttpServletRequest request) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}
		
		return "schedule/list";
	}
	
	// 일정 등록
	@ResponseBody
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String scheduleAdd(@ModelAttribute Schedule schedule) {
		System.out.println(schedule);
		int result = sService.insertSchedule(schedule);
		System.out.println("result 값: " + result);
		if(result > 0) {
			
		} else {
			
		}
		return "";
	}
	
	// 전사 일정 가져오기.
	@RequestMapping(value = "/events", method = RequestMethod.GET, produces="application/json;charset=utf-8")
    @ResponseBody
    public String getEvents(@RequestParam(value = "all") Boolean all,
						            @RequestParam(value = "department") Boolean department,
						            @RequestParam(value = "personal") Boolean personal,
									@RequestParam(value = "userDeptName") String deptName,
									@RequestParam(value = "userId") String userId
									)
	    {
		List<Schedule> sList = new ArrayList<>();
		if (all != null && all) {
			sList.addAll(sService.getAllEvents());
	    }
	    if (department != null && department) {
	    	sList.addAll(sService.getDepartmentEvents(deptName));
	    }
	    if (personal != null && personal) {
	    	sList.addAll(sService.getPersonalEvents(userId));
	    }
	    System.out.println(new Gson().toJson(sList));
	    return new Gson().toJson(sList);
    }
}
