package com.kh.teamhub.project.service;

import java.util.List;

import com.kh.teamhub.project.domain.Kanban;
import com.kh.teamhub.project.domain.PageInfo;
import com.kh.teamhub.project.domain.Project;
import com.kh.teamhub.user.domain.Search;

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
	 * @param status 
	 * @return
	 */
	List<Project> selectAllProject(PageInfo pi, String status);
	
	/**
	 * 프로젝트 상태별 개수 Service 
	 * @param status 
	 * @return
	 */
	int getListCount(String status);

	/**
	 * 프로젝트 검색 Service
	 * @param pi
	 * @param search
	 * @return
	 */
	List<Project> selectListByKeyword(PageInfo pi, Search search);

	/**
	 * 프로젝트 검색 결과 개수 Service
	 * @param search
	 * @return
	 */
	int getListCount(Search search);

	/**
	 * 칸반보드 추가 Service
	 * @param kanban
	 * @return
	 */
	int insertKanban(Kanban kanban);

	/**
	 * 칸반보드 삭제 Service
	 * @param kanbanNo
	 * @return
	 */
	int removeKanban(int kanbanNo);

	/**
	 * 칸반보드 조회 Service
	 * @param projectNo
	 * @return
	 */
	List<Kanban> selectAllKanban(int projectNo);

}
