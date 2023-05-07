package com.kh.teamhub.board.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.board.domain.Free;
import com.kh.teamhub.board.domain.FreeFile;
import com.kh.teamhub.board.domain.FreePlus;
import com.kh.teamhub.board.domain.Notice;
import com.kh.teamhub.board.domain.NoticePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Search;

@Repository
public class NoticeStoreLogic implements NoticeStore {

	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int insertNoticeFiles(SqlSession session, FreeFile freefile) {
		return session.insert("NoticeMapper.insertNoticeFiles", freefile);
	}

	
	@Override
	public List<NoticePlus> selectNoticeList(SqlSession session,Integer start) {
		int limit = 15;
		int offset = (start - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticePlus> nList = session.selectList("NoticeMapper.selectNoticeList", null, rowBounds);
		return nList;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("NoticeMapper.getListCount");
		return result;
	}

	@Override
	public Notice selectOneById(SqlSession session, int noticeNo) {
		session.update("NoticeMapper.updateView", noticeNo);
		Notice notice = session.selectOne("NoticeMapper.selectOneById", noticeNo);
		return notice;
	}

	@Override
	public List<FreeFile> selectFileList(SqlSession session, int noticeNo) {
		return session.selectList("NoticeMapper.selectFileList", noticeNo);
	}

	@Override
	public int updatenotice(SqlSession session, Notice notice) {
		int result = session.update("NoticeMapper.updateNotice", notice);
		return result;
	}

	@Override
	public int updateFreeFiles(SqlSession session, FreeFile freeFile) {
		int result = session.update("NoticeMapper.updateFreeFiles", freeFile);
		return result;
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		int result = session.selectOne("NoticeMapper.getsearchListCount", search);
		return result;
	}

	@Override
	public List<Notice> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int  offset = (currentPage -1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Notice> searchList = session.selectList("NoticeMapper.selectListByKeyword", search, rowBounds);
		return searchList;
	}

	@Override
	public int deleteNotice(SqlSession session, int noticeNo) {
		int result = session.delete("NoticeMapper.deleteNotice", noticeNo);
		return result;
	}

	@Override
	public Notice selectNotice(SqlSession session) {
		Notice noticeAlram = session.selectOne("NoticeMapper.selectNotice");
		System.out.println("노티스알람: " + noticeAlram);
		return noticeAlram;
	}

}
