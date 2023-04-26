package com.kh.teamhub.project.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.project.domain.PageInfo;
import com.kh.teamhub.project.domain.Project;

@Repository
public class ProjectStoreLogic implements ProjectStore {
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertProject(Project project) {
		int result = session.insert("ProjectMapper.insertProject", project);
		return result;
	}

	@Override
	public int updateProject(Project project) {
		int result = session.update("ProjectMapper.updateProject", project);
		return result;
	}

	@Override
	public int deleteProject(Integer projectNo) {
		int result = session.delete("ProjectMapper.deleteProject", projectNo);
		return result;
	}

	@Override
	public Project selectOneByNo(Integer projectNo) {
		Project project = session.selectOne("ProjectMapper.selectOneByNo", projectNo);
		return project;
	}

	@Override
	public List<Project> selectAllProject(PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Project> pList = session.selectList("ProjectMapper.selectAllProject", null, rowBounds);
		return pList;
	}

	@Override
	public int getListCount() {
		int result = session.selectOne("ProjectMapper.getListCount");
		return result;
	}

}
