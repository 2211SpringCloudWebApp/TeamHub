package com.kh.teamhub.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.board.domain.Report;
import com.kh.teamhub.board.store.BlacklistStore;
import com.kh.teamhub.board.store.FreeStore;
import com.kh.teamhub.user.domain.User;

@Service
public class BlacklistServiceImpl implements BlacklistService{
	
	@Autowired
	private BlacklistStore bStore;
	@Autowired
	private SqlSession session;
	
	
	
	@Override
	public int getListCount() {
		int result = bStore.getListCount(session);
		return result;
	}

	@Override
	public List<User> selectBlackList(Integer start) {
		List<User> bList = bStore.selectBlackList(session, start);
		return bList;
	}

	@Override
	public int deleteBlacklist(String [] userId) {
		int result = bStore.deleteBlacklist(session, userId);
		return result;
	}

}
