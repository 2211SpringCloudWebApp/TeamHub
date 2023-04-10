package com.kh.teamhub.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserStore uStore;
	
	
}
