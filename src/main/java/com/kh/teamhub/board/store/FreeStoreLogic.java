package com.kh.teamhub.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.board.domain.Free;
@Repository
public class FreeStoreLogic implements FreeStore {

	@Override
	public int insertFree(SqlSession session, Free free) {
		int result = session.insert("FreeMapper.insertFree", free);
		return result;
	}

	@Override
	public List<Free> selectFreeList(SqlSession session) {
		List<Free> fList = session.selectList("FreeMapper.selectFreeList");
		return fList;
	}

}
