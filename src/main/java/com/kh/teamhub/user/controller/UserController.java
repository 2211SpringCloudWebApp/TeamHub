package com.kh.teamhub.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.common.file.FileUtil;
import com.kh.teamhub.user.domain.User;
import com.kh.teamhub.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService uService;
	
	@Autowired
	private LoginUtil loginUtil;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, @ModelAttribute User user) {
		try {
			if(loginUtil.checkLogin(request)) {    
				return "/user/login";	 // 비로그인시 로그인 페이지로 이동.
			}
			
			return "";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "main/login";
	}
	
}
