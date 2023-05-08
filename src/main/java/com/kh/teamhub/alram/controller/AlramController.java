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
		int result = aService.selectCountAlram(userId); 
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String alramCheck(String alramNo) {
		int result = aService.checkAlram(alramNo); 
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkAll", method = RequestMethod.POST)
	public String alramCheckAll(String userId) {
		int result = aService.checkAllAlram(userId); 
		return String.valueOf(result);
	}
}
