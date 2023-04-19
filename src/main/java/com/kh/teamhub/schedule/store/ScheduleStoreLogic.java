package com.kh.teamhub.schedule.store;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.schedule.domain.Schedule;

@Repository
public class ScheduleStoreLogic implements ScheduleStore{

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertSchedule(Schedule schedule) {
		int result = session.insert("ScheduleMapper.insertSchedule", schedule);
		return result;
	}
	
	// 전사 일정 가져오기
	public List<Schedule> findAllEvents() {
	    // DB에서 전사일정에 해당하는 데이터를 조회하고, 이를 Event 객체로 매핑하여 반환
	    // 예시: SELECT * FROM events WHERE type = '전사';
	    // 해당 로직을 실제 DB에 맞게 구현해야 함
		 return session.selectList("ScheduleMapper.findAllEvents");
	  }

	@Override
	public Collection<? extends Schedule> findDepartmentEvents(String deptName) {
		return session.selectList("ScheduleMapper.findDepartmentEvents", deptName);
	}

	@Override
	public Collection<? extends Schedule> findPersonalEvents(String userId) {
		return session.selectList("ScheduleMapper.findPersonalEvents", userId);
	}
}
