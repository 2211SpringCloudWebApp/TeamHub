package com.kh.teamhub.user.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.teamhub.common.LoginUtil;
import com.kh.teamhub.common.PageInfo;
import com.kh.teamhub.common.file.FileUtil;
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
	
	// 로그인 화면
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "main/login";
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
			if(loginUtil.checkLogin(request)) {    
				return "main/login";	 // 비로그인시 로그인 페이지로 이동.
			}
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
			User userOne = (User)session.getAttribute("user");
			String userId = userOne.getUserId();
			User user = uService.selectOneById(userId);
			model.addAttribute("user", user);
			return "user/mypage";
	}
	
	// 회원 정보 수정
		@RequestMapping(value="/modifyMypage", method = {RequestMethod.POST, RequestMethod.GET})
		public String modifyMypage(Model model, @ModelAttribute User user) {
			try {
				int result = uService.updateUserInfo(user);
				if(result > 0) {
					return "redirect:/user/list";
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
			fileInfo = fileUtil.saveFile(multi, request);
			user.setUserFileName(fileInfo.get("rename"));
			user.setUserfilePath(fileInfo.get("renameFilePath"));
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
	@RequestMapping(value="/checkId", method = RequestMethod.POST, produces="application/json;charset=utf-8")
	public int checkId(@RequestParam("userId") String userId) {
		int result = uService.checkId(userId);
		return result;
	}
	
	// 사원 정보 수정
	@RequestMapping(value="/modify", method = {RequestMethod.POST, RequestMethod.GET})
	public String modifyUser(Model model, @ModelAttribute User user) {
		try {
			int result = uService.updateUser(user);
			if(result > 0) {
				return "redirect:/user/list";
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
	
	// 사원 목록 조회(재직상태)
	@RequestMapping(value="/userState", method = RequestMethod.GET)
	public String selectUserState(HttpSession session
			, Model model
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		int totalCount = uService.getListCount();
		PageInfo pi = this.getPageInfo(page, totalCount);
		List<User> stateList = uService.selectUserState(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("stateList", stateList);
		return "user/listAdmin";
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
	
	// 페이징
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int navLimit = 10;
		int maxPage;
		int startNav;
		int endNav;
		
		maxPage = (int)Math.ceil((double) totalCount / boardLimit);
		startNav = (((int)((double)currentPage / navLimit + 0.9)) -1 ) * navLimit +1;
		endNav = startNav + navLimit -1;
		if(endNav > maxPage) {
			endNav = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, totalCount, navLimit, startNav, endNav, maxPage);
		return pi;
	}
}
