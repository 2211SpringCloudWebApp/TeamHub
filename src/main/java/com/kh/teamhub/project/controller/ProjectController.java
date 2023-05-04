package com.kh.teamhub.project.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.teamhub.project.domain.Kanban;
import com.kh.teamhub.project.domain.PageInfo;
import com.kh.teamhub.project.domain.Project;
import com.kh.teamhub.project.service.ProjectService;
import com.kh.teamhub.user.domain.Search;
import com.kh.teamhub.user.domain.User;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	// 프로젝트 생성
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public ModelAndView createProject(ModelAndView mv
			, HttpServletRequest request
			, @ModelAttribute Project project
			, @RequestParam(value="projectStart") String projectStart
			, @RequestParam(value="projectEnd") String projectEnd) {
		try {
			HttpSession session = request.getSession();
			String userId = ((User)session.getAttribute("user")).getUserId();
			project.setUserId(userId);
			project.setProjectStart(Date.valueOf(projectStart));
			project.setProjectEnd(Date.valueOf(projectEnd));
			int result = pService.insertProject(project);
			if(result > 0) {
				mv.setViewName("redirect:/project/list?status=all");
			} else {
				mv.addObject("msg", "프로젝트 생성 실패").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "프로젝트 생성 실패").setViewName("common/error");
//			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 프로젝트 수정
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ModelAndView modifyProject(ModelAndView mv, @ModelAttribute Project project) {
		try {
			int result = pService.updateProject(project);
			if(result > 0) {
				mv.setViewName("redirect:/project/detail/"+project.getProjectNo());
			}else {
				mv.addObject("msg", "프로젝트 수정 실패").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// 프로젝트 삭제
	@RequestMapping(value="/delete/{projectNo}", method=RequestMethod.GET)
	public ModelAndView removeProject(ModelAndView mv, @PathVariable Integer projectNo) {
		try {
			int result = pService.deleteProject(projectNo);
			if(result > 0) {
				mv.setViewName("redirect:/project/list");
			}else {
				mv.addObject("msg", "프로젝트 삭제 실패").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 프로젝트 상세 조회
	@RequestMapping(value="/detail/{projectNo}", method=RequestMethod.GET)
	public ModelAndView printOneByNo(ModelAndView mv, @PathVariable Integer projectNo) {
		try {
			Project project = pService.selectOneByNo(projectNo);
			mv.addObject("project", project).setViewName("/project/detail");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;	
	}
	
	// 프로젝트 목록 조회
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView printAllProject(ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page
			, @RequestParam(value="status", required=false, defaultValue="all") String status) {
		try {
			int allTotalCnt = pService.getListCount(status);
			PageInfo allPi = this.getPageInfo(page, allTotalCnt);
			List<Project> pList = pService.selectAllProject(allPi, status);
			mv.addObject("pi", allPi).addObject("status", status);
			mv.addObject("pList", pList).setViewName("/project/list");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}	
		return mv;
	}
	
	// 프로젝트 검색
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ModelAndView searchProject(ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page
			, @ModelAttribute Search search) {
		try {
			int totalCount = pService.getListCount(search);
			PageInfo pi = this.getPageInfo(page, totalCount);
			List<Project> sList = pService.selectListByKeyword(pi, search);
			if(!sList.isEmpty()) {
				mv.setViewName("/project/search");
				mv.addObject("search", search).addObject("pi", pi).addObject("sList", sList);
			} else {
				mv.setViewName("common/error");
				mv.addObject("msg", "검색 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}	
		return mv;
	}
	
	// 페이징
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int navLimit = 5;
		int maxPage;
		int startNav;
		int endNav;

		maxPage = (int) Math.ceil((double) totalCount / boardLimit);
		startNav = (((int) ((double) currentPage / navLimit + 0.9)) - 1) * navLimit + 1;
		endNav = startNav + navLimit - 1;
		if (endNav > maxPage) {
			endNav = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, navLimit, startNav, endNav, totalCount, maxPage);
		return pi;
	}
	
	// 칸반보드 추가
	@ResponseBody
	@RequestMapping(value="/addKanban", method=RequestMethod.POST)
	public String addKanban(@ModelAttribute Kanban kanban) {
		int result = pService.insertKanban(kanban);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 칸반보드 수정
	@ResponseBody
	@RequestMapping(value="/editKanban", method=RequestMethod.POST)
	public String editKanban() {
		return null;
	}
	
	// 칸반보드 삭제
	@ResponseBody
	@RequestMapping(value="/deleteKanban", method=RequestMethod.GET)
	public String deleteKanban() {
		return null;
	}
	
	// 칸반보드 조회
	@ResponseBody
	@RequestMapping(value="/showKanban", method=RequestMethod.GET)
	public String showKanban(@RequestParam("projectNo") int projectNo) {
		List<Kanban> kList = pService.selectAllKanban(projectNo);
		if(!kList.isEmpty()) {
			Gson gson = new Gson();
			return gson.toJson(kList);
		}
		return "";
	}
	
}
