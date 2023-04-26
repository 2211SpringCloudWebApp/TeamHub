package com.kh.teamhub.approval.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.approval.domain.Approval;
import com.kh.teamhub.approval.domain.ApprovalJoinForm;
import com.kh.teamhub.approval.domain.Search;
import com.kh.teamhub.common.PageInfo;

@Repository
public class ApprovalStoreLogic implements ApprovalStore{

	@Autowired
	private SqlSession session;

	@Override
	public int getListCount(Map<String, String> progressMap) {
		int result = session.selectOne("ApprovalMapper.getListCount", progressMap);
		System.out.println("storeLogic의 getListCount result값 : " + result);
		return result;
	}
	
	@Override
	public List<ApprovalJoinForm> selectApprovalList(PageInfo pi, Map<String, String> progressMap) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		System.out.println("storeLogic 해쉬맵 : " +progressMap);
		List<ApprovalJoinForm> aList = session.selectList("ApprovalMapper.selectApprovalList", progressMap, rowBounds);
		System.out.println("storeLogic 리스트 : " +aList);
		return aList;
	}
	
	@Override
	public int getSearchListCount(Map<String, String> progressMap) {
		int result = session.selectOne("ApprovalMapper.getSearchListCount", progressMap);
		return result;
	}

	@Override
	public List<ApprovalJoinForm> selectListByKeword(PageInfo pi, Map<String, String> progressMap) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ApprovalJoinForm> aList = session.selectList("ApprovalMapper.selectListByKeword", progressMap, rowBounds);
		return aList;
	}
	
	
}
