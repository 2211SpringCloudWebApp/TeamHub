package com.kh.teamhub.approval.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.approval.domain.Approval;
import com.kh.teamhub.approval.domain.ApprovalJoinForm;
import com.kh.teamhub.approval.domain.Search;
import com.kh.teamhub.approval.store.ApprovalStore;
import com.kh.teamhub.common.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	@Autowired
	private ApprovalStore aStore;

	@Override
	public int getSearchListCount(Map<String, String> progressMap) {
		int result = aStore.getSearchListCount(progressMap);
		return result;
	}

	@Override
	public int getListCount(Map<String, String> progressMap) {
		int result = aStore.getListCount(progressMap);
		return result;
	}

	@Override
	public List<ApprovalJoinForm> selectApprovalList(PageInfo pi, Map<String, String> progressMap) {
		List<ApprovalJoinForm> aList = aStore.selectApprovalList(pi, progressMap);
		return aList;
	}

	@Override
	public List<ApprovalJoinForm> selectListByKeword(PageInfo pi, Map<String, String> progressMap) {
		List<ApprovalJoinForm> aList = aStore.selectListByKeword(pi, progressMap);
		return aList;
	}

	@Override
	public int apprGetListCount(Map<String, String> progressMap) {
		int result = aStore.apprGetListCount(progressMap);
		return result;
	}

	@Override
	public Approval selectApproval(String apprNo) {
		Approval appr = aStore.selectApproval(apprNo);
		return appr;
	}
	
}
