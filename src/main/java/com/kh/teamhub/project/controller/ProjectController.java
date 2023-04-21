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
import org.springframework.web.servlet.ModelAndView;

import com.kh.teamhub.project.domain.Project;
import com.kh.teamhub.project.service.ProjectService;
import com.kh.teamhub.user.domain.User;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
//	@RequestMapping(value="/project/create", method=RequestMethod.GET)
//	public ModelAndView showCreateProject(ModelAndView mv) {		
//		mv.setViewName("/project/create");
//		return mv;
//	}
	
	@RequestMapping(value="/project/create", method=RequestMethod.POST)
	public ModelAndView createProject(ModelAndView mv
			, HttpServletRequest request
			, @ModelAttribute Project project
			, @RequestParam("projectStart") String projectStart
			, @RequestParam("projectEnd") String projectEnd) {
		try {
			HttpSession session = request.getSession();
			String userId = ((User)session.getAttribute("user")).getUserId();
			project.setUserId(userId);
			project.setProjectStart(Date.valueOf(projectStart));
			project.setProjectEnd(Date.valueOf(projectEnd));
			int result = pService.insertProject(project);
			if(result > 0) {
				mv.setViewName("redirect:/project/main");
			} else {
				mv.addObject("msg", "프로젝트 생성 실패").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	@RequestMapping(value="/project/modify", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/project/delete/{projectNo}", method=RequestMethod.GET)
	public ModelAndView removeProject(ModelAndView mv, @PathVariable Integer projectNo) {
		try {
			int result = pService.deleteProject(projectNo);
			if(result > 0) {
				mv.setViewName("redirect:/project/main");
			}else {
				mv.addObject("msg", "프로젝트 삭제 실패").setViewName("common/error");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	@RequestMapping(value="/project/detail/{projectNo}", method=RequestMethod.GET)
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
	
	@RequestMapping(value="/project/main", method=RequestMethod.GET)
	public ModelAndView printAllProject(ModelAndView mv) {
		try {
			List<Project> pList = pService.selectAllProject();
			mv.addObject("pList", pList).setViewName("/project/main");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}	
		return mv;
	}
	
}
