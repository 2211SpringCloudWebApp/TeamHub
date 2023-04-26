package com.kh.teamhub.project.store;

import java.util.List;

import com.kh.teamhub.project.domain.PageInfo;
import com.kh.teamhub.project.domain.Project;

public interface ProjectStore {

	/**
	 * 프로젝트 생성 Store
	 * @param session
	 * @param project
	 * @return 
	 */
	int insertProject(Project project);

	/**
	 * 프로젝트 수정 Store
	 * @param session
	 * @param projectNo
	 * @return
	 */
	int updateProject(Project project);

	/**
	 * 프로젝트 삭제 Store
	 * @param session
	 * @param projectNo
	 * @return
	 */
	int deleteProject(Integer projectNo);

	/**
	 * 프로젝트 상세 보기 Store
	 * @param session
	 * @param projectNo
	 * @return
	 */
	Project selectOneByNo(Integer projectNo);

	/**
	 * 프로젝트 목록 조회 Store
	 * @param session
	 * @return
	 */
	List<Project> selectAllProject(PageInfo pi);

	/**
	 * 
	 * @return
	 */
	int getListCount();

}
