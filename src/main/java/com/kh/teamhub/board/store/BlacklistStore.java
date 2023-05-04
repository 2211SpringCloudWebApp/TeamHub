package com.kh.teamhub.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.teamhub.user.domain.User;

public interface BlacklistStore {

	int getListCount(SqlSession session);

	List<User> selectBlackList(SqlSession session, Integer start);

	int deleteBlacklist(SqlSession session, String [] userId);

}
