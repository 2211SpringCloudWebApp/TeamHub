package com.kh.teamhub.board.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.board.domain.Report;

@Repository
public class ReportStoreLogic implements ReportStore {

	@Override
	public int insertReport(SqlSession session, Report report) {
		int result = session.insert("ReportMapper.insertReport", report);
		return result;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("ReportMapper.getListCount");
		return result;
	}

	@Override
	public List<Report> selectReportList(SqlSession session, Integer start) {
		int limit = 15;
		int offset = (start - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Report> rList = session.selectList("ReportMapper.selectReportList", null, rowBounds);
		return rList;
	}

	@Override
	public int deleteReport(SqlSession session, int[] reportNo) {
		Map<String, Object> reportMap = new HashMap<String, Object>();
		reportMap.put("reportNums", reportNo);
		int result = session.delete("ReportMapper.deleteReport", reportMap);
		return result;
	}

}
