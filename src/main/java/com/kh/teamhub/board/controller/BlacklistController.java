package com.kh.teamhub.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Report;
import com.kh.teamhub.board.service.BlacklistService;
import com.kh.teamhub.user.domain.User;
import com.kh.teamhub.user.service.UserService;

@Controller
public class BlacklistController {

	@Autowired
	private BlacklistService bService;
	
	
		
		//신고 목록
		@RequestMapping(value="/free/blacklist", method=RequestMethod.GET)
		public String reportListView(
				Model model
				, @RequestParam(value="page", required=false, defaultValue="1") Integer page
				, HttpSession session) {
			User user = (User)session.getAttribute("user");
			if(user != null) {
				if(1 == user.getUserType()) {
					int totalCount = bService.getListCount();
					PageInfo pi = this.getPageInfo(page, totalCount);
					List<User> bList = bService.selectBlackList(page);
					//fList.get(0).getFreeNo();
					model.addAttribute("pi", pi);
					model.addAttribute("bList", bList);
					return "/board/free/blacklist";
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
		
		// 해제
		@RequestMapping(value="/blacklist/bdelete",method=RequestMethod.POST)
		public String blacklistRemove(@RequestParam("userId") String [] userId, Model model) {
			try {
				// login check!
				int result = bService.deleteBlacklist(userId);
				if(result > 0) {
					return "redirect:/free/blacklist";
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
