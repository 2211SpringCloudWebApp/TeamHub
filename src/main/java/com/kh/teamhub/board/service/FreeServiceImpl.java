
package com.kh.teamhub.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.board.domain.Free;
import com.kh.teamhub.board.domain.FreeFile;
import com.kh.teamhub.board.domain.FreePlus;
import com.kh.teamhub.board.domain.PageInfo;
import com.kh.teamhub.board.domain.Reply;
import com.kh.teamhub.board.domain.Search;
import com.kh.teamhub.board.store.FreeStore;
@Service
public class FreeServiceImpl implements FreeService{
	@Autowired
	private FreeStore fStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertFree(Free free) {
		return fStore.insertFree(session, free);
	}

	@Override
	public int insertFreeFiles(FreeFile freefile) {
		return fStore.insertFreeFiles(session, freefile);
	}

	@Override
	public List<FreePlus> selectFreeList(Integer start) {
		List<FreePlus> fList = fStore.selectFreeList(session, start);
		return fList;
	}

	@Override
	public Free selectOneById(int freeNo) {
		Free free = fStore.selectOneById(session, freeNo);
		return free;
	}

	@Override
	public List<FreeFile> selectFileList(int freeNo) {
		List<FreeFile> freeFile = fStore.selectFileList(session, freeNo);
		 return freeFile;
	}

	@Override
	public int deleteFree(int freeNo) {
		int result = fStore.deleteFree(session, freeNo);
		return result;
	}


	@Override
	public int updateFree(Free free) {
		return fStore.updateFree(session, free);
	}

	@Override
	public int updateFreeFiles(FreeFile freeFile) {
		return fStore.updateFreeFiles(session, freeFile);
		
	}

	@Override
	public List<Free> selectListByKeyword(PageInfo pi, Search search) {
		List<Free> searchList = fStore.selectListByKeyword(session, pi, search);
		return searchList;
	}

	@Override
	public int getListCount() {
		int result = fStore.getListCount(session);
		return result;
	}
	
	@Override
	public int getListCount(Search search) {
		int result = fStore.getListCount(session, search);
		return result;
	}

	@Override
	public int insertReply(Reply reply) {
		int result = fStore.insertReply(session, reply);
		return result;
	}

	@Override
	public List<Reply> selectAllReply(Integer freeNo) {
		List<Reply> rList = fStore.selectAllReply(session, freeNo);
		return rList;
	}



}
