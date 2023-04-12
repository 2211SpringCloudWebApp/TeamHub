package com.kh.teamhub.board.service;

import java.util.List;

import com.kh.teamhub.board.domain.Free;

public interface FreeService {

	/**
	 * 공지사항 등록 Service
	 * @param free
	 * @return int
	 */
	public int insertFree(Free free);

	/**
	 * 공지사항 목록 조회 Service
	 * @return List<Free>
	 */
	public List<Free> selectFreeList();
}
