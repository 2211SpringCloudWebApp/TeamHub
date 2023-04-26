package com.kh.teamhub.approval.store;

import java.util.List;
import java.util.Map;

import com.kh.teamhub.approval.domain.Approval;
import com.kh.teamhub.approval.domain.ApprovalJoinForm;
import com.kh.teamhub.approval.domain.Search;
import com.kh.teamhub.common.PageInfo;

public interface ApprovalStore {

	int getSearchListCount(Map<String, String> progressMap);

	int getListCount(Map<String, String> progressMap);

	List<ApprovalJoinForm> selectApprovalList(PageInfo pi, Map<String, String> progressMap);

	List<ApprovalJoinForm> selectListByKeword(PageInfo pi, Map<String, String> progressMap);

}
