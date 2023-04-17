package com.kh.teamhub.attendance.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.teamhub.attendance.domain.Attendance;
import com.kh.teamhub.attendance.service.AttendanceService;
import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.user.domain.User;


@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService aService;
	
	@Autowired
	private LoginUtil loginUtil;
	
	@RequestMapping(value = "/attendance/mainView", method = RequestMethod.GET)
	public String mainAttenView(HttpServletRequest request) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동. -> GET쓸때만 하기
		}
		return "attendance/main";
		
	}
	
	@RequestMapping(value = "/ajaxGoToWork", method = RequestMethod.POST)
	@ResponseBody
	public String ajaxGoToWork(HttpServletRequest request,  String date) {
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			// 출근버튼 누른적있는지 확인 -ATTE_DATE가 오늘날짜인데 StartTime이 NULL이면 누를수있다.
			Attendance userId = aService.selectOne(user.getUserId());
			// 누른적있으면 못눌러
			if(userId.getStartTime() != null) {
				return "중복체크";
			} else {
				// 누른적없으면 이제 밑에실행해
				// 출근 시간 
				Attendance attendance = new Attendance();
				attendance.setUserId(user.getUserId());
				attendance.setStartTime(date); //12:29:30
				String [] times = date.split(":"); //12:29:30 -> ':' 기준으로 자르기
				String time = String.join("", times); // 자르고 배열된거 합치기
				int startTime = Integer.parseInt(time); // int형으로 변경

				// 출근을 눌렀을 때 그 시간이 9시 전이면 출근
				if(0 < startTime && startTime < 90100) { // int형으로 변경해서 비교가능
					attendance.setAtteStatus("출근");
					// 9시 이후 이면 지각
				} else if (90100 < startTime && startTime < 180000) {
					attendance.setAtteStatus("지각");
				}
				int result = aService.insertGoToWork(attendance);
				if(result > 0) {
					return "0";	// 성공
				} else {
					return "1"; // 실패
				}
				
			}
			
		} catch (Exception e) {
			return e.getMessage();
		}
	}
	
	@RequestMapping(value = "/ajaxGoToHome", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public String ajaxGoToHome(HttpServletRequest request, String date) {
		
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			System.out.println(date);
			// 출근 시간이 있어야 퇴근버튼 누르기 가능
			Attendance userId = aService.selectOne(user.getUserId());
			System.out.println(userId);
			// 퇴근 누른적 있으면 break
//			if(userId.getFinishTime() != null) {
//				return "3"; // break같은 역할을 함
//			}
			// 출근 기록이 있을때
			if(userId != null) {
				// 퇴근 누른적 있으면 break
				if(userId.getFinishTime() != null) {
					return returnJson("이미 퇴근하셨습니다."); // break같은 역할을 함
				}
				String [] times = date.split(":"); 
				String time = String.join("", times); 
				int endTime = Integer.parseInt(time);
				
				if(userId.getStartTime() == null) {
					return returnJson("출근먼저하시길");
				}
				times = userId.getStartTime().split(":");
				time = String.join("", times);
				int startTime = Integer.parseInt(time);
				
				// 9시 넘어서 출근 = 지각
				if(startTime > 90100) {
					userId.setAtteStatus("지각");
				// 18시 전에 퇴근, 9시 전에 출근 = 조퇴
				} else if(endTime < 180000 && startTime < 901000){
					userId.setAtteStatus("조퇴");
				} else {
					userId.setAtteStatus("출근");
				}
				userId.setFinishTime(date);
				userId.setTotalWorkHour(String.valueOf(endTime-startTime));
				int result = aService.updateGoToHome(userId);
				if(result > 0) {
					return returnJson("퇴근 완료");
				} else {
					return returnJson("퇴근 실패 - 다시 눌러주세요");
				}
				
			} else {
				return returnJson("출근먼저");
			}
	}
			
	
	// 문자열을 Json형태로 바꿔줌
	// ajax는 json 으로 리턴을 받는다. 
	 public String returnJson(String result){
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonString = "";
	        try {
	            jsonString = objectMapper.writeValueAsString(result);
	        } catch (JsonProcessingException e) {
	            e.printStackTrace();
	            return jsonString;
	        }

	        return jsonString;
	    }


}