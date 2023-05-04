package com.kh.teamhub.project.store;

import java.util.List;

import com.kh.teamhub.project.domain.Kanban;
import com.kh.teamhub.project.domain.PageInfo;
import com.kh.teamhub.project.domain.Project;
import com.kh.teamhub.user.domain.Search;

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
	 * @param status 
	 * @param session
	 * @return
	 */
	List<Project> selectAllProject(PageInfo pi, String status);

	/**
	 * 프로젝트 상태별 개수 Store
	 * @param status 
	 * @return
	 */
	int getListCount(String status);

	/**
	 * 프로젝트 검색 Store
	 * @param pi
	 * @param search
	 * @return
	 */
	List<Project> selectListByKeyword(PageInfo pi, Search search);

	/**
	 * 프로젝트 검색 결과 개수 Store
	 * @param search
	 * @return
	 */
	int getListCount(Search search);

	/**
	 * 칸반보드 추가 Store
	 * @param kanban
	 * @return
	 */
	int insertKanban(Kanban kanban);

	/**
	 * 칸반보드 조회 Store
	 * @param projectNo
	 * @return
	 */
	List<Kanban> selectAllKanban(int kanbanNo);

}
