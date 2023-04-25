package com.kh.teamhub.todo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.todo.domain.Todo;
import com.kh.teamhub.todo.service.TodoService;
import com.kh.teamhub.user.domain.User;

@Controller
public class TodoController {
	
	@Autowired
	private TodoService tService;
	
	@Autowired
	private LoginUtil loginUtil;
	
	@RequestMapping(value = "/todo/mainView", method = RequestMethod.GET)
	public String todoMainView(HttpServletRequest request, Model model) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동. -> GET쓸때만 하기
		}
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<Todo> tList = tService.selectTodoList(user);
		if(!tList.isEmpty()) {
			model.addAttribute("tList", tList);
		}
		return "todo/main2";
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxInsertTodo", method = RequestMethod.POST)
	public int insertTodo(@ModelAttribute Todo todo) {
		System.out.println(todo);
		int result = tService.insertTodo(todo);
		return result;
	}
	
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
	
	@ResponseBody
	@RequestMapping(value = "/ajaxDeleteTodo", method = RequestMethod.POST)
	public String deleteTodo(int todoNo) {
		int result = tService.deleteTodo(todoNo);
		return "성공";
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
