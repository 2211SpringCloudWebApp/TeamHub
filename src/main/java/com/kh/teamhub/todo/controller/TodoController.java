package com.kh.teamhub.todo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.EventObject;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.todo.domain.Memo;
import com.kh.teamhub.todo.domain.Todo;
import com.kh.teamhub.todo.service.TodoService;
import com.kh.teamhub.user.domain.User;

@Controller
public class TodoController {
	
	@Autowired
	private TodoService tService;
	
	@Autowired
	private LoginUtil loginUtil;
	
	/// 메인 ///
	@RequestMapping(value = "/todo/mainView", method = RequestMethod.GET)
	public String todoMainView(HttpServletRequest request, Model model) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동. -> GET쓸때만 하기
		}
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		// 할 일 리스트
		List<Todo> tList = tService.selectTodoList(user);
		if(!tList.isEmpty()) {
			model.addAttribute("tList", tList);
		}
		// 메모 리스트
		List<Memo> mList = tService.selectMemoList(user.getUserId());
		if(!mList.isEmpty()) {
			model.addAttribute("mList", mList);
		}
		return "todo/main";
	}
	
	/// 할 일 등록 ///
	@ResponseBody
	@RequestMapping(value = "/ajaxInsertTodo", method = RequestMethod.POST)
	public String insertTodo(
			@ModelAttribute Todo todo
			, @RequestParam String tdCreateDate) {
		try {
//			System.out.println("todo : " +todo);
//			System.out.println("tdCreateDate : " +tdCreateDate);
	        // Todo에서 tdCreateDate 변환시킨거 newTodo에 새로 담아서
	        Todo newTodo = new Todo(tdCreateDate, todo.getUserId(), todo.getTodoContent());
	        // newTodo 보내주고 등록
	        int result = tService.insertTodo(newTodo);
	        if(result > 0) {
	        	Gson gson = new Gson();
				return gson.toJson(result);
	        }
	        return "성공";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "날짜 형식이 잘못되었습니다.";
	    }

	}
	
	/// IS_FINISHED Y인지 N인지 체크해서 체크박스랑 글씨에 줄긋게 ///
	@ResponseBody
	@RequestMapping(value = "/ajaxCheckFinish", method = RequestMethod.POST)
	public String checkFinish(int todoNo) {
		int result = tService.updateFinish(todoNo);
		// 위에서 IS_FINISHED를 업데이트한 todo를 결과로 보내주려고 select함
		Todo todo = tService.selectUpdateTodo(todoNo);
//		System.out.println(result);
		if(result > 0) {
			Gson gson = new Gson();
			return gson.toJson(todo);
		} else {
			return "error";
		}
	}
	
	/// 할 일 삭제 ///
	@ResponseBody
	@RequestMapping(value = "/ajaxDeleteTodo", method = RequestMethod.POST)
	public String deleteTodo(int todoNo) {
		int result = tService.deleteTodo(todoNo);
		return "성공";
	}
	
	/// 달력에서 선택한 날짜의 리스트 가져오기 ///
	@ResponseBody
	@RequestMapping(value = "/ajaxSelectDay", method = RequestMethod.POST, produces="application/json;charset=utf-8")
	public String selectDay(HttpServletRequest request, @RequestParam("date") String date) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
//		System.out.println(date);
		Todo todo = new Todo();
		todo.setUserId(user.getUserId());
		todo.setDate(date); // 달력에서 내가 선택한 날짜로 set해주기
		// 선택한 날짜를 보내서 그 날짜의 리스트 불러오기
		List<Todo> tList = tService.selectDayList(todo);
//		System.out.println(tList);
		Gson gson = new Gson();
		return gson.toJson(tList);
	}
	
	/// 로그인한 아이디의 할일 리스트를 달력에 보여주기 ///
	@ResponseBody
	@RequestMapping(value = "/ajaxCalendarEvents", method = RequestMethod.POST, produces="application/json;charset=utf-8")
	public String selectEvents(String userId) {
		List<Todo> tList = tService.selectEvents(userId);
		Gson gson = new Gson();
		return gson.toJson(tList);
	}
	
	/// 메모 ///
	@ResponseBody
	@RequestMapping(value = "/ajaxInsertMemo", method = RequestMethod.POST)
	public String insertMemo(@ModelAttribute Memo memo) {
//		System.out.println("memo : " + memo);
		int result = tService.insertMemo(memo);
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxDeleteMemo", method = RequestMethod.POST)
	public String deleteMemo(int memoNo) {
		int result = tService.deleteMemo(memoNo);
		Gson gson = new Gson();
		return gson.toJson(result);
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
