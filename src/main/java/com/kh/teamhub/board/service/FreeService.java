package com.kh.teamhub.board.service;

import java.util.List;

import com.kh.teamhub.board.domain.Free;
import com.kh.teamhub.board.domain.FreeFile;
import com.kh.teamhub.board.domain.FreePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Reply;
import com.kh.teamhub.board.domain.Search;

public interface FreeService {

	/**
	 * 자유 게시판 등록 Service
	 * @param free
	 * @return int
	 */
	public int insertFree(Free free);
	
	/**
	 * 자유게시판 파일 TBL 등록 Service
	 * @param free
	 * @return int
	 */
	public int insertFreeFiles(FreeFile freefile);

	/**
	 * 자유게시판 목록 조회 Service
	 * @return List<Free>
	 */
	public List<FreePlus> selectFreeList(Integer start);

	/**
	 * 자유게시판 상세 조회 
	 * @param freeNo
	 * @return
	 */
	public Free selectOneById(int freeNo);

	
	public List<FreeFile> selectFileList(int freeNo);
	/**
	 * 자유게시판 삭제
	 * @param freeNo
	 * @return
	 */
	public int deleteFree(int freeNo);
	/**
	 * 자유게시판 전체 갯수 service, 최대값/최소값
	 * @return int
	 */
	public int getListCount();
	/**
	 * 자유게시판 수정 Service
	 * @param free
	 * @return
	 */
	public int updateFree(Free free);
	
	/**
	 * 자유게시판 파일 수정 Service
	 * @param free
	 * @return
	 */
	public int updateFreeFiles(FreeFile freeFile);

	/**
	 * 자유게시판 검색 Service
	 * @param keyword
	 * @return
	 */
	public List<Free> selectListByKeyword(PageInfo pi, Search search);
	/**
	 * 자유게시판 검색 갯수 Service
	 * @param keyword
	 * @return
	 */
	public int getListCount(Search search);
	
	/**
	 * 자유게시판 댓글 등록
	 * @param reply
	 * @return
	 */
	
	public int insertReply(Reply reply);

	/**
	 * 댓글 리스트 작성
	 * @param freeNo
	 * @return
	 */
	public List<Reply> selectAllReply(Integer freeNo);
	
	/**
	 * 댓글 수정
	 * @param reply
	 * @return
	 */
	public int updateReply(Reply reply);

	/**
	 * 댓글 삭제
	 * @param replyNo
	 * @return
	 */
	public int deleteReply(Integer replyNo);

	/**
	 * 대댓글
	 * @param reply
	 * @return
	 */
	public int insertRereply(Reply reply);

	/**
	 * 사용자 게시판 작성 권한
	 * @param userId
	 * @return
	 */
	public int limitUser(String userId);



	
}
