package com.kh.teamhub.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.board.domain.Free;
import com.kh.teamhub.board.domain.FreeFile;
import com.kh.teamhub.board.domain.FreePlus;
import com.kh.teamhub.board.domain.Notice;
import com.kh.teamhub.board.domain.NoticePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Search;
import com.kh.teamhub.board.store.FreeStore;
import com.kh.teamhub.board.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeStore nStore;
	@Autowired
	private SqlSession session;
	
	
	@Override
	public int insertNotice(Notice notice) {
		return nStore.insertNotice(session, notice);
		
	}
	@Override
	public int insertNoticeFiles(FreeFile freefile) {
		return nStore.insertNoticeFiles(session, freefile);
		
	}
	@Override
	public List<NoticePlus> selectNoticeList(Integer start) {
		List<NoticePlus> nList = nStore.selectNoticeList(session, start);
		return nList;
	}
	@Override
	public int getListCount() {
		int result = nStore.getListCount(session);
		return result;
	}
	@Override
	public Notice selectOneById(Integer noticeNo) {
		Notice notice = nStore.selectOneById(session, noticeNo);
		return notice;
	}
	@Override
	public List<FreeFile> selectFileList(Integer noticeNo) {
		List<FreeFile> freeFile = nStore.selectFileList(session, noticeNo);
		return freeFile;
	}
	@Override
	public int updatenotice(Notice notice) {
		return nStore.updatenotice(session, notice);
	}
	@Override
	public int updateFreeFiles(FreeFile freeFile) {
		return nStore.updateFreeFiles(session, freeFile);
	}
	@Override
	public int getListCount(Search search) {
		int result = nStore.getListCount(session, search);
		return result;
	}
	@Override
	public List<Notice> selectListByKeyword(PageInfo pi, Search search) {
		List<Notice> searchList = nStore.selectListByKeyword(session, pi, search);
		return searchList;
	}
	@Override
	public int deleteNotice(int noticeNo) {
		int result = nStore.deleteNotice(session, noticeNo);
		return result;
	}
	@Override
	public Notice selectNotice() {
		// TODO Auto-generated method stub
		Notice noticeAlram = nStore.selectNotice(session);
		return noticeAlram;
	}
}
