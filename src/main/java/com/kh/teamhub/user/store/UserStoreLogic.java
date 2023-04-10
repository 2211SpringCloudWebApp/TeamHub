package com.kh.teamhub.user.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserStoreLogic implements UserStore{

	@Autowired
	private SqlSession session;

	
}
