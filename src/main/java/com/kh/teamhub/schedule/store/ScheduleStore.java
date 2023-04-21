package com.kh.teamhub.schedule.store;

import java.util.Collection;
import java.util.List;

import com.kh.teamhub.schedule.domain.Schedule;

public interface ScheduleStore {

	int insertSchedule(Schedule schedule);

	List<Schedule> findAllEvents();

	Collection<? extends Schedule> findDepartmentEvents(String deptName);

	Collection<? extends Schedule> findPersonalEvents(String userId);

	Schedule selectOneSchedule(int scheduleNo);

	int updateSchedule(Schedule schedule);

	void deleteSchedule(int scheduleNo);

}
