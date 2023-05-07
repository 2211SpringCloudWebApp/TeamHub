package com.kh.teamhub.alram.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.alram.domain.Alram;

@Repository
public class AlramStoreLogic implements AlramStore{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Alram> selectAlram() {
		List<Alram> aList = session.selectList("AlramMapper.selectAlram");
		return aList;
	}

	@Override
	public int insertAlram(Alram alram) {
		int result = session.insert("AlramMapper.insertAlram", alram);
		return result;
	}

	@Override
	public int selectCountAlram(String userId) {
		int result = session.selectOne("AlramMapper.selectCountAlram", userId);
		return result;
	}
	

}
