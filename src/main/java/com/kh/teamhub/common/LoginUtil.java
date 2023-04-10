package com.kh.teamhub.common;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.kh.teamhub.user.domain.User;

@Component
public class LoginUtil {

	/**
	 * 로그인 체크 메소드.
	 * 메소드를 호출할 때 비로그인이라면 true를 반환.
	 * Controller에서는 true시 로그인 페이지로 이동시킴.
	 * @param request
	 * @return boolean
	 * @throws Exception
	 */
	public boolean checkLogin(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return true;
		} else {
			return false;
		}
	}
	
}
