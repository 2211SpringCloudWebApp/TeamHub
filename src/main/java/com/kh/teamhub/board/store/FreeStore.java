package com.kh.teamhub.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.teamhub.board.domain.Free;

public interface FreeStore {

	/**
	 * 공지사항 등록 Store
	 * @param session
	 * @param free
	 * @return int
	 */
	public int insertFree(SqlSession session, Free free);

	/**
	 * 공지사항 목록 조회 Store
	 * @return List<Free>
	 */
	public List<Free> selectFreeList(SqlSession session);
	
	
}
