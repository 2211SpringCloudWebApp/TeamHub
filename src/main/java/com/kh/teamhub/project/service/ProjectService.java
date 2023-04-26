package com.kh.teamhub.project.service;

import java.util.List;

import com.kh.teamhub.project.domain.PageInfo;
import com.kh.teamhub.project.domain.Project;

public interface ProjectService {

	/**
	 * 프로젝트 생성 Service
	 * @param project
	 * @return 
	 */
	int insertProject(Project project);

	/**
	 * 프로젝트 수정 Service
	 * @param projectNo
	 * @return
	 */
	int updateProject(Project project);

	/**
	 * 프로젝트 삭제 Service
	 * @param projectNo
	 * @return
	 */
	int deleteProject(Integer projectNo);

	/**
	 * 프로젝트 상세 보기 Service
	 * @param projectNo
	 * @return
	 */
	Project selectOneByNo(Integer projectNo);

	/**
	 * 프로젝트 목록 조회 Service
	 * @return
	 */
	List<Project> selectAllProject(PageInfo pi);
	
	/**
	 * 
	 * @return
	 */
	int getListCount();

}
