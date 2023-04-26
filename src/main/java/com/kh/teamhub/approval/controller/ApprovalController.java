package com.kh.teamhub.approval.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.teamhub.approval.domain.ApprovalJoinForm;
import com.kh.teamhub.approval.domain.Search;
import com.kh.teamhub.approval.service.ApprovalService;
import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.common.PageInfo;
import com.kh.teamhub.user.domain.User;

@Controller
@RequestMapping("/approval")
public class ApprovalController {

	@Autowired
	private LoginUtil loginUtil;
	
	@Autowired
	private ApprovalService aService;
	
	
	//////////////////// 문서함 ////////////////////////////
	// 기안문서함 페이지로 이동
	@RequestMapping(value = "/draftDocuments", method = RequestMethod.GET)
	public String draftDocuments(HttpServletRequest request
			                   , Model model
			                   , @RequestParam(value = "progress", required = false, defaultValue = "전체") String progress
			                   , @RequestParam(value="page", required=false, defaultValue="1") Integer page
			                   , @ModelAttribute Search search) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		Map<String, String> progressMap = new HashMap<String, String>();
		progressMap.put("userId", user.getUserId());
		progressMap.put("apprStatus", progress);
		
		System.out.println("진행상태 : " + progress);
		System.out.println("페이지 : " + page);
		System.out.println("서치 : " + search);
		
		// 검색 안했을 경우
		if((search.getSearchCondition() == null && search.getSearchKeyword() == null && search.getUserId() == null) 
				|| (search.getSearchCondition() == "" && search.getSearchKeyword() == "")) {
			
			int totalCount = aService.getListCount(progressMap);
			
			PageInfo pi = this.getPageInfo(page, totalCount);
			
			List<ApprovalJoinForm> aList = aService.selectApprovalList(pi, progressMap);
			if(!aList.isEmpty()) {
				model.addAttribute("progressMap", progressMap);
				model.addAttribute("pi", pi);
				model.addAttribute("aList", aList);
			}
			return "approval/draftDocuments";
		} 
		
		// 검색했을 경우
		else {
			progressMap.put("searchCondition", search.getSearchCondition());
			progressMap.put("searchKeyword", search.getSearchKeyword());
			
			int totalCount = aService.getSearchListCount(progressMap);  // 서치대신 맵 대입
			System.out.println("검색했을때 - totalCount : " + totalCount);
			PageInfo pi = this.getPageInfo(page, totalCount);
			System.out.println("검색했을때 - pi : " + pi);
			List<ApprovalJoinForm> aList = aService.selectListByKeword(pi, progressMap);   // 서치대신 맵 대입
			System.out.println("검색했을때 - aList : " + aList);
			if(!aList.isEmpty()) {
				model.addAttribute("progressMap", progressMap);    // 서치대신 맵 대입
				model.addAttribute("pi", pi);
				model.addAttribute("aList", aList);
				return "approval/draftDocuments";
			} else {
				model.addAttribute("aList", aList);
				return "approval/draftDocuments";
			}
		}
			
	}
	
	// 결재문서함 페이지로 이동
	@RequestMapping(value = "/approvalDocuments", method = RequestMethod.GET)
	public String approvalDocuments(HttpServletRequest request) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}		
		return "approval/approvalDocuments";
	}

	// 참조문서함 페이지로 이동
	@RequestMapping(value = "/referenceDocuments", method = RequestMethod.GET)
	public String referenceDocuments(HttpServletRequest request) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}		
		return "approval/referenceDocuments";
	}

	// 임시저장함 페이지로 이동
	@RequestMapping(value = "/tempDocuments", method = RequestMethod.GET)
	public String tempDocuments(HttpServletRequest request) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}		
		return "approval/tempDocuments";
	}
	
	
	//////////////// 문서 양식 ///////////////////
	// 기안서 페이지로 이동
	@RequestMapping(value = "/draftForm", method = RequestMethod.GET)
	public String draftForm(HttpServletRequest request) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}		
		return "approval/draftForm";
	}
	
	// 품의서 페이지로 이동
	@RequestMapping(value = "/requisitionForm", method = RequestMethod.GET)
	public String requisitionForm(HttpServletRequest request) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}		
		return "approval/requisitionForm";
	}
	
	// 휴가신청서 페이지로 이동
	@RequestMapping(value = "/leaveRequestForm", method = RequestMethod.GET)
	public String leaveRequestForm(HttpServletRequest request) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}		
		return "approval/leaveRequestForm";
	}
	// 지출결의서 페이지로 이동
	@RequestMapping(value = "/expenseResolutionForm", method = RequestMethod.GET)
	public String expenseResolutionForm(HttpServletRequest request) throws Exception {
		if(loginUtil.checkLogin(request)) {    
			return "main/login";	 // 비로그인시 로그인 페이지로 이동.
		}		
		return "approval/expenseResolutionForm";
	}
	
	///////////// 메소드 /////////////////////////
	// navigator start, end값 설정 메소드
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;  // 보여줄 게시물의 개수
		int naviLimit = 5;    // 보여줄 네비의 개수
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit+0.9);
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
	
}

