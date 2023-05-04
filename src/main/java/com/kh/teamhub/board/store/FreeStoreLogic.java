package com.kh.teamhub.board.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.board.domain.Free;
import com.kh.teamhub.board.domain.FreeFile;
import com.kh.teamhub.board.domain.FreePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Reply;
import com.kh.teamhub.board.domain.Search;
@Repository
public class FreeStoreLogic implements FreeStore {

	@Override
	public int insertFree(SqlSession session, Free free) {
		int result = session.insert("FreeMapper.insertFree", free);
		return result;
	}

	@Override
	public int insertFreeFiles(SqlSession session, FreeFile freefile) {
		return session.insert("FreeMapper.insertFreeFiles", freefile);
	}

	@Override
	public List<FreePlus> selectFreeList(SqlSession session, Integer start) {
		int limit = 15;
		int offset = (start - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<FreePlus> fList = session.selectList("FreeMapper.selectFreeList", null, rowBounds);
		return fList;
	}

	@Override
	public Free selectOneById(SqlSession session, int freeNo) {
		session.update("FreeMapper.updateView", freeNo);
		Free free = session.selectOne("FreeMapper.selectOneById", freeNo);
		return free;
	}

	@Override
	public List<FreeFile> selectFileList(SqlSession session, int freeNo) {
		return session.selectList("FreeMapper.selectFileList", freeNo);
		
	}

	@Override
	public int deleteFree(SqlSession session, int freeNo) {
		int result = session.delete("FreeMapper.deleteFree", freeNo);
		int result2 = session.delete("FreeMapper.deleteReport", freeNo);
		return result;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("FreeMapper.getListCount");
		return result;
	}

	@Override
	public int updateFree(SqlSession session, Free free) {
		int result = session.update("FreeMapper.updateFree", free);
		return result;
	}

	@Override
	public int updateFreeFiles(SqlSession session, FreeFile freeFile) {
		int result = session.update("FreeMapper.updateFreeFiles", freeFile);
		return result;
	}
	
	@Override
	public List<Free> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int  offset = (currentPage -1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Free> searchList = session.selectList("FreeMapper.selectListByKeyword", search, rowBounds);
		return searchList;
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		int result = session.selectOne("FreeMapper.getsearchListCount", search);
		return result;
	}

	@Override
	public int insertReply(SqlSession session, Reply reply) {
		int result = session.insert("FreeMapper.insertReply", reply);
		return result;
	}

	@Override
	public List<Reply> selectAllReply(SqlSession session, Integer freeNo) {
		List<Reply> rList = session.selectList("FreeMapper.selectReplyList", freeNo);
		return rList;
	}

	@Override
	public int updateReply(SqlSession session, Reply reply) {
		int result = session.update("FreeMapper.updateReply", reply);
		return result;
	}

	@Override
	public int deleteReply(SqlSession session, Integer replyNo) {
		int result = session.update("FreeMapper.deleteReply", replyNo);
		return result;
	}

	@Override
	public int insertRereply(SqlSession session, Reply reply) {
		int result = session.insert("FreeMapper.insertRereply", reply);
		return result;
	}

	@Override
	public int limitUser(SqlSession session, String userId) {
		int result = session.update("FreeMapper.limitUser", userId);
		return result;
	}

	
	
	

	


}
