package com.kh.teamhub.todo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TodoController {
	
	@RequestMapping(value = "/todo/mainView", method = RequestMethod.GET)
	public String todoMainView() {
		return "todo/main";
	}

}
