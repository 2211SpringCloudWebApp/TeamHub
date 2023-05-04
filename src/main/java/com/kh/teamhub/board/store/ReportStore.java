package com.kh.teamhub.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.teamhub.board.domain.Report;

public interface ReportStore {

	int insertReport(SqlSession session, Report report);

	int getListCount(SqlSession session);

	List<Report> selectReportList(SqlSession session, Integer start);

	int deleteReport(SqlSession session, int [] reportNo);

}
