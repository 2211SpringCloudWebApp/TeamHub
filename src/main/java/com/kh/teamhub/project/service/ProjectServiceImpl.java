package com.kh.teamhub.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.project.domain.PageInfo;
import com.kh.teamhub.project.domain.Project;
import com.kh.teamhub.project.store.ProjectStore;

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
	public List<Project> selectAllProject(PageInfo pi) {
		List<Project> pList = pStore.selectAllProject(pi);
		return pList;
	}

	@Override
	public int getListCount() {
		int result = pStore.getListCount();
		return result;
	}

}
