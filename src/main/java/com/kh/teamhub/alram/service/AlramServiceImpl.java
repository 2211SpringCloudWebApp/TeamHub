package com.kh.teamhub.alram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.alram.store.AlramStore;

@Service
public class AlramServiceImpl implements AlramService{

	@Autowired
	private AlramStore aStore;

	@Override
	public int selectCountAlram(String userId) {
		int result = aStore.selectCountAlram(userId);
		return result;
	}

	@Override
	public int checkAlram(String alramNo) {
		int result = aStore.checkAlram(alramNo);
		return result;
	}

	@Override
	public int checkAllAlram(String userId) {
		int result = aStore.checkAllAlram(userId);
		return result;
	}
	
	
}
