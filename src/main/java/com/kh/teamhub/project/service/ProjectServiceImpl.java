package com.kh.teamhub.project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.project.domain.Project;
import com.kh.teamhub.project.store.ProjectStore;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectStore pStore;
	@Autowired
	private SqlSession session;

	@Override
	public int insertProject(Project project) {
		int result = pStore.insertProject(session, project);
		return result;
	}

	@Override
	public int updateProject(Project project) {
		int result = pStore.updateProject(session, project);
		return result;
	}

	@Override
	public int deleteProject(Integer projectNo) {
		int result = pStore.deleteProject(session, projectNo);
		return result;
	}

	@Override
	public Project selectOneByNo(Integer projectNo) {
		Project project = pStore.selectOneByNo(session, projectNo);
		return project;
	}

	@Override
	public List<Project> selectAllProject() {
		List<Project> pList = pStore.selectAllProject(session);
		return pList;
	}

}
