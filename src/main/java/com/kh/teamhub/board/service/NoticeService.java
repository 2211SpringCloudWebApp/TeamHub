package com.kh.teamhub.board.service;

import java.util.List;

import com.kh.teamhub.board.domain.FreeFile;
import com.kh.teamhub.board.domain.Notice;
import com.kh.teamhub.board.domain.NoticePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Search;

public interface NoticeService {
	
	/**
	 * 공지사항 등록
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);
	
	/**
	 * 파일 등록
	 * @param freefile
	 * @return
	 */
	int insertNoticeFiles(FreeFile freefile);
	
	/**
	 * 검색?
	 * @param page
	 * @return
	 */
	List<NoticePlus> selectNoticeList(Integer page);
	
	/**
	 * 게시판 천체 갯수 
	 * @return
	 */
	int getListCount();
	
	/**
	 * 공지 사항 상세 조회
	 * @param noticeNo
	 * @return
	 */
	Notice selectOneById(Integer noticeNo);
	
	/**
	 * 파일
	 * @param noticeNo
	 * @return
	 */
	List<FreeFile> selectFileList(Integer noticeNo);
	
	/**
	 * 수정
	 * @param notice
	 * @return
	 */
	int updatenotice(Notice notice);
	
	/**
	 * 파일 수정
	 * @param freeFile
	 * @return
	 */
	int updateFreeFiles(FreeFile freeFile);
	
	/**
	 * 공지사항 검색 갯수
	 * @param search
	 * @return
	 */
	int getListCount(Search search);
	
	/**
	 * 공지사항 검색
	 * @param pi
	 * @param search
	 * @return
	 */
	List<Notice> selectListByKeyword(PageInfo pi, Search search);
	
	/**
	 * 삭제
	 * @param noticeNo
	 * @return
	 */
	int deleteNotice(int noticeNo);

	Notice selectNotice();

	// 상은 홈화면 리스트
	List<Notice> selectList();
	

}
