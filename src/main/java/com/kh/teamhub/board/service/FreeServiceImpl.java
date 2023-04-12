
package com.kh.teamhub.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.board.domain.Free;
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
	public List<Free> selectFreeList() {
		List<Free> fList = fStore.selectFreeList(session);
		return fList;
	}
	
}
