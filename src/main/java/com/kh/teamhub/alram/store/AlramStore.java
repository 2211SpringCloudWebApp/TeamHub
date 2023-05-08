package com.kh.teamhub.alram.store;


import java.util.List;

import com.kh.teamhub.alram.domain.Alram;

public interface AlramStore {


	List<Alram> selectAlram();
	int insertAlram(Alram alram);
	int selectCountAlram(String userId);
	int checkAlram(String alramNo);
	int checkAllAlram(String userId);
	
}
