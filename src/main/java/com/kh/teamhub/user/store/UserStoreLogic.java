package com.kh.teamhub.user.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.user.domain.User;

@Repository
public class UserStoreLogic implements UserStore{

	@Autowired
	private SqlSession session;

	@Override
	public User login(User user) {
		User loginUser = session.selectOne("UserMapper.login",user);
		return loginUser;
	}

	
}
