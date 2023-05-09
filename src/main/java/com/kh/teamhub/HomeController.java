package com.kh.teamhub;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.teamhub.board.domain.Notice;
import com.kh.teamhub.board.service.NoticeService;
import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.project.domain.Project;
import com.kh.teamhub.project.service.ProjectService;
import com.kh.teamhub.todo.domain.Todo;
import com.kh.teamhub.todo.service.TodoService;
import com.kh.teamhub.user.domain.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private LoginUtil loginUtil;
	@Autowired
	private NoticeService nService;
	@Autowired
	private ProjectService pService;
	@Autowired
	private TodoService tService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );

		
		User user = (User)session.getAttribute("user");
		
		// 홈화면 공지사항 리스트 넘겨주기
		List<Notice> nList = nService.selectList();
		List<Project> pList = pService.selectList(user.getUserId());
		List<Todo> tList = tService.selectTodoList(user);
		if(!tList.isEmpty()) {
			model.addAttribute("tList", tList);
		}
		model.addAttribute("nList", nList);
		model.addAttribute("pList", pList);
		
		
		return "/main/home";
	}
	
}
