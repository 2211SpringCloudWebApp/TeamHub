package com.kh.teamhub.user.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.common.PageInfo;
import com.kh.teamhub.user.domain.Search;
import com.kh.teamhub.user.domain.User;

@Repository
public class UserStoreLogic implements UserStore{

	@Autowired
	private SqlSession session;

	@Override
	public int registerUser(User user) {
		int result = session.insert("UserMapper.registerUser", user);
		return result;
	}

	@Override
	public int checkId(String userId) {
		int result = session.selectOne("UserMapper.checkId", userId);
		return result;
	}

	@Override
	public int updateUserInfo(User user) {
		int result = session.update("UserMapper.updateUserInfo", user);
		return result;
	}

	@Override
	public int updateUser(User user) {
		int result = session.update("UserMapper.updateUser", user);
		return result;
	}

	@Override
	public int deleteUser(String userId) {
		int result = session.delete("UserMapper.deleteUser", userId);
		return result;
	}

	@Override
	public User login(User user) {
		User loginUser = session.selectOne("UserMapper.login",user);
		return loginUser;
	}

	@Override
	public List<User> selectAllUser(PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> uList = session.selectList("UserMapper.selectUserList", null, rowBounds);
		return uList;
	}

	@Override
	public User selectOneById(String userId) {
		User user = session.selectOne("UserMapper.selecOndById", userId);
		return user;
	}

	@Override
	public List<User> selectUserState() {
		List<User> userStateList = session.selectList("UserMapper.selectUserStateList");
		return userStateList;
	}

	@Override
	public List<User> selectListByKeyword(Search search) {
		List<User> userStateList = session.selectList("UserMapper.selectListByKeyword", search);
		return userStateList;
	}

	@Override
	public List<User> selectListByKeyword(PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> searchList = session.selectList("UserMapper.selectListByKeyword", search, rowBounds);
		return searchList;
	}

	@Override
	public int getListCount(Search search) {
		int result = session.selectOne("UserMapper.getSearchListCount", search);
		return result;
	}

	@Override
	public int getStateListCount(Search search) {
		int result = session.selectOne("UserMapper.getStateListCount", search);
		return result;
	}

	@Override
	public int getListCount() {
		int result = session.selectOne("UserMapper.getListCount");
		return result;
	}

	@Override
	public int getStateListCount() {
		int result = session.selectOne("UserMapper.getStateListCount");
		return result;
	}

	
}
