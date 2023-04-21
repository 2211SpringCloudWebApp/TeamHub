package com.kh.teamhub.schedule.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.schedule.domain.Schedule;
import com.kh.teamhub.schedule.store.ScheduleStore;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private ScheduleStore sStore;

	@Override
	public int insertSchedule(Schedule schedule) {
		int result = sStore.insertSchedule(schedule);
		return result;
	}
	
	@Override
	public Collection<? extends Schedule> getAllEvents() {
		return sStore.findAllEvents();
	}
	
	@Override
	public Collection<? extends Schedule> getDepartmentEvents(String deptName) {
		return sStore.findDepartmentEvents(deptName);
	}

	@Override
	public Collection<? extends Schedule> getPersonalEvents(String userId) {
		return sStore.findPersonalEvents(userId);
	}

	@Override
	public Schedule selectOneSchedule(int scheduleNo) {
		Schedule schedule = sStore.selectOneSchedule(scheduleNo);
		return schedule;
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		int result = sStore.updateSchedule(schedule);
		return result;
	}

	@Override
	public void deleteSchedule(int scheduleNo) {
		sStore.deleteSchedule(scheduleNo);
	}


	
}
