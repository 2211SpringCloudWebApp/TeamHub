package com.kh.teamhub.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.teamhub.board.domain.Free;
import com.kh.teamhub.board.service.FreeService;

@Controller
public class FreeController {
	
	@Autowired
	private FreeService fService;
	
	//자유게시판 등록화면
	@RequestMapping(value="/free/writeView", method=RequestMethod.GET)
	public String writeView() {
		return "/board/free/write";
	}
	
	//자유게시판 등록
	@RequestMapping(value="/free/write", method=RequestMethod.POST)
	public String freeRegister(@ModelAttribute Free free, Model model) {
		try {
			int result = fService.insertFree(free);
			if(result > 0) {
				return "redirect:/free/list";
			}else {
				model.addAttribute("msg","게시판 등록이 완료되지 않았습니다");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	// 자유게시판 목록 보기
	@RequestMapping(value="/free/list", method=RequestMethod.GET)
	public String freeListView(Model model) {
		List<Free> fList = fService.selectFreeList();
		model.addAttribute("fList", fList);
		return "/board/free/list";
	}
}
