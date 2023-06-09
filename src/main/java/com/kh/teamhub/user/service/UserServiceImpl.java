package com.kh.teamhub.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.common.PageInfo;
import com.kh.teamhub.user.domain.OrgUser;
import com.kh.teamhub.user.domain.Search;
import com.kh.teamhub.user.domain.User;
import com.kh.teamhub.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserStore uStore;

	@Override
	public int registerUser(User user) {
		int result = uStore.registerUser(user);
		return result;
	}

	@Override
	public int checkId(String userId) {
		int result = uStore.checkId(userId);
		return result;
	}

	@Override
	public int updateUserInfo(User user) {
		int result = uStore.updateUserInfo(user);
		return result;
	}

	@Override
	public int updateUser(User user) {
		int result = uStore.updateUser(user);
		return result;
	}

	@Override
	public int updateUserState(User user) {
		int result = uStore.updateUserState(user);
		return result;
	}

	@Override
	public int deleteUser(String userId) {
		int result = uStore.deleteUser(userId);
		return result;
	}

	@Override
	public User login(User user) {
		User loginUser = uStore.login(user);
		return loginUser;
	}

	@Override
	public List<User> selectAllUser(PageInfo pi) {
		List<User> uList = uStore.selectAllUser(pi);
		return uList;
	}

	@Override
	public User selectOneById(String userId) {
		User user = uStore.selectOneById(userId);
		return user;
	}

	@Override
	public List<User> selectUserState() {
		List<User> userStateList = uStore.selectUserState();
		return userStateList;
	}

	@Override
	public List<OrgUser> selectOrganization() {
		List<OrgUser> oList = uStore.selectOrganization();
		return oList;
	}

	@Override
	public List<User> selectListByKeyword(PageInfo pi, Search search) {
		List<User> searchList = uStore.selectListByKeyword(pi, search);
		return searchList;
	}

	@Override
	public int getListCount() {
		int result = uStore.getListCount();
		return result;
	}

	@Override
	public int getStateListCount() {
		int result = uStore.getStateListCount();
		return result;
	}

	@Override
	public int getListCount(Search search) {
		int result = uStore.getListCount(search);
		return result;
	}

	@Override
	public int getStateListCount(Search search) {
		int result = uStore.getStateListCount(search);
		return result;
	}

	@Override
	public List<User> selectListByKeyword(Search search) {
		List<User> userStateList = uStore.selectListByKeyword(search);
		return userStateList;
	}
	
	
}
