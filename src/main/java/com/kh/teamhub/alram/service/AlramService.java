package com.kh.teamhub.alram.service;

public interface AlramService {

	int selectCountAlram(String userId);

	int checkAlram(String alramNo);

	int checkAllAlram(String userId);

}
