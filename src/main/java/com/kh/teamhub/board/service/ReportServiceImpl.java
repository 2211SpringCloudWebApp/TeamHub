package com.kh.teamhub.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.board.domain.Report;
import com.kh.teamhub.board.store.ReportStore;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportStore reportStore;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertReport(Report report) {
		int result = reportStore.insertReport(session, report);
		return result;
	}

	@Override
	public int getListCount() {
		int result = reportStore.getListCount(session);
		return result;
	}

	@Override
	public List<Report> selectReportList(Integer start) {
		List<Report> rList = reportStore.selectReportList(session, start);
		return rList;
	}

	@Override
	public int deleteReport(int [] reportNo) {
		int result = reportStore.deleteReport(session, reportNo);
		return result;
	}

}
