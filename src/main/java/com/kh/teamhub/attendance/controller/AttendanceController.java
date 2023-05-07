package com.kh.teamhub.attendance.controller;

import java.time.Duration;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.teamhub.attendance.domain.AttenCount;
import com.kh.teamhub.attendance.domain.Attendance;
import com.kh.teamhub.attendance.domain.AttendanceUser;
import com.kh.teamhub.attendance.domain.SearchVacation;
import com.kh.teamhub.attendance.domain.Vacation;
import com.kh.teamhub.attendance.domain.VacationUser;
import com.kh.teamhub.attendance.service.AttendanceService;
import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.common.PageInfo;
import com.kh.teamhub.user.domain.User;

import oracle.jdbc.proxy.annotation.Post;


@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService aService;
	
	@Autowired
	private LoginUtil loginUtil;
	
	PageInfo pi = null;
	
	// 관리자 (연차)
	@RequestMapping(value = "/attendance/adminVacation", method = RequestMethod.GET)
	public String AdminVacation(
			HttpServletRequest request
			, String searchValue
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page
			, Model model
			) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동. -> GET쓸때만 하기
		}
		int totalCount = aService.getVacationListCount();
		pi = this.getPageInfo(page, totalCount);
		List<VacationUser> vuList = aService.selectVacation(pi);
		if(!vuList.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("vuList", vuList);
		}
		return "/attendance/adminVacation";
	}

	// 관리자 - 이름으로 연차 검색
	@RequestMapping(value = "/admin/searchVacation", method = RequestMethod.GET)
	public String adminVacationSearch(
			String searchValue
			, HttpServletRequest request
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page
			, Model model) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동. -> GET쓸때만 하기
		}
		int totalCount = aService.getSearchVacationListCount(searchValue);
		pi = this.getPageInfo(page, totalCount);
		List<VacationUser> searchVList = aService.selectVacationListByKeyword(pi, searchValue);
		if(!searchVList.isEmpty()) {
			model.addAttribute("searchValue", searchValue);
			model.addAttribute("pi", pi);
			model.addAttribute("searchVList", searchVList);
		}
		return "/attendance/adminSearchVacation";
	}
			
	// 관리자 (근태)
	@RequestMapping(value = "/attendance/adminView", method = RequestMethod.GET)
	public String mainAdmin(
			HttpServletRequest request
			, String searchValue
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page
			, Model model
			) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동. -> GET쓸때만 하기
		}
		int totalCount = aService.getUserListCount();
		pi = this.getPageInfo(page, totalCount);
		List<AttendanceUser> uList = aService.selectUsers(pi);
//		System.out.println(pi);
		if(!uList.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("uList", uList);
		}
		return "attendance/adminMain";
	}
	
	// 관리자 - 이름으로 사용자 검색
		@RequestMapping(value = "/admin/searchUser", method = RequestMethod.GET)
		public String vacationSearch(
				String searchValue
				, HttpServletRequest request
				, @RequestParam(value="page", required=false, defaultValue="1") Integer page
				, Model model) throws Exception {
			if(loginUtil.checkLogin(request)) {    
				return "main/login";	 // 비로그인시 로그인 페이지로 이동. -> GET쓸때만 하기
			}
			int totalCount = aService.getSearchUserCount(searchValue);
			pi = this.getPageInfo(page, totalCount);
			List<AttendanceUser> searchList = aService.selectListByKeyword(pi, searchValue);
			if(!searchList.isEmpty()) {
				model.addAttribute("searchValue", searchValue);
				model.addAttribute("pi", pi);
				model.addAttribute("searchList", searchList);
			}
			return "attendance/searchAdmin";
		}
	
	// 근태관리 메인
	@RequestMapping(value = "/attendance/mainView", method = RequestMethod.GET)	// 근태관리 메인View
	public String mainAttenView(HttpServletRequest request, Model model) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동. -> GET쓸때만 하기
		}
		// 출퇴근 리스트 (근태관리페이지 바로 들어가면 그 달의 리스트 뜸)
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<Attendance> aList = aService.selectAtten(user.getUserId());
		if(!aList.isEmpty()) {
			model.addAttribute("aList", aList);
		}
		// 지각, 조퇴, 출근 통계 (근태관리페이지 바로 들어가면 그 달의 통계 뜸)
		Attendance userId = aService.selectOne(user.getUserId());
		int result = aService.selectStatus(userId);
		// result >= 0 : 만약 지각이라는 값이 없어도 결과를 보내줘야 하니까 크거나 같을때라고 해야함
		if(result >= 0) {
			model.addAttribute("result", result); //지각
		}
		int result2 = aService.selectStatus2(userId);
		if(result2 >= 0) {
			model.addAttribute("result2", result2); //조퇴
		}
		int result3 = aService.selectStatus3(userId);
		if(result3 >= 0) {
			model.addAttribute("result3", result3); //출근
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
//			System.out.println(date);
			// 출근 시간이 있어야 퇴근버튼 누르기 가능
			Attendance userId = aService.selectOne(user.getUserId());
//			System.out.println(userId);
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
				// 근무시간 구하기(TotalWorkHour)
				// 위에서 endTime이랑 startTime은 int가 됐음
				// endTime/startTime 변수를 시, 분, 초 각각으로 분리하여 LocalTime.of() 메소드를 사용하여 시간 객체로 변환
				LocalTime start = LocalTime.of(startTime / 10000, (startTime % 10000) / 100, startTime % 100);
				LocalTime end = LocalTime.of(endTime / 10000, (endTime % 10000) / 100, endTime % 100);
				Duration duration = Duration.between(start, end);

				long totalWorkHourInSeconds = duration.getSeconds();

				String formattedTime = String.format("%02d:%02d:%02d", 
				    totalWorkHourInSeconds / 3600,  // 시
				    (totalWorkHourInSeconds % 3600) / 60,  // 분
				    totalWorkHourInSeconds % 60  // 초
				);
				userId.setTotalWorkHour(formattedTime);
				// userId에 TotalWorkHour 까지 넣어서 update해주기
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
	
	@RequestMapping(value = "/ajaxGetMonthByAtten", method =RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String ajaxGetMonthByAtten(String userId, String date) {
			Attendance atten = new Attendance();
			atten.setUserId(userId);
			atten.setDate(date);
			List<Attendance> aList = aService.selectMonthByAtten(atten);
			// 날짜가 '4월 19, 2023' 이렇게나오는걸 '2023-04-19' 이렇게 나오도록 변경
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			if(!aList.isEmpty()) {
				return gson.toJson(aList);
			}
		return null;
	}
	
	@RequestMapping(value = "/ajaxGetListByAtten", method = RequestMethod.POST)
	@ResponseBody
	public String ajaxGetListByAtten(String userId, String date) {
		System.out.println(date);
		Attendance atten = new Attendance();
		atten.setUserId(userId);
		atten.setDate(date);
		AttenCount aCount = aService.selectListByAtten(atten);
		Gson gson = new Gson();
		return gson.toJson(aCount);
		
	}
	
//	@RequestMapping(value = "/ajaxGetMonthByAtten", method =RequestMethod.POST)
//	@ResponseBody
//	public ResponseEntity<List<Attendance>> ajaxGetMonthByAtten(String userId, String date) {
//		System.out.println(userId);
//			Attendance atten = new Attendance();
//			atten.setUserId(userId);
//			atten.setDate(date);
//			List<Attendance> aList = aService.selectMonthByAtten(atten);
//			if(!aList.isEmpty()) {
//				return new ResponseEntity<>(aList, HttpStatus.OK);
//			}
//		return new ResponseEntity<>(aList, HttpStatus.OK);
//	}
			
	
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
	 
	 /*===================================================
	 * 페이징 처리
	 *===================================================*/
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10; 	// 한 페이지 당 게시글 갯수
		int naviLimit = 5;		// 한 페이지 당 pageNavi 수
		int maxPage;			// 페이지의 마지막 번호
		int startNavi;			// pageNavi 시작값
		int endNavi;			// pageNavi 끝값
		
		maxPage = (int)((double)totalCount/boardLimit+0.9);
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
			if(endNavi > maxPage) {
				endNavi = maxPage;
			}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}


}