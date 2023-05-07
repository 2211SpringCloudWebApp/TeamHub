package com.kh.teamhub.alram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.teamhub.alram.service.AlramService;

@Controller
@RequestMapping("/alram")
public class AlramController {

	@Autowired
	private AlramService aService;
	
	@ResponseBody
	@RequestMapping(value = "/count", method = RequestMethod.POST)
	public String alramCount(String userId) {
		System.out.println("알람카운트 메소드 진입, 유저아이디 : " + userId);
		
		int result = aService.selectCountAlram(userId); 
		
		System.out.println(result);
		
		return String.valueOf(result);
	}
}
