package com.kh.teamhub.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.teamhub.board.domain.FreePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Report;
import com.kh.teamhub.board.service.ReportService;
import com.kh.teamhub.user.domain.User;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;
	
	//신고등록
	@ResponseBody
	@RequestMapping(value="/report/send", method=RequestMethod.POST)
	public String doSendReport(Report report) {
		try {
			int result = rService.insertReport(report);
			if(result > 0) {
				return "1";
			}else {
				
				return "0";
				}
		} catch (Exception e) {
			return e.getMessage();
		}
		
	}
	
	//신고 목록
	@RequestMapping(value="/report/list", method=RequestMethod.GET)
	public String reportListView(
			Model model
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page, HttpSession session) {
		User user = (User)session.getAttribute("user");
		if(user != null) {
			if(1 == user.getUserType()) {
		int totalCount = rService.getListCount();
		PageInfo pi = this.getPageInfo(page, totalCount);
		List<Report> rList = rService.selectReportList(page);
		//fList.get(0).getFreeNo();
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);
		return "/board/report/list";
	}
		}
		return "redirect:/";
	}
	
	// navigator start, end값 설정 method()
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 15;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int)((double)totalCount/boardLimit+0.9);
		//Math.ceil((double)totalCount/boardLimit);
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
	// 신고 삭제
	@RequestMapping(value="/report/delete",method=RequestMethod.POST)
	public String reportRemove(@RequestParam("reportNo") int [] reportNo, Model model) {
		try {
			// login check!
			int result = rService.deleteReport(reportNo);
			if(result > 0) {
				return "redirect:/report/list";
			}else {
				model.addAttribute("msg","삭제가 완료되지 않았습니다");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

}
