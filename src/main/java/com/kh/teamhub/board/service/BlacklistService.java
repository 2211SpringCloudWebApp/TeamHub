package com.kh.teamhub.board.service;

import java.util.List;

import com.kh.teamhub.user.domain.User;



public interface BlacklistService {

	int getListCount();

	List<User> selectBlackList(Integer page);

	int deleteBlacklist(String [] userId);

	

	

}
