package com.kh.teamhub.project.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.project.domain.Project;

@Repository
public class ProjectStoreLogic implements ProjectStore {

	@Override
	public int insertProject(SqlSession session, Project project) {
		int result = session.insert("ProjectMapper.insertProject", project);
		return result;
	}

	@Override
	public int updateProject(SqlSession session, Project project) {
		int result = session.update("ProjectMapper.updateProject", project);
		return result;
	}

	@Override
	public int deleteProject(SqlSession session, Integer projectNo) {
		int result = session.delete("ProjectMapper.deleteProject", projectNo);
		return result;
	}

	@Override
	public Project selectOneByNo(SqlSession session, Integer projectNo) {
		Project project = session.selectOne("ProjectMapper.selectOneByNo", projectNo);
		return project;
	}

	@Override
	public List<Project> selectAllProject(SqlSession session) {
		List<Project> pList = session.selectList("ProjectMapper.selectAllProject");
		return pList;
	}

}
