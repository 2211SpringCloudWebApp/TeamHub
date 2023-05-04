package com.kh.teamhub.board.service;

import java.util.List;

import com.kh.teamhub.board.domain.Report;

public interface ReportService {

	int insertReport(Report report);

	int getListCount();

	List<Report> selectReportList(Integer page);

	int deleteReport(int [] reportNo);

}
