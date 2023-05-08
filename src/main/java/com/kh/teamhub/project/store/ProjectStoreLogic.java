package com.kh.teamhub.project.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.project.domain.Kanban;
import com.kh.teamhub.project.domain.PageInfo;
import com.kh.teamhub.project.domain.Project;
import com.kh.teamhub.user.domain.Search;

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
	public List<Project> selectAllProject(PageInfo pi, String status) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Project> pList = session.selectList("ProjectMapper.selectAllProject", status, rowBounds);
		return pList;
	}

	@Override
	public int getListCount(String status) {
		int result = session.selectOne("ProjectMapper.getListCount", status);
		return result;
	}

	@Override
	public List<Project> selectListByKeyword(PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Project> sList = session.selectList("ProjectMapper.selectListByKeyword", search, rowBounds);
		return sList;
	}

	@Override
	public int getListCount(Search search) {
		int result = session.selectOne("ProjectMapper.getSearchListCount", search);
		return result;
	}

	@Override
	public int insertKanban(Kanban kanban) {
		int result = session.insert("ProjectMapper.insertKanban", kanban);
		return result;
	}

	@Override
	public List<Kanban> selectAllKanban(int kanbanNo) {
		List<Kanban> kList = session.selectList("ProjectMapper.selectAllKanban", kanbanNo);
		return kList;
	}

	@Override
	public int removeKanban(int kanbanNo) {
		int result = session.delete("ProjectMapper.deleteKanban", kanbanNo);
		return result;
	}

}
