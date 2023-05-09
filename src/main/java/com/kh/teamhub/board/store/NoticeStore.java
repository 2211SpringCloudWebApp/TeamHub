package com.kh.teamhub.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.teamhub.board.domain.FreeFile;
import com.kh.teamhub.board.domain.Notice;
import com.kh.teamhub.board.domain.NoticePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Search;

public interface NoticeStore {
	
	/**
	 * 공지 사항 등록
	 * @param session
	 * @param notice
	 * @return
	 */
	int insertNotice(SqlSession session, Notice notice);
	/**
	 * 공지 사항 파일 등록 
	 * @param session
	 * @param freefile
	 * @return
	 */
	int insertNoticeFiles(SqlSession session, FreeFile freefile);
	
	/**
	 * 자유게시판 목록 조회 Service
	 * @return List<Free>
	 */
	List<NoticePlus> selectNoticeList(SqlSession session, Integer start);
	
	/**
	 * 게시물 갯수
	 * @param session
	 * @return
	 */
	int getListCount(SqlSession session);
	
	/**
	 * 공지사항 상세 조회 Store
	 * @param session
	 * @param noticeNo
	 * @return
	 */
	Notice selectOneById(SqlSession session, int noticeNo);
	
	/**
	 * 공지사항 파일 상세 조회 Store
	 * @return List<Free>
	 */
	
	List<FreeFile> selectFileList(SqlSession session, int noticeNo);
	/**
	 * 공지사항 수정
	 * @param session
	 * @param free
	 * @return int
	 */
	public int updatenotice(SqlSession session, Notice notice);
	/**
	 * 공지사항 파일 수정
	 * @param session
	 * @param free
	 * @return int
	 */
	public int updateFreeFiles(SqlSession session, FreeFile freeFile);
	/**
	 * 공지사항 검색 갯수
	 * @param session
	 * @param search
	 * @return
	 */
	int getListCount(SqlSession session, Search search);
	/**
	 * 공지사항 검색
	 * @param session
	 * @param pi
	 * @param search
	 * @return
	 */
	List<Notice> selectListByKeyword(SqlSession session, PageInfo pi, Search search);
	
	/**
	 * 공지사항 삭제
	 * @param session
	 * @param noticeNo
	 * @return
	 */
	int deleteNotice(SqlSession session, int noticeNo);
	Notice selectNotice(SqlSession session);
	List<Notice> selectList(SqlSession session);
	

}
