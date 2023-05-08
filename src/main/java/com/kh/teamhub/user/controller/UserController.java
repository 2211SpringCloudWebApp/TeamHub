package com.kh.teamhub.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.common.PageInfo;
import com.kh.teamhub.common.file.FileUtil;
import com.kh.teamhub.user.domain.OrgUser;
import com.kh.teamhub.user.domain.Search;
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
	
	// 메인 페이지(홈) 이동
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public String home() {
		
		return "main/home";
	}
	
	
	// 로그인 
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, @ModelAttribute User user) {
		try {
			User loginUser = uService.login(user);
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", loginUser);
				return "main/home";
			} else {
				return "main/login";
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		try {
			
			HttpSession session = request.getSession();
			if (session != null) {
				session.invalidate();
				return "main/login";
			} else {
				return "main/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageInfo(Model model, HttpSession session) {
			try {
				User userOne = (User)session.getAttribute("user");
				String userId = userOne.getUserId();
				User user = uService.selectOneById(userId);
				model.addAttribute("user", user);
				return "user/mypage";
			} catch (Exception e) {
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
	}
	
	// 회원 정보 수정
		@RequestMapping(value="/modifyMypage", method = {RequestMethod.POST, RequestMethod.GET})
		public String modifyMypage(Model model, @ModelAttribute User user
				, HttpServletRequest request
				, @RequestParam(value="uploadFile", required=false) MultipartFile multi) {
			Map<String, String> fileInfo = null;
			try {
				if(multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
					fileInfo = fileUtil.saveFile(multi, request);
					user.setUserFileName(fileInfo.get("rename"));
					user.setUserfilePath(fileInfo.get("renameFilePath"));
				}
				int result = uService.updateUserInfo(user);
				if(result > 0) {
					return "redirect:/user/home";
				}else {
					model.addAttribute("msg", "수정이 완료되지 않았습니다.");
					return "common/error";
				}
			} catch (Exception e) {
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		}
	
	// 사원 등록 화면
	@RequestMapping(value="/registerView", method = RequestMethod.GET)
	public String registerUserView() {
		return "user/register";
	}
	
	// 사원 등록
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String registerUser(HttpServletRequest request
			, Model model
			, @ModelAttribute User user
			, @RequestParam(value="uploadFile", required=false) MultipartFile multi) {
		Map<String, String> fileInfo = null;
		try {
			if(multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
				fileInfo = fileUtil.saveFile(multi, request);
				user.setUserFileName(fileInfo.get("rename"));
				user.setUserfilePath(fileInfo.get("renameFilePath"));
			}
			int result = uService.registerUser(user);
			if(result > 0) {
				return "redirect:/user/list";
			}else {
				model.addAttribute("msg", "사원 등록이 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
		
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/checkId", method = RequestMethod.GET, produces="application/json;charset=utf-8")
	public String checkId(@RequestParam String userId) {
		int result = uService.checkId(userId);
		if(result > 0) {
			// 아이디 중복
			return "1";
		} else {
			// 아이디 중복 X
			return "0";
		}
	}
	
	// 사원 정보 수정
	@RequestMapping(value="/modify", method = {RequestMethod.POST, RequestMethod.GET})
	public String modifyUser(Model model
			, @ModelAttribute User user
			, HttpServletRequest request
			, @RequestParam(value="uploadFile", required=false) MultipartFile multi) {
		Map<String, String> fileInfo = null;
		try {
			if(multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
				fileInfo = fileUtil.saveFile(multi, request);
				user.setUserFileName(fileInfo.get("rename"));
				user.setUserfilePath(fileInfo.get("renameFilePath"));
			}
			int result = uService.updateUser(user);
			if(result > 0) {
				return "redirect:/user//userStateList";
			}else {
				model.addAttribute("msg", "수정이 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 사원 정보 수정(퇴직처리)
	@RequestMapping(value="/modifyState", method = {RequestMethod.POST, RequestMethod.GET})
	public String modifyUserState(Model model, @ModelAttribute User user) {
		try {
			int result = uService.updateUserState(user);
			if(result > 0) {
				return "redirect:/user/userStateList";
			}else {
				model.addAttribute("msg", "수정이 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 사원 삭제
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String deleteUser(Model model
			, @RequestParam("userId") String userId) {
		try {
			int result = uService.deleteUser(userId);
			if(result > 0) {
				return "redirect:/user/list";
			}else {
				model.addAttribute("msg", "삭제가 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 사원 목록 조회
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String selectAllUser(HttpSession session
			, Model model
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		int totalCount = uService.getListCount();
		PageInfo pi = this.getPageInfo(page, totalCount);
		List<User> uList = uService.selectAllUser(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("uList", uList);
		return "user/list";
	}
	
	// 사원 목록 조회(관리자)
	@RequestMapping(value="/userStateList", method = RequestMethod.GET)
	public String selectUserState(HttpSession session
			, Model model) {
		List<User> userStateList = uService.selectUserState();
		
		model.addAttribute("userStateList", userStateList);
		return "user/listAdmin";
	}
	
	
	
	// 조직도 조회
	@ResponseBody
	@RequestMapping(value="/org", method = RequestMethod.GET, produces="application/json;charset=utf-8")
	public String selectOrganization(Model model) {
		List<OrgUser> oList = uService.selectOrganization();
		model.addAttribute("oList", oList);
		return new Gson().toJson(oList);
	}


	// 사원 상세 조회
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String userDetailView(Model model
			, @RequestParam("userId") String userId) {
		try {
			User user = uService.selectOneById(userId);
			model.addAttribute("user", user);
			return "user/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 사원 상세 조회(관리자)
	@RequestMapping(value="/detailAdmin", method = RequestMethod.GET)
	public String userDetailViewAdmin(Model model
			, @RequestParam("userId") String userId) {
		try {
			User user = uService.selectOneById(userId);
			model.addAttribute("user", user);
			return "user/detailAdmin";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 사원 검색
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String userSearch(@ModelAttribute Search search
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, Model model) {
		try {
			int totalCount = uService.getListCount(search);
			PageInfo pi = this.getPageInfo(currentPage, totalCount);
			List<User> searchList = uService.selectListByKeyword(pi,search);
			if(!searchList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("pi", pi);
				model.addAttribute("sList", searchList);
				return "user/search";
			}else {
				model.addAttribute("msg", "검색이 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 사원 검색 (관리자)
	@RequestMapping(value="/stateSearch", method = RequestMethod.GET)
	public String stateYSearch(Model model
			, @ModelAttribute Search search) {
		try {
			List<User> userStateList = uService.selectListByKeyword(search);
//			List<User> retireList = uService.selectUserState();
			if(!userStateList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("userStateList", userStateList);
//				model.addAttribute("retireList", retireList);
				return "user/stateSearch";
			}else {
				model.addAttribute("msg", "검색이 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
	// 페이징
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int navLimit = 10;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int)Math.ceil((double) totalCount / boardLimit);
		startNavi = (((int)((double)currentPage / navLimit + 0.9)) -1 ) * navLimit +1;
		endNavi = startNavi + navLimit -1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, navLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
}
