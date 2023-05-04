package com.kh.teamhub.board.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.kh.teamhub.user.domain.User;

@Repository
public class BlacklistStoreLogic implements BlacklistStore{


	@Override
	public List<User> selectBlackList(SqlSession session, Integer start) {
		int limit = 15;
		int offset = (start - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> bList = session.selectList("BlacklistMapper.selectBlackList", null, rowBounds);
		return bList;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("BlacklistMapper.getListCount");
		return result;
	}

	@Override
	public int deleteBlacklist(SqlSession session, String [] userId) {
		Map<String, Object> blacklistMap = new HashMap<String, Object>();
		blacklistMap.put("blackIds", userId);
		int result = session.update("BlacklistMapper.updateBlacklist", blacklistMap);
		return result;
	}

	
}
