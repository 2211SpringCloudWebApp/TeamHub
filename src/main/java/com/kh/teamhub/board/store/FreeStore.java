package com.kh.teamhub.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.teamhub.board.domain.Free;
import com.kh.teamhub.board.domain.FreeFile;
import com.kh.teamhub.board.domain.FreePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Reply;
import com.kh.teamhub.board.domain.Search;

public interface FreeStore {

	/**
	 * 자유게시판 등록 Store
	 * @param session
	 * @param free
	 * @return int
	 */
	public int insertFree(SqlSession session, Free free);
	
	/**
	 * 자유게시판 파일 등록 Store
	 * @param session
	 * @param free
	 * @return int
	 */
	
	public int insertFreeFiles(SqlSession session, FreeFile freefile);
	
	/**
	 * 자유게시판 목록 조회 Store
	 * @return List<Free>
	 */
	List<FreePlus> selectFreeList(SqlSession session, Integer start);
	
	/**
	 * 자유게시판 상세 조회 Store
	 * @return List<Free>
	 */

	public Free selectOneById(SqlSession session, int freeNo);
	/**
	 * 자유게시판 파일 상세 조회 Store
	 * @return List<Free>
	 */

	public List<FreeFile> selectFileList(SqlSession session, int freeNo);
	/**
	 * 자유게시판 삭제 
	 * @param session
	 * @param freeNo
	 * @return
	 */
	public int deleteFree(SqlSession session, int freeNo);
	
	/**
	 * 자유게시판 전체 게시물 갯수 store
	 * @param session
	 * @return int
	 */
	public int getListCount(SqlSession session);
	
	/**
	 * 자유게시판 수정
	 * @param session
	 * @param free
	 * @return int
	 */
	public int updateFree(SqlSession session, Free free);
	
	/**
	 * 자유게시판 파일 수정
	 * @param session
	 * @param free
	 * @return int
	 */
	public int updateFreeFiles(SqlSession session, FreeFile freeFile);
	
	/**
	 * 자유게시판 검색 Store
	 * @param keyword
	 * @return
	 */

	public List<Free> selectListByKeyword(SqlSession session, PageInfo pi, Search search);

	/**
	 * 자유게시판 검색 갯수 Store
	 * @param keyword
	 * @return
	 */
	public int getListCount(SqlSession session, Search search);
	
	/**
	 * 자유게시판 댓글 달기
	 * @param reply
	 * @return
	 */
	public int insertReply(SqlSession session,Reply reply);

	/**
	 * 자유게시판 댓글 리스트
	 * @param session
	 * @param freeNo
	 * @return
	 */
	public List<Reply> selectAllReply(SqlSession session, Integer freeNo);

	
	
	


	
	
}
