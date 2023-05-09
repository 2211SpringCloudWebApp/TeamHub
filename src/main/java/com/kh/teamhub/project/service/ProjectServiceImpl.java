package com.kh.teamhub.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.project.domain.Kanban;
import com.kh.teamhub.project.domain.PageInfo;
import com.kh.teamhub.project.domain.Project;
import com.kh.teamhub.project.store.ProjectStore;
import com.kh.teamhub.user.domain.Search;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectStore pStore;

	@Override
	public int insertProject(Project project) {
		int result = pStore.insertProject(project);
		return result;
	}

	@Override
	public int updateProject(Project project) {
		int result = pStore.updateProject(project);
		return result;
	}

	@Override
	public int deleteProject(Integer projectNo) {
		int result = pStore.deleteProject(projectNo);
		return result;
	}

	@Override
	public Project selectOneByNo(Integer projectNo) {
		Project project = pStore.selectOneByNo(projectNo);
		return project;
	}

	@Override
	public List<Project> selectAllProject(PageInfo pi, String status) {
		List<Project> pList = pStore.selectAllProject(pi, status);
		return pList;
	}

	@Override
	public int getListCount(String status) {
		int result = pStore.getListCount(status);
		return result;
	}

	@Override
	public List<Project> selectListByKeyword(PageInfo pi, Search search) {
		List<Project> sList = pStore.selectListByKeyword(pi, search);
		return sList;
	}

	@Override
	public int getListCount(Search search) {
		int result = pStore.getListCount(search);
		return result;
	}

	@Override
	public int insertKanban(Kanban kanban) {
		int result = pStore.insertKanban(kanban);
		return result;
	}

	@Override
	public int removeKanban(int kanbanNo) {
		int result = pStore.removeKanban(kanbanNo);
		return result;
	}

	@Override
	public List<Kanban> selectAllKanban(int projectNo) {
		List<Kanban> kList = pStore.selectAllKanban(projectNo);
		return kList;
	}

}
